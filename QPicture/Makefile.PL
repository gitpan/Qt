use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QPicture',
    'VERSION_FROM' => 'QPicture.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
