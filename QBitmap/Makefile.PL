use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QBitmap',
    'VERSION_FROM' => 'QBitmap.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
