use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QObject',
    'VERSION_FROM' => 'QObject.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
