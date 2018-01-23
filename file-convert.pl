#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use Encode;

open(my $fh, "d:\\data\\test1.txt") || die "failed to open input file.\n";
open(my $fh_out, ">d:\\data\\test2.txt") || die "failed to open output file\n";

while(<$fh>){
    my $line = encode("utf8", decode("gbk", $_));
    $line =~ s/[ ]+$//;
    $line =~ s/[ ]+/|/g;
    print $fh_out $line;
}

close($fh);
close($fh_out);


