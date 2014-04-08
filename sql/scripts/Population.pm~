#!/usr/bin/perl 
#-wT
use Text::CSV;
use DBI;
use Time::localtime;
use IO::File;
#use strict;
#use warnings;
#Developer Name: Zakeria Hassan <zak.hassan1010@gmail.com>
#Date: Mar 26, 2014
use Data::Dumper qw(Dumper);
use String::Util 'trim';

#$ENV{PATH} = "/bin:/usr/bin";
#delete @ENV{'IFS', 'CDPATH', 'ENV', 'BASH_ENV'};

=head



=cut

sub loadPopulation {
    my @batchrows=();
    my $count = 0 ;
    my $file= shift or die "File not found";
    open (my $fh, '<', $file) or die "Could not open '$file' $!\n";
    
    my @province=();
    my @year09=();
    my @year10=();
    my @year11=();
    my @year12=();
    my @year13=();
    
    while(my $line =<$fh>){
        $count++;
            if ($count <= 1 ) {
                next;
            }
        chomp $line;
        my @fields = split ";" , $line ;
        
    push( @province, trim($fields[0]) );
    push( @year09, trim($fields[1]) );
    push( @year10, trim($fields[2]) );
    push( @year11, trim($fields[3]) );
    push( @year12, trim($fields[4]) ) ;
    push( @year13, trim($fields[5]) );

    }

    for(my $i= 0; $i < scalar @province; $i++) {

my $statement = <<SQL;
INSERT INTO `test`.`PopulationByYearByProvince` 
(`province`,
`year09`,
`year10`,
`year11`,
`year12`,
`year13`)
VALUES 
( $province[$i],
 $year09[$i],
 $year10[$i], 
$year11[$i], 
$year12[$i], 
$year13[$i] );
SQL

 print $statement;
 push(@batchrows, $statement);
}


=head

#print "INSRT INTO " $fields[0];
$lifeExpectency =~ s/(?<!\w) //g;
$lifeExpectency =~ s/\n//g;
#if( $count == 1 ) {
#    next;
#}

print "$lifeExpectency \n";

            #print "GOT FIRST COLUMN: $field1\n";

            
print Dumper \@province;
print Dumper \@year09;
print Dumper \@year10;
print Dumper \@year11;
print Dumper \@year12;
print Dumper \@year13;
=cut

}


