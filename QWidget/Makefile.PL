use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QWidget',
    'VERSION_FROM' => 'QWidget.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
