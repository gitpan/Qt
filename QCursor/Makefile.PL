use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QCursor',
    'VERSION_FROM' => 'QCursor.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
