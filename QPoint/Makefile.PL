use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPoint',
    'VERSION_FROM' => 'QPoint.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
