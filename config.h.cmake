/* config.h.in.  Generated from configure.in by autoheader.  */

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
#cmakedefine CRAY_STACKSEG_END

/* Define to 1 if using `alloca.c'. */
#cmakedefine C_ALLOCA

/* Define to 1 if you have `alloca', as a function or macro. */
#cmakedefine HAVE_ALLOCA ${HAVE_ALLOCA}

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
#cmakedefine HAVE_ALLOCA_H ${HAVE_ALLOCA_H}

/* Define to 1 if you have the <dlfcn.h> header file. */
#cmakedefine HAVE_DLFCN_H ${HAVE_DLFCN_H}

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine HAVE_INTTYPES_H ${HAVE_INTTYPES_H}

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine HAVE_MEMORY_H ${HAVE_MEMORY_H}

/* Define if compilerr supports prototypes */
#cmakedefine HAVE_PROTOTYPES ${HAVE_PROTOTYPES}

/* Define if compiler supports stdarg prototypes */
#cmakedefine HAVE_STDARG_PROTOTYPES ${HAVE_STDARG_PROTOTYPES}

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H ${HAVE_STDINT_H}

/* Define to 1 if you have the <stdlib.h> header file. */
#cmakedefine HAVE_STDLIB_H ${HAVE_STDLIB_H}

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine HAVE_STRINGS_H ${HAVE_STRINGS_H}

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine HAVE_STRING_H ${HAVE_STRING_H}

/* Define to 1 if you have the <sys/stat.h> header file. */
#cmakedefine HAVE_SYS_STAT_H ${HAVE_SYS_STAT_H}

/* Define to 1 if you have the <sys/times.h> header file. */
#cmakedefine HAVE_SYS_TIMES_H ${HAVE_SYS_TIMES_H}

/* Define to 1 if you have the <sys/time.h> header file. */
#cmakedefine HAVE_SYS_TIME_H ${HAVE_SYS_TIME_H}

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine HAVE_SYS_TYPES_H ${HAVE_SYS_TYPES_H}

/* Define to 1 if you have the <unistd.h> header file. */
#cmakedefine HAVE_UNISTD_H ${HAVE_UNISTD_H}

/* Name of package */
#cmakedefine PACKAGE "${PACKAGE}"

/* Define to the address where bug reports for this package should be sent. */
#cmakedefine PACKAGE_BUGREPORT "${PACKAGE_BUGREPORT}"

/* Define to the full name of this package. */
#cmakedefine PACKAGE_NAME "${PACKAGE_NAME}"

/* Define to the full name and version of this package. */
#cmakedefine PACKAGE_STRING "${PACKAGE_STRING}"

/* Define to the one symbol short name of this package. */
#cmakedefine PACKAGE_TARNAME "${PACKAGE_TARNAME}"

/* Define to the version of this package. */
#cmakedefine PACKAGE_VERSION "${PACKAGE_VERSION}"

/* The size of a `int', as computed by sizeof. */
#define SIZEOF_INT ${SIZEOF_INT}

/* The size of a `long', as computed by sizeof. */
#define SIZEOF_LONG ${SIZEOF_LONG}

/* The size of a `short', as computed by sizeof. */
#define SIZEOF_SHORT ${SIZEOF_SHORT}

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at run-time.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
#cmakedefine STACK_DIRECTION

/* Define to 1 if you have the ANSI C header files. */
#cmakedefine STDC_HEADERS ${STDC_HEADERS}

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#cmakedefine TIME_WITH_SYS_TIME ${TIME_WITH_SYS_TIME}

/* Define if combination explosion check */
#cmakedefine USE_COMBINATION_EXPLOSION_CHECK ${USE_COMBINATION_EXPLOSION_CHECK}

/* Define if enable CR+NL as line terminator */
#cmakedefine USE_CRNL_AS_LINE_TERMINATOR ${USE_CRNL_AS_LINE_TERMINATOR}

/* Version number of package */
#cmakedefine VERSION "${VERSION}"

/* Define to empty if `const' does not conform to ANSI C. */
#cmakedefine const ${const}

#ifndef NORETURN
#if _MSC_VER > 1100
#define NORETURN(x) __declspec(noreturn) x
#else
#define NORETURN(x) x
#endif
#endif
