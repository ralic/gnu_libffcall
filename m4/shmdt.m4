dnl Copyright (C) 1993-2002 Free Software Foundation, Inc.
dnl This file is free software, distributed under the terms of the GNU
dnl General Public License.  As a special exception to the GNU General
dnl Public License, this file may be distributed as part of a program
dnl that contains a configuration script generated by Autoconf, under
dnl the same distribution terms as the rest of that program.

dnl From Bruno Haible, Marcus Daniels.

AC_PREREQ(2.13)

AC_DEFUN([CL_SHMDT],
[AC_REQUIRE([CL_SHM_H])dnl
AC_BEFORE([$0], [CL_SHM])dnl
if test "$ac_cv_header_sys_shm_h" = yes -a "$ac_cv_header_sys_ipc_h" = yes; then
CL_PROTO([shmdt], [
for x in 'void*' 'char*' 'const void *' 'const char *'; do
if test -z "$have_shmdt_decl"; then
CL_PROTO_TRY([
#include <stdlib.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/shm.h>
], [int shmdt($x addr);], [int shmdt();], [
cl_cv_proto_shmdt_arg1="$x"
have_shmdt_decl=1])
fi
done
], [extern int shmdt ($cl_cv_proto_shmdt_arg1);])
AC_DEFINE_UNQUOTED(SHMDT_ADDR_T,$cl_cv_proto_shmdt_arg1)
fi
])