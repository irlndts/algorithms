#!/usr/bin/perl -w


use strict;
use Time::HiRes qw/time/;

my $N = 10;

#инициализируем массив
my @arr;
for (0 .. $N){
	push (@arr,int(rand($N)));
}

my $start = time;
@arr = sortheap(@arr);
my $stop = time;

printf ("Время выполнения для $N элементов: %.4f",$stop-$start);

sub sortheap{
	my @arr = @_;
	$N=@arr+0;
	if($N>1){
		while($sh+2!=$N){
			$b=undef;
			for my$i(0..$N-1){
				if($i*2+2+$sh<$N){
					if($out[$i+$sh]gt$out[$i*2+1+$sh] || $out[$i+$sh]gt$out[$i*2+2+$sh]){
						if($out[$i*2+1+$sh]lt$out[$i*2+2+$sh]){
							($out[$i*2+1+$sh],$out[$i+$sh])=($out[$i+$sh],$out[$i*2+1+$sh]);
							$b=1;
						}elsif($out[$i*2+2+$sh]lt$out[$i*2+1+$sh]){
							($out[$i*2+2+$sh],$out[$i+$sh])=($out[$i+$sh],$out[$i*2+2+$sh]);
							$b=1;
						}
					}elsif($out[$i*2+2+$sh]lt$out[$i*2+1+$sh]){
						($out[$i*2+1+$sh],$out[$i*2+2+$sh])=($out[$i*2+2+$sh],$out[$i*2+1+$sh]);
						$b=1;
					}
				}elsif($i*2+1+$sh<$N && $out[$i+$sh]gt$out[$i*2+1+$sh]){
					($out[$i+$sh],$out[$i*2+1+$sh])=($out[$i*2+1+$sh],$out[$i+$sh]);
					$b=1;
				}
			}
			++$sh if!$b;
			last if$sh+2==$N;
		}

		
	

	return @arr;
}
