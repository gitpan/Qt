use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QColor',
    'VERSION_FROM' => 'QColor.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
