use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QFrame',
    'VERSION_FROM' => 'QFrame.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
