use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QRegion',
    'VERSION_FROM' => 'QRegion.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
