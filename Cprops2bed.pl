#!/bin/perl
die "Usage: cprops2bed.pl *.cprops >*.bed\n" if(@ARGV<1);
my $in=$ARGV[0];
open Data1,"<$in";
while(<Data1>){
	chomp $_;
	@a=split/ /,$_;
	@b=split/:::/,$a[0];
	if($b[0] eq $scaf){
		$start=$end;
		$end=$start+$a[2];
		print "$scaf\t$start\t$end\t$a[0]\t0\t+\n";
	}
	else{
		$scaf=$b[0];
		$start=0;
		$end=$a[2];
		print "$scaf\t$start\t$end\t$a[0]\t0\t+\n";
	}
}
close Data1;
