use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QRect',
    'VERSION_FROM' => 'QRect.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
