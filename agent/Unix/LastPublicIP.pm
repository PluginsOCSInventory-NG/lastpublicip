###############################################################################
## OCSINVENTORY-NG
## Copyleft Guillaume PROTET 2010
## Web : http://www.ocsinventory-ng.org
##
## This code is open source and may be copied and modified as long as the source
## code is always made freely available.
## Please refer to the General Public Licence http://www.gnu.org/ or Licence.txt
################################################################################

package Ocsinventory::Agent::Modules::LastPublicIP;

use JSON;
use LWP::UserAgent;
use Data::Dumper;

sub new {

    my $name="lastpublicip"; # Name of the module

    my (undef,$context) = @_;
    my $self = {};

    #Create a special logger for the module
    $self->{logger} = new Ocsinventory::Logger ({
        config => $context->{config}
    });
    $self->{logger}->{header}="[$name]";
    $self->{context}=$context;
    $self->{structure}= {
        name => $name,
        start_handler => undef,    #or undef if don't use this hook
        prolog_writer => undef,    #or undef if don't use this hook
        prolog_reader => undef,    #or undef if don't use this hook
        inventory_handler => $name."_inventory_handler",    #or undef if don't use this hook
        end_handler => undef    #or undef if don't use this hook
    };
    bless $self;
}

######### Hook methods ############

sub lastpublicip_inventory_handler {


     my $self = shift;
     my $logger = $self->{logger};
     my $common = $self->{context}->{common};

     $logger->debug("Yeah you are in lastpublicip_inventory_handler:)");
     
     my $ua = LWP::UserAgent->new;
     my $req = HTTP::Request->new(GET => "https://ipinfo.io/json");
     $req->content_type('application/json');
     my $res=$ua->request($req);

     my $info=decode_json($res->content);

     push @{$common->{xmltags}->{LASTPUBLICIP}},
     {
         IP    => [$info->{ip}],
         CITY  => [$info->{city}],
         REGION  => [$info->{region}],
         COUNTRY  => [$info->{country}],
         LOC  => [$info->{loc}],
         POSTAL  => [$info->{postal}],
         TIMEZONE  => [$info->{timezone}],
         ORG   => [$info->{org}],
     };
}

1;
