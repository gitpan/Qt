use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QLabel',
    'VERSION_FROM' => 'QLabel.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
