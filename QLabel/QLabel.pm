package QLabel;

use strict;
use vars qw($VERSION @ISA @EXPORT);
use QGlobal qw($AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom
	       $AlignVCenter $AlignCenter $SingleLine $DontClip $ExpandTabs
	       $ShowPrefix $WordBreak $GrayText $DontPrint);

require Exporter;
require DynaLoader;

require QFrame;
require QPixmap;
require QSize;

@ISA = qw(Exporter DynaLoader QFrame);
@EXPORT = qw($AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom
	     $AlignVCenter $AlignCenter $SingleLine $DontClip $ExpandTabs
	     $ShowPrefix $WordBreak $GrayText $DontPrint);

$VERSION = '0.02';
bootstrap QLabel $VERSION;

1;
__END__

=head1 NAME

QLabel - Interface to the Qt QLabel class

=head1 SYNOPSIS

C<use QLabel;>

Inherits QFrame.

Requires QPixmap and QSize.

=head2 Member functions

new,
alignment,
autoResize,
margin,
pixmap,
setAlignment,
setAutoResize,
setMargin,
setNum,
setText,
setPixmap,
text

=head1 DESCRIPTION

QLabel has been completely interfaced.

=head1 EXPORTED

The following scalar values are exported into the user's namespace:

$AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom $AlignVCenter
$AlignCenter $SingleLine $DontClip $ExpandTabs $ShowPrefix $WordBreak
$GrayText $DontPrint

=head1 CAVEATS

I might create C<%Align> for the hell of it. You never know.

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
