use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QEvent',
    'VERSION_FROM' => 'QEvent.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
