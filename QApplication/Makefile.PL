use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QApplication',
    'VERSION_FROM' => 'QApplication.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
