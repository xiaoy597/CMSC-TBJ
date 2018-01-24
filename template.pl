#!/usr/bin/perl
######################################################################
#程序名称:XXXXXXXXX0200.pl
#版本信息:v1.0
#描述简介:
#修改时间             修改人             简述
#
######################################################################      
use strict;
use warnings FATAL => 'all';
use Encode;
use File::Path;
use Cwd;
use File::Spec::Functions;

unshift(@INC, "$ENV{AUTO_HOME}/bin");
require etl_pub_all;
require etl_pub_btq;
require etl_pub_his;

######################################################################
#Variable Section

######################################################################
#main function

my $DIR = $ARGV[0];
my $str = "";
my $dbname = "";
my $state = "";
my $log_file = ETL_PUB_ALL::openlogfile($DIR);

open SAVEOUT, ">&STDOUT";
open SAVEERR, ">&STDERR";

#记录日志
open(STDOUT, ">>$log_file");
open(STDERR, ">>$log_file");

my $start_time = ETL_PUB_ALL::getTime("yyyymmdd hh:mi:ss");
print "Begin to write log file:$start_time\n";

#数据加载
my $ret = ETL_PUB_BTQ::runBteqCommand();
print "ETL_PUB_BTQ::runBteqCommand() = $ret\n";

my $end_time = ETL_PUB_ALL::getTime("yyyymmdd hh:mi:ss");
print "End to write log file:$end_time\n";

close(STDOUT);
close(STDERR);

#日志展示
open STDOUT, ">&SAVEOUT";
open STDERR, ">&SAVEERR";
print "\n";
$str = `sed -n '/Begin to write log file:$start_time/,/End to write log file:$end_time/'p $log_file`;
print "$str";

print "##############################\nlogfile print over!!\n##############################\n";
#执行状态入库
my $r = ETL_PUB_ALL::parseDirInfo($DIR);
my $sys = $r->{SYS};
my $tmp_tab = $r->{JOBNAME};
my $txdate = $r->{TXDATE};

my $indc = substr($tmp_tab, 0, 3);
my $jobname = substr($tmp_tab, 4);

if ($indc eq "SUM" or $indc eq "KPI" or $indc eq "SPE" or $indc eq "PUB") {$dbname = $ETL_PUB_ALL::AUTO_nsPUBMart;}    #nsPUBMART
elsif ($indc eq "SMS") {$dbname = $ETL_PUB_ALL::AUTO_nsSMSMart;}    #nsSMSMART
elsif ($indc eq "RMS") {$dbname = $ETL_PUB_ALL::AUTO_nsRMSMart;}    #nsRMSMART
elsif ($indc eq "SDM") {$dbname = $ETL_PUB_ALL::AUTO_nsSMSDM;}    #nsSMSDM
elsif ($indc eq "RDS") {$dbname = $ETL_PUB_ALL::AUTO_nsRMSDM;}    #nsRMSDM
elsif ($indc eq "PRD") {$dbname = $ETL_PUB_ALL::AUTO_nsPDATA;}    #nsPDATA

if ($ret == 0) {$state = "success";}
else {$state = "failed";}

my $ret1 = ETL_PUB_ALL::insertLOGtable($sys, $jobname, $dbname, $txdate, $start_time, $end_time, $state);
print "ETL_PUB_ALL::innerLOGtable= $ret1\n";

# 导出数据
if ($ret == 0) {
    print "Exporting data ...\n";
    $ret = export_data($jobname);
}

close(STDOUT);
close(STDERR);

exit($ret);


sub export_data {
    my ($table_name) = @_;

    my $work_dir = $ENV{'CMSC_EXPORT_HOME'};
    my $script_dir = catdir($work_dir, "scripts");
    my $data_dir = catdir($work_dir, "data");
    my $log_dir = catdir($work_dir, "logs");

    my $old_dir = getcwd();

    mkpath($data_dir);
    mkpath($log_dir);

    chdir($data_dir);

    my $script_file = catfile($script_dir, $table_name . ".fexp");
    my $log_file = catfile($log_dir, $table_name . ".log");

    my $ret = system("fexp < $script_file 1>$log_file 2>&1");
    if ($ret != 0) {
        chdir($old_dir);
        return $ret;
    }

    my $data_file1 = catfile($data_dir, $table_name . ".tmp");
    my $data_file2 = catfile($data_dir, $table_name . ".txt");

    file_convert($data_file1, $data_file2);

    unlink($data_file1);

    chdir($old_dir);

}

sub file_convert {
    my ($input_file, $output_file) = @_;

    open(my $fh, $input_file) || die "failed to open input file.\n";
    open(my $fh_out, ">$output_file") || die "failed to open output file\n";

    while (<$fh>) {
        my $line = encode("utf8", decode("gbk", $_));
        $line =~ s/[ ]+$//;
        $line =~ s/[ ]+/|/g;
        print $fh_out $line;
    }

    close($fh);
    close($fh_out);

}