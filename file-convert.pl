#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Encode;

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

file_convert('d:\data\test11.txt', 'd:\data\test2.txt');
