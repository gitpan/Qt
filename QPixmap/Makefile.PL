use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPixmap',
    'VERSION_FROM' => 'QPixmap.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
