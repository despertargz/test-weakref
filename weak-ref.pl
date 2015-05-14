use strict;
use warnings;
use lib '/';
use Tiger;
use Scalar::Util 'weaken';



my $keep = {};

a();
b();
c();

print "----------------\n";
$keep = {};

if (1) {
	my $tiger = Tiger->new();
	print("leaving if (normal)...\n");
}

if (1) {
	my $tiger = Tiger->new();
    $keep->{one} = $tiger;
	print("leaving if (strong)...\n");
}

if (1) {
	my $tiger = Tiger->new();
    $keep->{two} = $tiger;
    weaken $keep->{two};
	print("leaving if (weak)...\n");
}

print "waiting...";
my $i = <>;

sub a {
	my $tiger = Tiger->new();
	print("leaving sub (normal)...\n");
}

sub b {
	my $tiger = Tiger->new();
	$keep->{one} = $tiger;
	print("leaving sub (strong ref)...\n");
}

sub c {
	my $tiger = Tiger->new();
	$keep->{two} = $tiger;
	weaken $keep->{two};
	print("leaving sub (weak ref)...\n");
}

