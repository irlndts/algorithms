#!/usr/bin/perl -w

use strict;
use warnings;
#use classes::DATA; 

my $str = " -3+ 1+1+2) * 3 "; 

my %prec = (
	'-u'=> 5,
	'*' => 4,
	'/' => 3,
	'+' => 2,
	'-' => 2,
	'(' => 1,
	'' => 9,
   );

my %right=('-u'=>1);

print shunting_yard($str);

#алгоритм сортировочной станции для разбора математического выражения 
#на входе строка с выражением
#на выходие разобранная строка или 0 (какая-то ошибка)
sub shunting_yard{
	my ($str) = @_;

	#получить все элементы отбросив мусор
	my @tokens = grep {! m/^$/} split (/\ *([\+\-\/\(\)]|\d+\.\d+|\d+) */, $str);


	my $result = undef;
	my @operators_stack;
	my @output;

	my $last="";
	foreach my $token (@tokens) {
		#!$token and next;

		if($token eq '-' and getprec($last)>=0) {$token='-u';}
		if($token=~/^\d+$|^\d+\.\d+$/) { #числовые значени в т.ч. типа float 
			if($last=~/^\d+$|^\d+\.\d+$/ || $last eq ")") {
				print "Value tokens must be separated by an operator\n";
				return 0;
			}
			push(@output, $token); #кладем значение в левую часть
		} elsif($token eq '(') {
			push(@operators_stack, $token);
		} elsif($token eq ')') {
			while(scalar @operators_stack && $operators_stack[-1] ne '(') { #сбрасываем все значения между ( ) в левую часть
				push(@output, pop(@operators_stack));
			}
			unless (scalar @operators_stack && pop(@operators_stack) eq '(') #скобка больше не нужна, удаляем её
			{
				print "Can't find (\n"; 
				return 0;
			}; 
		} elsif((my $pr=getprec($token))>0) { #сортируем токеныё
			if(exists $right{$token}) {
				while(scalar @operators_stack>0 && $pr<getprec($operators_stack[-1])) {
					push(@output, pop(@operators_stack));
				}
			} else {
				while(scalar @operators_stack>0 && $pr<=getprec($operators_stack[-1])) {
					push(@output, pop(@operators_stack));
				}
			}
			push(@operators_stack, $token);
		} else {
			print "Unknown token: \"$token\"\n";
			return 0;
		}
		$last=$token;
	}
	# достигли конца входной строки, собираем левую и правую часть воедино 
	while(scalar @operators_stack>0) {
		push(@output, pop(@operators_stack));
	}

	foreach my $token (@output) { #готовим ответ, если значение -N, то минус обозначаем как _1*
		if($token eq '-u') {$result .= '_1* ';}
		else {$result .= "$token ";}
	}
	return $result." p";

}

sub getprec {
	my ($op)=@_;
	return exists $prec{$op}?$prec{$op}:-1;
}
 
