package QLayout;

use strict;
use vars qw($VERSION @ISA @EXPORT);

require Exporter;
require DynaLoader;
require QGlobal;

require QMenuBar;
require QObject;

@ISA = qw(Exporter DynaLoader QObject);
@EXPORT = qw(%Direction);

$VERSION = '0.01';
bootstrap QLayout $VERSION;


package QBoxLayout;

use strict;
use vars qw(@ISA);

@ISA = qw(QLayout);
*Direction = \%QLayout::Direction;


package QGridLayout;

use strict;
use vars qw(@ISA);

@ISA = qw(QLayout);

1;
__END__

=head1 NAME

QLayout - Interface to the Qt QLayout, QBoxLayout and QGridLayout classes

=head1 SYNOPSIS

=head2 QLayout

C<use QLayout;>

Inherits QObject.

Requires QMenuBar.

=head2 Member functions

activate,
defaultBorder,
freeze,
setMenuBar

=head2 QBoxLayout

Inherits QLayout.

=head2 Member functions

new,
addLayout,
addSpacing,
addStretch,
addStrut,
addWidget,
direction

=head2 QGridLayout

Inherits QLayout.

=head2 Member functions

new,
addLayout,
addMultiCellWidget,
addWidget,
setColStretch,
setRowStretch

=head1 DESCRIPTION

What you see is what you get.

=head1 EXPORTED

The C<%Direction> hash is exported on behalf of QBoxLayout. It contains
all of the constants within QBoxLayout.

=head1 AUTHOR

Ashley Winters <jql@accessone.com>
