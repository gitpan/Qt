use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QButton',
    'VERSION_FROM' => 'QButton.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
