#ifndef PRANGECT_H
#define PRANGECT_H

/*
 * Declaration of the PRangeControl class
 *
 * Copyright (C) 1997, Ashley Winters <jql@accessone.com>
 *
 * You may distribute under the terms of the LGPL as specified in the
 * README file
 */

#undef bool
#include "qrangect.h"
#include "pqt.h"

class PRangeControl : public QRangeControl {
public:
    PRangeControl() {}
    PRangeControl(int minValue, int maxValue, int lineStep, int pageStep,
		  int value) :
	QRangeControl(minValue, maxValue, lineStep, pageStep, value) {}
};

#endif  // PRANGECT_H
