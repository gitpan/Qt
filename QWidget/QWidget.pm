package QWidget;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require DynaLoader;
require QObject;
require QEvent;
require QFont;
require QPaintDevice;
require QPixmap;
require QPoint;
require QRect;
require QSize;

@ISA = qw(Exporter DynaLoader QObject QPaintDevice);
@EXPORT = qw(%FocusPolicy);

$VERSION = '0.02';
bootstrap QWidget $VERSION;

1;
__END__

=head1 NAME

QWidget - Interface to the Qt QWidget class

=head1 SYNOPSIS

C<use QWidget;>

Inherits QObject and QPaintDevice.

Requires QEvent, QFont, QPixmap, QPoint, QRect, and QSize.

=head2 Member functions

new,
adjustSize,
backgroundColor,
backgroundPixmap,
caption,
childrenRect,
clearFocus,
close,
drawText,
erase,
focusPolicy,
font,
foregroundColor,
frameGeometry,
geometry,
grabKeyboard,
grabMouse,
hasFocus,
hasMouseTracking,
height,
hide,
icon,
iconText,
iconify,
isActiveWindow,
isDesktop,
isEnabled,
isFocusEnabled,
isModal,
isPopup,
isTopLevel,
isUpdatesEnabled,
isVisible,
keyboardGrabber,
lower,
mapFromGlobal,
mapFromParent,
mapToGlobal,
mapToParent,
maximumSize,
minimumSize,
mouseGrabber,
move,
pos,
raise,
recreate,
rect,
releaseKeyboard,
releaseMouse,
repaint,
resize,
scroll,
setActiveWindow,
setBackgroundColor,
setBackgroundPixmap,
setCaption,
setEnabled,
setFixedSize,
setFocus,
setFocusPolicy,
setFont,
setGeometry,
setIcon,
setIconText,
setMaximumSize,
setMinimumSize,
setMouseTracking,
setSizeIncrement,
setStyle,
setUpdatesEnabled,
show,
size,
sizeHint,
sizeIncrement,
style,
topLevelWidget,
update,
width,
winId,
x,
y

=head2 Virtual functions

mouseMoveEvent, mousePressEvent, mouseReleaseEvent, paintEvent, resizeEvent

=head1 DESCRIPTION

Every function made available to Perl is meant to be interfaced identically
to C++ Qt except in the cases stated below.

=over 4

=item mouseMoveEvent(mouseevent)

This is a virtual function, meant to be reimplemented in your own
classes. It is only available through QWidget.

=item mousePressEvent(mouseevent)

This is a virtual function, meant to be reimplemented in your own
classes. It is only available through QWidget.

=item mouseReleaseEvent(mouseevent)

This is a virtual function, meant to be reimplemented in your own
classes. It is only available through QWidget.

=item paintEvent(paintevent)

This is a virtual function, meant to be reimplemented in your own
classes. It is only available through QWidget.

=item resizeEvent(resizeevent)

This is a virtual function, meant to be reimplemented in your own
classes. It is only available through QWidget.

=back

=head1 SEE ALSO

QWidget(3qt)

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
