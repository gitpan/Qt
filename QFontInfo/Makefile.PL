use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QFontInfo',
    'VERSION_FROM' => 'QFontInfo.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
