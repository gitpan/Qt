use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPaintDevice',
    'VERSION_FROM' => 'QPaintDevice.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
