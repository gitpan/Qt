package QPaintDevice;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require DynaLoader;
require QGlobal;

@ISA = qw(Exporter DynaLoader Qt::Hash);
@EXPORT = qw();

$VERSION = '0.01';
bootstrap QPaintDevice $VERSION;

1;
__END__

=head1 NAME

QPaintDevice - Interface to the Qt QPaintDevice class

=head1 SYNOPSIS

C<use QPaintDevice;>

=head1 DESCRIPTION

Gets inherited.

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
