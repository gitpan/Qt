/*
 * PerlQt interface to qaccel.h
 *
 * Copyright (C) 1997, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README file
 */

#include "paccel.h"
#include "sigslot.h"

MODULE = QAccel		PACKAGE = QAccel

PROTOTYPES: ENABLE

PAccel *
PAccel::new(parent, name = 0)
    QWidget *parent
    char *name

void
QAccel::clear()

bool
QAccel::connectItem(id, reciever, member)
    int id
    QObject *reciever
    char *member
    CODE:
    char *s = find_signal(ST(2), member);
    SV *memb = newSViv(s ? SIGNAL_CODE : SLOT_CODE);
    sv_catpv(memb, member);
    if(s) reciever = new pQtSigSlot(ST(2), s);
    else {
	s = find_slot(ST(2), member);
	if(s) reciever = new pQtSigSlot(ST(2), s);
    }
    RETVAL = THIS->connectItem(id, reciever, SvPVX(memb));
    OUTPUT:
    RETVAL

uint
QAccel::count()

int
QAccel::findKey(key)
    int key

int
QAccel::insertItem(key, id = -1)
    int key
    int id

bool
QAccel::isEnabled()

bool
QAccel::isItemEnabled(id)
    int id

int
QAccel::key(id)
    int id

void
QAccel::removeItem(id)
    int id

void
QAccel::setEnabled(enable)
    bool enable

void
QAccel::setItemEnabled(id, enable)
    int id
    bool enable