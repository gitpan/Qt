use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'Qt',
    'VERSION_FROM' => 'Qt.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-Ilibperlqt/include -I/usr/lib/qt/include',
    'DIR'	=> [ qw(QAccel
			QApplication
			QBitmap
			QBrush
			QButton
			QClipboard
			QColor
			QCursor
			QEvent
			QFont
			QFontInfo
			QFontMetrics
			QFrame
			QGlobal
			QImage
			QLabel
			QLCDNumber
			QObject
			QPaintDevice
			QPainter
			QPalette
			QPen
			QPicture
			QPixmap
			QPoint
			QPointArray
			QPushButton
			QRangeControl
			QRect
			QRegion
			QScrollBar
			QSize
			QWidget
			QWMatrix) ],
);
