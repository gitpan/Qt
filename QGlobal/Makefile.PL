use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QGlobal',
    'VERSION_FROM' => 'QGlobal.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
