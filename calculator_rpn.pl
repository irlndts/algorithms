#!/usr/bin/perl -w

my $dispatch_table = {
	'+' => sub {
		my @stack = @_;
		push(@stack,(pop(@stack) + pop(@stack)));
		return @stack;
	},
	'-' => sub {
		my @stack = @_;
		push(@stack, - (pop(@stack) - pop(@stack)));
		return @stack;
	},
	'*' => sub {
		my @stack = @_;
		push(@stack,(pop(@stack) * pop(@stack)));
		return @stack;
	},

	'/' => sub {
		my @stack = @_;
		my ($a,$b) = (pop(@stack),pop(@stack));
		push(@stack,($b/$a));
		return @stack;
	},

};


print rpn_result('1 _1* 1 2 + 3 * +'),"\n";


#реализация калькулятора обратной польской нотации
#на входе выражение разделеное пробелами
#на выходе результат
sub rpn_result{
	my $expr = shift;
	my @tokens = split(" ",$expr);
	my @stack;
	foreach (@tokens){
		if (/^\d+$|^\d+\.\d+$/) {push(@stack,$_);}
		elsif (defined $dispatch_table->{$_}){ @stack = $dispatch_table->{$_}->(@stack);}
		elsif (/^_1\*$/) { push(@stack,(pop(@stack) * -1));}
		else { print "Неизвестное значение: $_\n"; return 0;};
	}
	return pop(@stack);
}

