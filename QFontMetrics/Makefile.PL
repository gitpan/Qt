use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QFontMetrics',
    'VERSION_FROM' => 'QFontMetrics.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
