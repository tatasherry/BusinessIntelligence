#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;

my $file="../flatfiles/lifeExpectByProvince.csv";
my @list= split("/",$file);
print Dumper \@list;
print $list[2];






