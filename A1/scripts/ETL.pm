package ETL;
use Term::ANSIColor;
use Text::CSV;
use IO::File;
use String::Util 'trim';
use strict;
use warnings;

BEGIN {
    require Exporter;
    our $VERSION = 0.1;
    our @ISA = qw (Exporter);
    our @EXPORT = qw (loadBabyNames loadLifeExpect loadPopulation);
    our @EXPORT_OK   = qw($debug);

}

our $debug=0;

sub loadLifeExpect {
    my @batchrows;
    my $count = 0 ;
    my $csv = Text::CSV->new({sep_char => ';'});
    my $file = shift or die "File not found";

  open (my $fh, '<', $file) or die "Could not open '$file' $!\n";
    while(my $line =<$fh>){
        chomp $line;

        if($csv->parse($line)){

  my @fields = $csv->fields();

  my @timeat= split /to/, $fields[0] ;

 my ($province, $lifeExpectency, $province, $male_count , $female_count);
 
my @file_path=split("/",$file);
if($file_path[2] eq "lifeExpectByProvince.csv"){
   $province     = trim($fields[1]);
   $male_count   = trim($fields[2]);
   $female_count = trim($fields[3]);
	#Error condition check
	$count++;
	if( ! defined $male_count or $count == 1 ) {
	    next;
	}

	$lifeExpectency="";
$lifeExpectency= <<SQL;
INSERT INTO `test`.`LifeExpectency`
(`year_from`,
`year_to`,
`province`,
`male_count`,
`female_count`)
VALUES
($timeat[0],
$timeat[1],
'$province',
$male_count,
$female_count );
SQL

} else {
   $male_count   = trim($fields[1]);
   $female_count = trim($fields[2]);

#Error condition check
$count++;
if( ! defined $male_count or $count == 1 ) {
    next;
}

$lifeExpectency="";
$lifeExpectency= <<SQL;
INSERT INTO `test`.`LifeExpectency`
(`year_from`,
`year_to`,
`province`,
`male_count`,
`female_count`)
VALUES
($timeat[0],
$timeat[1],
"",
$male_count,
$female_count );
SQL
}

#print "INSRT INTO " $fields[0];
$lifeExpectency =~ s/(?<!\w) //g;
$lifeExpectency =~ s/\n//g;
if($debug==1){
    print "$lifeExpectency \n";
}
push(@batchrows, $lifeExpectency);
        }
    }
    
    return @batchrows;
}




sub loadBabyNames{
    my @batchrows=();
    my $count = 0 ;
    my ($file,$gender) = @_;
    open (my $fh, '<', $file) or die "Could not open '$file' $!\n";
    while(my $line =<$fh>){
        $count++;
            if ($count <= 2 ) {
                next;
            }
        chomp $line;
        my @fields = split "," , $line ;
        
my $year = trim($fields[0]);
my $name = trim($fields[1]);
my $freq = trim($fields[2]);


my $lifeExpectency = <<SQL;
INSERT INTO `test`.`OntarioTopBabyNames`
(`year`,
`name`,
`frequency`,
`gender`)
VALUES
($year,
 '$name',
 $freq,
 $gender);
SQL

$lifeExpectency =~ s/(?<!\w) //g;
$lifeExpectency =~ s/\n//g;

if($debug == 1){
print "$lifeExpectency \n";
}
push(@batchrows, $lifeExpectency);

    }
    
    return @batchrows;

}


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
        my $y09=trim($fields[1]);
	$y09 =~ s/\,//g; 

        my $y10=trim($fields[2]);
	$y10 =~ s/\,//g; 

        my $y11=trim($fields[3]);
	$y11 =~ s/\,//g; 

        my $y12=trim($fields[4]);
	$y12 =~ s/\,//g; 

        my $y13=trim($fields[5]);
	$y13 =~ s/\,//g; 


    push( @province, trim($fields[0]) );
    push( @year09, trim($y09) );
    push( @year10, trim($y10) );
    push( @year11, trim($y11) );
    push( @year12, trim($y12) ) ;
    push( @year13, trim($y13) );

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
VALUES ( '$province[$i]', $year09[$i], $year10[$i], $year11[$i], $year12[$i], $year13[$i] );
SQL

if($debug==1){
    print $statement;
}
push(@batchrows,$statement);
    }
return @batchrows;
}




1;

