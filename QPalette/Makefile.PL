use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPalette',
    'VERSION_FROM' => 'QPalette.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
