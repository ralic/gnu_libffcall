/* Sample prototype for a trampoline. */

/*
 * Copyright 1995-2006 Bruno Haible, <bruno@clisp.org>
 *
 * This is free software distributed under the GNU General Public Licence
 * described in the file COPYING. Contact the author if you don't have this
 * or can't live with it. There is ABSOLUTELY NO WARRANTY, explicit or implied,
 * on this software.
 */

#define function  (int (*) ()) 0xbabebec0
#define data      (void*)      0x73554711

#ifdef __i386__
register void* env __asm__("%ecx");
#endif
#ifdef __m68k__
register void* env __asm__("a0");
#endif
#if defined(__mips__) || defined(__mipsn32__) || defined(__mips64__)
register void* env __asm__("$2");
#endif
#ifdef __sparc__
register void* env __asm__("%g2");
#endif
#ifdef __alpha__
register void* env __asm__("$1");
#endif
#ifdef __hppa__
register void* env __asm__("%r29");
#endif
#ifdef __arm__
register void* env __asm__("r12");
#endif
#ifdef __powerpc__
register void* env __asm__("r11");
#endif
#ifdef __x86_64_x32__
register void* env __asm__("r10");
#endif
#ifdef __s390__
register void* env __asm__("r0");
#endif

int tramp ()
{ env = data;
  return (*function)();
}

int jump ()
{ goto *function; }

