use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'	=> 'libperlqt',
    'VERSION'	=> '0.02',
    'LIBS'	=> [''],
    'CC'	=> 'g++',
    'INC'	=> '-Iinclude -I$(QTDIR)/include',
    'OBJECT'	=> 'libperlqt$(OBJ_EXT)
		    virtual$(OBJ_EXT)
		    sigslot$(OBJ_EXT)
		    QObject$(OBJ_EXT)
		    QWidget$(OBJ_EXT)',
);

sub MY::install {
    '
install: all
	cp $(INST_DYNAMIC) /usr/local/lib
'
}
