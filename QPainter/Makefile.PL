use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPainter',
    'VERSION_FROM' => 'QPainter.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
