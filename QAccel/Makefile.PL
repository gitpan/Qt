use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QAccel',
    'VERSION_FROM' => 'QAccel.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
