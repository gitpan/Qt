use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QWMatrix',
    'VERSION_FROM' => 'QWMatrix.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
