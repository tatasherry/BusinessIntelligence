#!/usr/bin/perl -wT
use strict;
use DBI;
use Time::localtime;
use IO::File;
#Developer Name: Zakeria Hassan <zak.hassan1010@gmail.com>
#Date: Mar 26, 2014

$ENV{PATH} = "/bin:/usr/bin";
delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV'};



sub main(){
   my $fh = IO::File->new();
    if ($fh->open("< ../flatfiles/lifeExpect.csv")) {
        print <$fh>;
        $fh->close;
    }

}

sub db(){
    my $dbh = DBI->connect('DBI:mysql:database=test;host=localhost', 'root', '')
      or die "Cannot connect: " . $DBI::errstr;
}

db();
