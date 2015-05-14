package Tiger;

use strict;
use warnings;

sub new {
	return bless {};
}

sub DESTROY {
	print "Destroying...\n";
}

return 1;


