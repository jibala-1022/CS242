#!/usr/bin/perl

print "#__________Random String Generator__________#\n";

my $file = 'randstrgen.txt';
print "Reading the file <randstrgen.txt> ...........\n";
open(FH, '<', $file) or die "Couldn't open file";
my $alphabet = <FH>;
close(FH);

print "Enter count: ";
my $count = <STDIN>;
print "Enter length: ";
my $length = <STDIN>;

chomp $alphabet;
chomp $count;
chomp $length;

my @alphalist = split("", $alphabet);
my $strlen = @alphalist;
my $repeat = '';

do{
    my $mylen = 0;
    my $prevchar = '';
    print "Here is a random string....";
    while($mylen < $length){
        if($count > $length - $mylen){
            $count = $length - $mylen;
        }
        my $randind = int(rand($strlen));
        my $currchar = $alphalist[$randind];
        my $randlen = int(rand($count - 1) + 1);
        if($currchar ne $prevchar){
            $mylen += $randlen;
            foreach(1..$randlen){
                print "$currchar";
            }
            $prevchar = $currchar;
        } 
    }
    print "\n";
    print "Need a different permutation? (Press Y) : ";
    $repeat = <STDIN>;
    chomp $repeat;
}while($repeat eq 'y');