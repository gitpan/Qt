use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QBrush',
    'VERSION_FROM' => 'QBrush.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
