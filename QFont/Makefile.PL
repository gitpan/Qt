use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QFont',
    'VERSION_FROM' => 'QFont.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
