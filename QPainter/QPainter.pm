package QPainter;

use strict;
use vars qw($VERSION @ISA @EXPORT);
use QGlobal qw($AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom
	       $AlignVCenter $AlignCenter $SingleLine $DontClip $ExpandTabs
	       $ShowPrefix $WordBreak $GrayText $DontPrint

	       %RasterOp);

require Exporter;
require DynaLoader;

require QColor;
require QBrush;
require QFont;
require QFontInfo;
require QFontMetrics;
require QPaintDevice;
require QPen;
require QPicture;
require QPixmap;
require QPoint;
require QPointArray;
require QRect;
require QRegion;
require QWMatrix;

@ISA = qw(Exporter DynaLoader Qt::Hash);
@EXPORT = qw($AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom
	     $AlignVCenter $AlignCenter $SingleLine $DontClip $ExpandTabs
	     $ShowPrefix $WordBreak $GrayText $DontPrint

	     %RasterOp %BGMode);

$VERSION = '0.01';
bootstrap QPainter $VERSION;

1;
__END__

=head1 NAME

QPainter - Interface to the Qt QPainter class

=head1 SYNOPSIS

C<use QPainter;>

Requires QColor, QBrush, QFont, QFontInfo, QFontMetrics, QPaintDevice,
QPen, QPicture, QPixmap, QPoint, QPointArray, QRect, QRegion, QWMatrix

=head2 Member functions

new,
backgroundColor,
backgroundMode,
begin,
boundingRect,
brushOrigin,
clipRegion,
device,
drawArc,
drawChord,
drawEllipse,
drawLine,
drawLineSegments,
drawPie,
drawPixmap,
drawPoint,
drawPolygon,
drawPolyline,
drawQuadBezier,
drawRect,
drawRoundRect,
drawText,
drawWinFocusRect,
end,
eraseRect,
fillRect,
font,
fontInfo,
fontMetrics,
hasClipping,
hasViewXForm,
hasWorldXForm,
isActive,
lineTo,
moveTo,
pen,
rasterOp,
resetXForm,
restore,
rotate,
save,
scale,
setBackgroundColor,
setBackgroundMode,
setBrush,
setBrushOrigin,
setClipping,
setClipRect,
setClipRegion,
setFont,
setPen,
setRasterOp,
setViewXForm,
setViewport,
setWindow,
setWorldMatrix,
setWorldXForm,
shear,
translate,
viewport,
window,
worldMatrix,
xForm,
xFormDev

=head1 DESCRIPTION

All functions listed have every prototype version supported, mostly.
Any internal arguments are unavailable to PerlQt programmers.

=head1 EXPORTED

The following scalar variables are exported into the user's namespace on
behalf of C<QPainter::drawText()>

$AlignLeft $AlignRight $AlignHCenter $AlignTop $AlignBottom $AlignVCenter
$AlignCenter $SingleLine $DontClip $ExpandTabs $ShowPrefix $WordBreak
$GrayText $DontPrint

=head1 CAVEATS

Hmm... C<%Align>...

=head1 SEE ALSO

QPainter(3qt), QColor(3), QBrush(3), QFont(3), QPen(3)

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
