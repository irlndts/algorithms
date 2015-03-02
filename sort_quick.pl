#!/usr/bin/perl -w

use strict;
use Time::HiRes qw/time/;

my $N = 1000;
#инициализируем массив
my @arr;
for (0 .. $N){
	push(@arr,int(rand($N)));
};

my $start = time;

@arr = sort_quick(\@arr,0,$#arr);
my $stop = time;
#print join(" ",@arr),"\n";
printf("Время сортировки $N элементов: %.3f",($stop-$start));

#медиана посередине
sub sort_quick{
	my $arr_ref = shift;
	my @arr = @{$arr_ref}; #исследуемым массив
	my $start = shift; #начало исследуемого отрезка
	my $end = shift; #конец исследуемого отрезка
	
	my $m = $arr[int(($start+$end)/2)]; #медиана в середине
	
	my ($i,$j) = ($start,$end);

	do{
		while ($arr[$i] < $m) {$i++;};
		while ($arr[$j] > $m) {$j--;};

		if ($i <= $j){
			if ($arr[$i] > $arr[$j]) {($arr[$i],$arr[$j]) = ($arr[$j],$arr[$i]);};
			$i++;
			$j--;
		};
	}while($i <= $j);

	@arr = sort_quick(\@arr,$start,$j) if ($start < $j);
	@arr = sort_quick(\@arr,$i,$end) if ($end > $i);

	return @arr;
}
