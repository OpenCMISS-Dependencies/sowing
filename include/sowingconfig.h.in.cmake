/* include/sowingconfig.h.in.  Generated from configure.in by autoheader.  */

/* Define to 1 if you don't have `vprintf' but do have `_doprnt.' */
#cmakedefine HAVE_DOPRNT 1

/* Define to 1 if you have the <fcntl.h> header file. */
#cmakedefine HAVE_FCNTL_H 1

/* Define to 1 if you have the `getcwd' function. */
#cmakedefine HAVE_GETCWD 1

/* Define to 1 if you have the `gethostname' function. */
#cmakedefine HAVE_GETHOSTNAME 1

/* Define to 1 if you have the `getwd' function. */
#cmakedefine HAVE_GETWD 1

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine HAVE_INTTYPES_H 1

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine HAVE_MEMORY_H 1

/* Define to 1 if you have the `mkdir' function. */
#cmakedefine HAVE_MKDIR 1

/* Define to 1 if you have the <netdb.h> header file. */
#cmakedefine HAVE_NETDB_H 1

/* Define to 1 if you have the <pwd.h> header file. */
#cmakedefine HAVE_PWD_H 1

/* Define to 1 if you have the `readlink' function. */
#cmakedefine HAVE_READLINK 1

/* Define to 1 if you have the `realpath' function. */
#cmakedefine HAVE_REALPATH 1

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#cmakedefine HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine HAVE_STRING_H 1

/* Define to 1 if you have the `sysinfo' function. */
#cmakedefine HAVE_SYSINFO 1

/* Define to 1 if you have the <sys/param.h> header file. */
#cmakedefine HAVE_SYS_PARAM_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#cmakedefine HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/systeminfo.h> header file. */
#cmakedefine HAVE_SYS_SYSTEMINFO_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#cmakedefine HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <time.h> header file. */
#cmakedefine HAVE_TIME_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#cmakedefine HAVE_UNISTD_H 1

/* Define to 1 if you have the `vprintf' function. */
#cmakedefine HAVE_VPRINTF 1

/* Define if memory tracing is desired */
#cmakedefine MEMORY_TRACING

/* Define if memory tracing is required */
#cmakedefine MEMORY_TRACING_REQUIRED

/* Define to the address where bug reports for this package should be sent. */
#define PACKAGE_BUGREPORT

/* Define to the full name of this package. */
#define PACKAGE_NAME ${PACKAGE_NAME}

/* Define to the full name and version of this package. */
#define PACKAGE_STRING ${PACKAGE_STRING}

/* Define to the one symbol short name of this package. */
#define PACKAGE_TARNAME

/* Define to the version of this package. */
#define PACKAGE_VERSION

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#cmakedefine TIME_WITH_SYS_TIME 1

/* Define to 1 if your <sys/time.h> declares `struct tm'.
Appears to be unused in sowing codebase! */ 
#cmakedefine TM_IN_SYS_TIME 1

/* Define to empty if `const' does not conform to ANSI C. */
#cmakedefine const

/* Define to the equivalent of the C99 'restrict' keyword, or to
   nothing if this is not supported.  Do not define if restrict is
   supported directly.  */
#define restrict ${RESTRICT_KEYWORD}

/* Work around a bug in Sun C++: it does not support _Restrict, even
   though the corresponding Sun C compiler does, which causes
   "#define restrict _Restrict" in the previous line.  Perhaps some future
   version of Sun C++ will work with _Restrict; if so, it'll probably
   define __RESTRICT, just as Sun C does.  */
#if defined __SUNPRO_CC && !defined __RESTRICT
# define _Restrict
#endif

/* Define to `int' if <sys/types.h> doesn't define. */
#cmakedefine gid_t int

/* Define to `unsigned int' if <sys/types.h> does not define. */
#cmakedefine size_t unsigned int

/* Define to `int' if <sys/types.h> doesn't define. */
#cmakedefine uid_t int
