use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QRangeControl',
    'VERSION_FROM' => 'QRangeControl.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
