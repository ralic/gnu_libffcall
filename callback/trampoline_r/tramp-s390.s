/* Trampoline for s390 CPU */

/*
 * Copyright 1995, 2016-2017 Bruno Haible, <bruno@clisp.org>
 * Copyright 2001 Gerhard Tonn, <gt@debian.org>
 *
 * This is free software distributed under the GNU General Public Licence
 * described in the file COPYING. Contact the author if you don't have this
 * or can't live with it. There is ABSOLUTELY NO WARRANTY, explicit or implied,
 * on this software.
 */

/* Available registers: r0, r1. */

.globl _tramp
_tramp:
	bras    %r1,.LTN0_0
.LT0_0:
.LC0:
	.long   1934968593
.LC1:
	.long   0xbabebec0
.LTN0_0:
	l       %r0,.LC0-.LT0_0(%r1)
	l       %r1,.LC1-.LT0_0(%r1)
	br      %r1
