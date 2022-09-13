#!/usr/bin/perl

$alphabet = <STDIN>;
$count = <STDIN>;
$length = <STDIN>;

chomp $alphabet;
chomp $count;
chomp $length;

@alphalist = split("", $alphabet);
$strlen = @alphalist;
$mylen = 0;
$prevchar = '';

while($mylen < $length){
    if($count > $length - $mylen){
        $count = $length - $mylen;
    }
    $randind = int(rand($strlen));
    $currchar = $alphalist[$randind];
    $randlen = int(rand($count - 1) + 1);
    if($currchar ne $prevchar){
        $mylen += $randlen;
        foreach(1..$randlen){
            print "$currchar";
        }
        $prevchar = $currchar;
    } 
}