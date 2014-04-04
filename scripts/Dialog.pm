package Dialog;
use Term::ANSIColor;
use strict;
use warnings;

BEGIN{
    require Exporter;

    our $VERSION = 0.1;
    our @ISA = qw (Exporter);
    our @EXPORT = qw (s_msg, s_check, s_error);

}

sub s_msg {
    my $successMsg= shift or return ;
    print color 'bold green';
    print " ( " . $successMsg . " ) \n ";
    print color 'reset';
}
sub s_check {
    print color 'bold green';
    print "[√]";
    print color 'reset';
}

sub s_error {
    print color 'bold red';
    print "[x]" ;
    print color 'reset';
}


END{

}

return 1;
