/*
 * PerlQt interface to qbitmap.h
 *
 * Copyright (C) 1997, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README file
 */

#include "pbitmap.h"

MODULE = QBitmap		PACKAGE = QBitmap

PROTOTYPES: ENABLE

PBitmap *
PBitmap::new(...)
    CASE: items == 1
	CODE:
	RETVAL = new PBitmap();
	OUTPUT:
	RETVAL
    CASE: !sv_isobject(ST(1)) && SvPOK(ST(1))
	PREINIT:
	char *fileName = SvPV(ST(1), na);
	char *format = (items > 2) ? SvPV(ST(2), na) : 0;
	CODE:
	RETVAL = new PBitmap(fileName, format);
	OUTPUT:
	RETVAL
    CASE: items > 2 && !sv_isobject(ST(1))
	PREINIT:
	int w = SvIV(ST(1));
	int h = SvIV(ST(2));
	bool clear = (items > 3) ? (SvIV(ST(3)) ? TRUE : FALSE) : FALSE;
	CODE:
	RETVAL = new PBitmap(w, h, clear);
	OUTPUT:
	RETVAL
    CASE: sv_isobject(ST(1))
	PREINIT:
	QSize *size = pextract(QSize, 1);
	bool clear = (items > 2) ? (SvIV(ST(2)) ? TRUE : FALSE) : FALSE;
	CODE:
	RETVAL = new PBitmap(*size, clear);
	OUTPUT:
	RETVAL

PBitmap *
QBitmap::xForm(matrix)
    QWMatrix *matrix
    CODE:
    RETVAL = new PBitmap(THIS->xForm(*matrix));
    OUTPUT:
    RETVAL
