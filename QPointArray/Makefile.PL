use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPointArray',
    'VERSION_FROM' => 'QPointArray.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
