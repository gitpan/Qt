/*
 * Routines needed globally in PerlQt.
 *
 * Copyright (C) 1997, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README file
 */

#include "pqt.h"

SV *obj_check(SV *sv, char *message = "Invalid object") {
    SV *rv = rv_check(sv, message);
    if(!SvOBJECT(rv) || SvTYPE(rv) != SVt_PVHV)
        croak(message);
    return rv;
}

SV *rv_check(SV *sv, char *message = "Not a reference") {
    if(!sv || !SvROK(sv)) croak(message);
    return SvRV(sv);
}

SV *safe_hv_store(HV *hash, char *key, SV *value) {
    register SV **svp = hv_store(hash, key, strlen(key), value, 0);
    if(!svp) croak("Hash store store of '%s' failed", key);
    return *svp;
}

SV *safe_hv_fetch(HV *hash, char *key, char *message) {
    register SV **svp = hv_fetch(hash, key, strlen(key), 0);
    if(!svp) croak(message);
    return *svp;
}

static char *parse_clname(char *clname) {
    char *tmp = clname;

    if(!tmp) croak("NULL classname");
    if(toLOWER(*tmp) == 'p') *tmp = 'Q';
    while(isALNUM(*tmp)) tmp++;
    *tmp = 0;

    return clname;
}

SV *objectify_ptr(void *ptr, char *clname, int delete_on_destroy = 0) {
    if(!ptr) return &sv_undef;

    HV *obj = newHV();

    safe_hv_store(obj, "THIS", newSViv((IV)ptr));
    if(delete_on_destroy)
	safe_hv_store(obj, "DELETE", &sv_yes);

    return sv_bless(newRV_noinc((SV *)obj),
		    gv_stashpv(parse_clname(clname), true));
}

void *extract_ptr(SV *rv, char *clname) {
    HV *obj = (HV *)obj_check(rv);
    SV *THIS = safe_hv_fetch(obj, "THIS", "Could not access \"THIS\" element");

    return (void *)SvIV(THIS);
}

/*
SV *objectify_ptr(void *ptr, char *clname, int delete_on_destroy = 0) {
//    warn("Objectifying %p\n", ptr);
    SV *ptr_sv = newSViv((IV)ptr);
    HV *self = newHV();
    hv_store(self, "this", 4, ptr_sv, 0);
    HV *obj = newHV();
    SV *rv = newRV_noinc((SV *)obj);
    clname = parse_clname(clname);
    HV *clstash = gv_stashpv(clname, true);

//    hv_store(self, "this", 4, ptr_sv, 0);
//    warn("ptr_sv = %p\n", (void *)SvIV(ptr_sv));
    if(delete_on_destroy) {
//	warn("Delete on destroy %p\n", ptr);
//	warn("rv = %p, obj = %p, self = %p, ptr_sv = %p\n", rv, obj, self, ptr_sv);
	hv_store(self, "deleteme", 8, &sv_yes, 0);
    }
    hv_store(obj, "this", 4, newRV_noinc((SV *)self), 0);

//    warn("Objectified\n");
    return sv_bless(rv, clstash);
}

void *extract_ptr(SV *obj, char *clname) {
//    warn("extracting\n");
    HV *hv = (HV *)obj_check(obj);
    SV **svp = hv_fetch(hv, "this", 4, 0);
    if(!svp) croak("Invalid object (this pointer could not be retrieved)");
    HV *self = (HV *)rv_check(*svp);
    svp = hv_fetch(self, "this", 4, 0);
    if(!svp) croak("Invalid object (this pointer could not be retrieved)");
//warn("rv = %p, obj = %p, self = %p, ptr_sv = %p\n", obj, hv, self, *svp);
//    warn("this = %p\n", (void *)SvIV(*svp));
//    warn("Extracted %p\n", (void *)SvIV(*svp));
    return (void *)SvIV(*svp);
}


SV *objectify_ptr(void *ptr, char *clname, int delete_on_destroy = 0) {
    SV *ptr_sv = newSV(0);            // The SV that will hold ptr
    HV *obj = newHV();                // the internal tied object
    SV *rv = newRV_noinc((SV *)obj);  // a reference to be blessed
    HV *hv = newHV();                 // The object to be tied/returned
    clname = parse_clname(clname);
    HV *clstash = gv_stashpv(clname, true);

    if(delete_on_destroy) {
//	sv_magic(ptr_sv, sv_bless(newRV_noinc(newSViv((IV)ptr)),
//		 gv_stashpv("Qt::Scalar", true)), 'q', Nullch, 0);
//	warn("Delete on destroy %p\n", ptr);
	safe_hv_store(obj, "deleteme", newSViv((IV)ptr));
//	warn("set\n");
    }
    sv_setiv(ptr_sv, (IV)ptr);
    SvREADONLY_on(ptr_sv);
    safe_hv_store(obj, "this", ptr_sv);

//    sv_bless((SV *)rv, clstash);
    sv_bless((SV *)rv, gv_stashpv("Qt::Hash", true));
    hv_magic(hv, (GV *)rv, 'P');    // Tie the hash (sv)

    return sv_bless((SV *)newRV_noinc((SV *)hv), clstash);
}


void *extract_ptr(SV *obj, char *clname) {
    SV *rv = obj_check(obj), **self;
    MAGIC *mg = NULL;
    clname = parse_clname(clname);

    if(SvMAGICAL(rv) && (mg = mg_find(rv, 'P')))
	rv = obj_check(mg->mg_obj, "Non-reference used as tied hash object");
    if(!sv_derived_from(obj, clname))
	croak("%s wasn't derived from %s", HvNAME(SvSTASH(rv)), clname);

    self = hv_fetch((HV *)rv, "this", 4, 0);
    if(!self) croak("Could not access \"this\" element");

    return (void *)SvIV(*self);
}
*/
char *find_signal(SV *obj, char *signal) {
    dSP;
    int count;
    SV *ret;

    PUSHMARK(sp);
    XPUSHs(obj);
    XPUSHs(sv_2mortal(newSVpv(signal, 0)));
    PUTBACK;

    count = perl_call_pv("signals::find_signal", G_SCALAR);
    SPAGAIN;
    if(count != 1) croak("Bad perl_call_pv, bad");
    ret = POPs;
    PUTBACK;

    return SvTRUE(ret) ? SvPV(ret, na) : 0;
}

char *find_slot(SV *obj, char *slot) {
    dSP;
    int count;
    SV *ret;

    PUSHMARK(sp);
    XPUSHs(obj);
    XPUSHs(sv_2mortal(newSVpv(slot, 0)));
    PUTBACK;

    count = perl_call_pv("slots::find_slot", G_SCALAR);
    SPAGAIN;
    if(count != 1) croak("Bad perl_call_pv, bad");
    ret = POPs;
    PUTBACK;

    return SvTRUE(ret) ? SvPV(ret, na) : 0;
}
