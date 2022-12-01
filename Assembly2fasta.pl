#!/bin/perl
die "Usage: perl assembly2fasta.pl <*.assembly> <scaffolds.fa> <final.fa>\n" if(@ARGV<3);
my $asm=$ARGV[0];
my $scaf=$ARGV[1];
my $out=$ARGV[2];
open Data1,"<$asm";
open Data2,"<$scaf";
open Data3,">$out";
my $num=0;
my @a;
while(<Data2>){chomp $_;$a[$num]=$_;$num++;}
my %a=@a;
my %b;
my $num=1;
$b{263}="N" x 500;
while(<Data1>){
chomp $_;
if($_=~/(>\S+) (\d+)/){unless($_=~/^>hic_gap/){$b{$2}=$a{$1};}}
else{
print Data3 ">HiC_scaffold_$num\n";$num++;
@c=split(/ /,$_);
foreach my $c(@c){
if($c=~/^\d+/){print Data3 "$b{$c}";}
elsif($c=~/^-(\d+)/){$d=reverse $b{$1};$d=~tr/ATCG/TAGC/;print Data3 "$d";}
else{next;}
}
print Data3 "\n";
}
}
close Data1;
close Data2;
close Data3;
