package QGroupBox;

use strict;
use vars qw($VERSION @ISA);

require DynaLoader;
require QGlobal;

require QFrame;

@ISA = qw(DynaLoader QFrame);

$VERSION = '0.01';
bootstrap QGroupBox $VERSION;

1;
__END__

=head1 NAME

QGroupBox - Interface to the Qt QGroupBox class

=head1 SYNOPSIS

C<use QGroupBox;>

Inherits QFrame.

=head2 Member functions

new,
alignment,
setAlignment,
setTitle,
title

=head1 DESCRIPTION

What you see is what you get.

=head1 CAVEATS

The Align constants aren't exported from this class. That's probably more
of a bug.

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
