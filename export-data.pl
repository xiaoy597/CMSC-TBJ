#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use File::Path;
use Cwd;
use File::Spec::Functions;


sub export_data {
    my ($table_name) = @_;

    my $work_dir = $ENV{'CMSC_DATA_DIR'};
    my $script_dir = catdir($work_dir, "scripts");
    my $data_dir = catdir($work_dir, "data");
    my $log_dir = catdir($work_dir, "logs");


    my $old_dir = getcwd();

    mkpath($data_dir);
    mkpath($log_dir);

    chdir($data_dir);

    my $script_file = catfile($script_dir, $table_name . ".fexp");
    my $log_file = catfile($log_dir, $table_name . ".log");

    print "fexp < $script_file > $log_file\n";

    my $data_file = catfile($data_dir, $table_name . ".tmp");


    chdir($old_dir);

}

export_data("hello");
