use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QSize',
    'VERSION_FROM' => 'QSize.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
