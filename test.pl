use lib ".";
use strict;
use Math::BigFloat;
use Data::Dumper;
my $MBI = 'Math::BigInt::Calc';

print "platform baselen is ".$MBI->_base_len."\n";

print "test 1, proper import\n";
my $num = bless( {"_m" => [4995822,1],"_es" => "-","base_len" => 7,"_p" => -3,"_e" => [3],"sign" => "+"}, 'Math::BigFloat' );
print "bstr num should be 14995.822, is ".$num->bstr."\n";
print "raw num should be 14995.822, is $num\n";

print "\n\n";

print "test2, proper constructor\n";
my $bnum = Math::BigFloat->new("14995.822");
print "bstr num should be 14995.822, is ".$bnum->bstr."\n";
print "raw num should be 14995.822, is $bnum\n";

print "\n\n";

print "test 3, proper dump/eval\n";
open FILE, "+>testfile.txt";
print FILE Dumper($bnum);
close FILE;
my $newobj = do "testfile.txt";
print "dumped/imported object should be 14995.822, is ".$newobj."\n";