use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'QClipboard',
    'VERSION_FROM' => 'QClipboard.pm',
    'LIBS'	=> ['-lperlqt -lqt'],
    'CC'	=> 'g++',
    'INC'	=> '-I../libperlqt/include -I/usr/lib/qt/include',
);
