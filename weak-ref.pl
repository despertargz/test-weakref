use strict;
use warnings;
use lib '/';
use Tiger;
use Scalar::Util 'weaken';



my $keep = {};

a();
b();
c();

print "waiting...";
my $i = <>;

sub a {
	my $tiger = Tiger->new();
	print("leaving a...\n");
}

sub b {
	my $tiger = Tiger->new();
	$keep->{one} = $tiger;
	print("leaving b (strong ref)...\n");
}

sub c {
	my $tiger = Tiger->new();
	$keep->{two} = $tiger;
	weaken $keep->{two};
	print("leaving c (weak ref)...\n");
}

