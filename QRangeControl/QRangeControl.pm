package QRangeControl;

use strict;
use vars qw($VERSION @ISA);

require DynaLoader;
require QGlobal;

@ISA = qw(DynaLoader Qt::Hash);

$VERSION = '0.01';
bootstrap QRangeControl $VERSION;

1;
__END__

=head1 NAME

QRangeControl - Interface to the Qt QRangeControl class

=head1 SYNOPSIS

C<use QRangeControl;>

=head2 Member functions

new, setRange, setValue

=head1 DESCRIPTION

=over 4

=item QRangeControl->new()

Direct interface.

=item $rangectl = QRangeControl->new(minValue, maxValue, lineStep, pageStep, value)

Direct interface.

=item $rangectl->setRange(minValue, maxValue)

Direct interface.

=item $rangectl->setValue(value)

Direct interface.

=back

=head1 SEE ALSO

QRangeControl(3qt)

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
