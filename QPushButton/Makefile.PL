use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPushButton',
    'VERSION_FROM' => 'QPushButton.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
