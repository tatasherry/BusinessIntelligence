#!/usr/bin/perl -wT
use strict;
use DBI;
use Time::localtime;
use IO::File;
#Developer Name: Zakeria Hassan <zak.hassan1010@gmail.com>
#Date: Mar 26, 2014

$ENV{PATH} = "/bin:/usr/bin";
delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV'};



sub extract{
    my $url= shift or die;
    my $fh = IO::File->new();

   if ($fh->open("< ". $url)) {
        print <$fh>;
        $fh->close;
    }

}

sub db{
    my $dbh = DBI->connect('DBI:mysql:database=test;host=localhost', '', '')
      or die "Cannot connect: " . $DBI::errstr;
  #my $sth = $dbh->prepare('SELECT * FROM people WHERE lastname = ?')
  #             or die "Couldn't prepare statement: " . $dbh->errstr;
extract("../flatfiles/lifeExpect.csv");

}

db();
