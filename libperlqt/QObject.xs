/*
 * PObject definitions and sig/slot implementation.
 *
 * Copyright (C) 1997, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README file
 */

#include "pqt.h"
#include "pobject.h"
#include "virtual.h"

HV *Signals = NULL;
HV *Slots = NULL;
HV *MetaObjects = NULL;

char *getPerlSuperClass(char *clname) {
    dSP;
    int count;
    SV *ret;

    PUSHMARK(sp);
    XPUSHs(sv_2mortal(newSVpv(clname, 0)));
    PUTBACK;

    count = perl_call_pv("QObject::find_superclass", G_SCALAR);
    SPAGAIN;
    if(count != 1) croak("Bad perl_call_pv, bad");
    ret = POPs;
    PUTBACK;

    return SvTRUE(ret) ? SvPV(ret, na) : 0;
}

QMetaData *initMetaData(HV *hv) {
    if(!hv || HvKEYS(hv) < 1) return NULL;
    int keys = HvKEYS(hv);
    QMetaData *tbl = new QMetaData[keys];

    SV *value;
    char *key;
    I32 klen;

    hv_iterinit(hv);
    for(int i = 0; i < keys; i++) {
	value = hv_iternextsv(hv, &key, &klen);
	SvREFCNT_inc(value);
	tbl[i].name = SvPV(value, na);
	tbl[i].ptr = stub_func(tbl[i].name);
    }

    return tbl;
}

QMetaObject *metaObjectSetup(char *clname) {
    if(hv_exists(MetaObjects, clname, strlen(clname))) {
	SV **ret = hv_fetch(MetaObjects, clname, strlen(clname), 0);
	if(ret) {
//	    ret = hv_fetch((HV *)rv_check(*ret), "MetaObject", 10, 0);
//	    if(ret) return (QMetaObject *)SvIV(*ret);
	    QMetaObject *obj = (QMetaObject *)SvIV(*ret);
//	    warn("returning %p which is a (%p) %s which is derived from (%p) %s which is %p\n", obj, obj->className(), obj->className(), obj->superClassName(), obj->superClassName(), obj->superClass());
	    return (QMetaObject *)SvIV(*ret);
	}
	return NULL;
    }

    SV **svp;
    HV *slothv = NULL, *signalhv = NULL; //, *metaData = newHV();
    int slot_keys = 0, signal_keys = 0;
    QMetaData *slot_tbl = NULL, *signal_tbl = NULL;
    QMetaObject *metaObj;
    char *superclass;

    char *s = getPerlSuperClass(clname);
    if(!s) croak("Class '%s' is not derived from QObject\n", clname);

    superclass = (char *)malloc(strlen(s)+1);
    strcpy(superclass, s);

//    safe_hv_store(MetaObjects, clname, newRV_noinc((SV *)metaData));

    svp = hv_fetch(Signals, clname, strlen(clname), 0);
    if(svp) {
	signalhv = (HV *)rv_check(*svp);
	signal_keys = HvKEYS(signalhv) > 0 ? HvKEYS(signalhv) : 0;
//	if(signal_keys > 0) signal_tbl = new QMetaData[signal_keys];
//	else signal_keys = 0;
    }
    svp = hv_fetch(Slots, clname, strlen(clname), 0);
    if(svp) {
	slothv = (HV *)rv_check(*svp);
	slot_keys = HvKEYS(slothv) > 0 ? HvKEYS(slothv) : 0;
//	if(slot_keys > 0) slot_tbl = new QMetaData[slot_keys];
//	if(slot_keys < 0) slot_keys = 0;	// Paranoia. They're after me.
    }
/*
    SV *value;
    char *key;
    I32 klen;

    if(slothv) {
	hv_iterinit(slothv);
	for(int i = 0; i < slot_keys; i++) {
	    value = hv_iternextsv(slothv, &key, &klen);
	    SvREFCNT_inc(value);
	    slot_tbl[i].name = SvPV(value, na);
	    slot_tbl[i].ptr = (QMember)&pQtSigSlot::sI;  // Change this
	}
    }
    if(signalhv) {
	hv_iterinit(signalhv);
	for(int i = 0; i < signal_keys; i++) {
	    value = hv_iternextsv(signalhv, &key, &klen);
	    SvREFCNT_inc(value);
	    signal_tbl[i].name = SvPV(value, na);
	    signal_tbl[i].ptr = (QMember)&pQtSigSlot::sI;  // Change this
	}
    }

*/
    slot_tbl = initMetaData(slothv);
    signal_tbl = initMetaData(signalhv);
//    warn("clname = %s = %p, superclass = %s = %p\n", clname, clname, superclass, superclass);
    metaObj = new QMetaObject(clname, superclass,
	slot_tbl, slot_keys,
	signal_tbl, signal_keys);
//    safe_hv_store(metaData, "MetaObject", newSViv((IV)metaObj));
    safe_hv_store(MetaObjects, clname, newSViv((IV)metaObj));
    return metaObj;
}

const char *PObject::className() { return getQtClassName(); }

void PObject::timerEvent(QTimerEvent *event) {
    PObject_timerEvent(event);
}

void virtualize::PObject_timerEvent(QTimerEvent *event) {
    SV *obj = obj_check(getQtObject());
    GV *fglob = gv_fetchmethod(SvSTASH(obj), "timerEvent");
    CV *func = GvCV(fglob);
    if(CvXSUB(func)) {
	pQtTHIS(Object)->protected_timerEvent(event);
	return;
    }
    SV *ptr = objectify_ptr(event, "QTimerEvent");
    callQtMethod(func, ptr);
    SvREFCNT_dec(ptr);
}
