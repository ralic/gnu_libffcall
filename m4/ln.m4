dnl -*- Autoconf -*-
dnl Copyright (C) 1993-2008 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.  As a special exception to the GNU General
dnl Public License, this file may be distributed as part of a program
dnl that contains a configuration script generated by Autoconf, under
dnl the same distribution terms as the rest of that program.

dnl From Bruno Haible, Marcus Daniels, Sam Steingold.

AC_PREREQ([2.13])

AC_DEFUN([CL_PROG_LN],
[AC_CACHE_CHECK([how to make hard links], [cl_cv_prog_LN], [
rm -f conftestdata conftestfile
echo data > conftestfile
if ln conftestfile conftestdata 2>/dev/null; then
  cl_cv_prog_LN=ln
else
  cl_cv_prog_LN="cp -p"
fi
rm -f conftestdata conftestfile
])
LN="$cl_cv_prog_LN"
AC_SUBST([LN])dnl
])

AC_DEFUN([CL_PROG_LN_S],
[AC_REQUIRE([CL_PROG_LN])dnl
dnl Make a symlink if possible; otherwise try a hard link. On filesystems
dnl which support neither symlink nor hard link, use a plain copy.
AC_CACHE_CHECK([whether ln -s works], [cl_cv_prog_LN_S_works], [dnl
rm -f conftestdata
if ln -s X conftestdata 2>/dev/null; then
  cl_cv_prog_LN_S_works=yes
else
  cl_cv_prog_LN_S_works=no
fi
rm -f conftestdata
])
if test $cl_cv_prog_LN_S_works = yes; then
  LN_S="ln -s"
else
  LN_S="$cl_cv_prog_LN"
fi
AC_SUBST([LN_S])])
