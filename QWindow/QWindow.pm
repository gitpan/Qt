package QWindow;

use strict;
use vars qw($VERSION @ISA);

require DynaLoader;
require QGlobal;

require QObject;

@ISA = qw(DynaLoader QObject);

$VERSION = '0.01';
bootstrap QWindow $VERSION;

1;
__END__

=head1 NAME

QWindow - Interface to the Qt QWindow class

=head1 SYNOPSIS

C<use QWindow;>

Inherits QObject.

=head1 DESCRIPTION

Empty.

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
