#!/usr/bin/perl -w

use strict;
use Time::HiRes qw/time/;

#инициализируем массив
my @arr;
for (0 .. 10000){
	push(@arr,int(rand(1000)));
};

my $start = time;
@arr = sort_bubbles(@arr); #вызов алгоритма
my $stop = time;

printf ("%.6f",$stop-$start);#сколько ушло времни

#print join(' ',@arr); #распечатать отсортированный массив



#Реализация алгоритма
sub sort_bubbles{
	my @arr = @_;
	my $length = @arr-1;;
	for (0 .. @arr){
		for (my $j = 0; $j < $length; $j++){
			if ($arr[$j] > $arr[$j+1]) {($arr[$j+1],$arr[$j]) = ($arr[$j],$arr[$j+1]);}
		};
		$length--;
	};
	return @arr;
}
