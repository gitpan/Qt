use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QImage',
    'VERSION_FROM' => 'QImage.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
