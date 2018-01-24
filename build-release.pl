#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use File::Copy;
use File::Copy::Recursive qw(dircopy);
use Time::localtime;
use File::Path;
use Archive::Zip  qw( :ERROR_CODES :CONSTANTS );

my $tc = localtime(time());
my $time = sprintf("%4d%02d%02d", $tc->year + 1900, $tc->mon + 1, $tc->mday);

rmtree('target') if (-e 'target');

my $release_dir = "target/release-$time";

mkpath($release_dir);

dircopy('sql-template', "$release_dir/sql");
dircopy('fexp-script', "$release_dir/fexp-script");

mkpath("$release_dir/perl");
open(my $sql_dir, "$release_dir/sql") || die "Unable to open sql dir.\n";
my @sql_files = readdir($sql_dir);
for my $sql_f (@sql_files) {
    if ($sql_f =~ /\.sql/) {
        my $perl_f = $sql_f;
        $perl_f =~ s/\.sql/.pl/;

        copy("template.pl", "$release_dir/perl/$perl_f");
    }
}
close($sql_dir);

copy('README.txt', "$release_dir/README.txt");

chdir('target');

my $zip = Archive::Zip::Archive->new();

$zip->addTree("release-$time", "release-$time");
die "Save zip file failed." unless ($zip->writeToFileNamed("tbj-$time.zip") == AZ_OK);
