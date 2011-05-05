#!/usr/bin/perl

use utf8;
use POSIX;

$outfile='train.corpus';

if ( $ARGV[0] ) { $infile=$ARGV[0]; } else { exit; }


open(IN, "<$infile") or die ("need output file name");
open(OUT, ">$outfile") or die ("need output file name");

$preline='';
while (my $inline = <IN>)
{
        chomp $inline;
        utf8::decode($inline);

        $inline=~s/^\s+//;
	if (!$inline) {next;}
	if ($inline=~/[а-я][А-Я]/) {print "skip: $inline\n"; next;}
	if ($inline=~/\d/) {print "skip: $inline\n"; next;}

	utf8::encode($inline);
	print OUT '<s> '.$inline.' </s>'."\n";
}

######################
sub uprint {
        my ($vtxt)=@_;
        utf8::encode($vtxt);
        print $vtxt;
}
