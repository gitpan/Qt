use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPen',
    'VERSION_FROM' => 'QPen.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
