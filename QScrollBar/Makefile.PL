use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QScrollBar',
    'VERSION_FROM' => 'QScrollBar.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
