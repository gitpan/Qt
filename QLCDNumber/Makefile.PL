use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QLCDNumber',
    'VERSION_FROM' => 'QLCDNumber.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
