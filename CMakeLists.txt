# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

PROJECT(oniguruma C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
INCLUDE(dist.cmake)


###########################################################################################
# generating config.h file:
MESSAGE("Configure: oniguruma - generating config.h:")
	INCLUDE (CheckIncludeFiles)
	INCLUDE (CheckFunctionExists)
	INCLUDE (CheckSymbolExists)
	INCLUDE (CheckTypeSize)
	INCLUDE (TestBigEndian)

	# TODO
	# /* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP systems. This function is required for `alloca.c' support on those systems. */

	# TODO
	# /* Define to 1 if using `alloca.c'. */

	CHECK_FUNCTION_EXISTS(alloca HAVE_ALLOCA)
	CHECK_INCLUDE_FILES (alloca.h HAVE_ALLOCA_H)
	CHECK_INCLUDE_FILES (dlfcn.h HAVE_DLFCN_H)
	CHECK_INCLUDE_FILES (inttypes.h HAVE_INTTYPES_H)
	CHECK_INCLUDE_FILES (memory.h HAVE_MEMORY_H)

	# TODO:
	SET(HAVE_PROTOTYPES 1)
	SET(HAVE_STDARG_PROTOTYPES 1)

	CHECK_INCLUDE_FILES (stdint.h HAVE_STDINT_H)
	CHECK_INCLUDE_FILES (stdlib.h HAVE_STDLIB_H)
	CHECK_INCLUDE_FILES (strings.h HAVE_STRINGS_H)
	CHECK_INCLUDE_FILES (string.h HAVE_STRING_H)
	CHECK_INCLUDE_FILES ("sys/stat.h" HAVE_SYS_STAT_H)
	CHECK_INCLUDE_FILES ("sys/times.h" HAVE_SYS_TIMES_H)
	CHECK_INCLUDE_FILES ("sys/time.h" HAVE_SYS_TIME_H)
	CHECK_INCLUDE_FILES ("sys/types.h" HAVE_SYS_TYPES_H)
	CHECK_INCLUDE_FILES (unistd.h HAVE_UNISTD_H)

	SET(PACKAGE "onig")
	SET(PACKAGE_BUGREPORT)
	SET(PACKAGE_NAME "onig")
	SET(PACKAGE_STRING "onig 5.9.1")
	SET(PACKAGE_TARNAME "onig")
	SET(PACKAGE_VERSION "5.9.1")

	CHECK_TYPE_SIZE(int SIZEOF_INT)
	CHECK_TYPE_SIZE(long SIZEOF_LONG)
	CHECK_TYPE_SIZE(short SIZEOF_SHORT)

	# TODO
	#cmakedefine STACK_DIRECTION

	#/* Define to 1 if you have the ANSI C header files. */
	CHECK_INCLUDE_FILES("stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS)


	#/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#~ 	This is wrong, but doing it right is very complicated ;-(
#~ 	CHECK_INCLUDE_FILES ("time.h" HAVE_TIME_H)
#~ 	IF(HAVE_SYS_TIME_H AND HAVE_TIME_H)
#~ 		SET(TIME_WITH_SYS_TIME 1)
#~ 	ENDIF()

	SET(USE_COMBINATION_EXPLOSION_CHECK 1)
	SET(USE_CRNL_AS_LINE_TERMINATOR 1)
	SET(VERSION "5.9.1")

	# TODO
	#/* Define to empty if `const' does not conform to ANSI C. */


# all is defined, so generate config.h
CONFIGURE_FILE(${CMAKE_CURRENT_SOURCE_DIR}/config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config.h)

MESSAGE("Configure: oniguruma - done.")
# end of generating config.h file:

ADD_DEFINITIONS(-DHAVE_CONFIG_H )
INCLUDE_DIRECTORIES (${CMAKE_CURRENT_BINARY_DIR})

###########################################################################################

# Oniguruma library
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

SET(ONIGLIB_SRC
	regerror.c regparse.c regext.c regcomp.c regexec.c reggnu.c
	regenc.c regsyntax.c regtrav.c regversion.c st.c
	regposix.c regposerr.c
	enc/unicode.c enc/ascii.c enc/utf8.c
	enc/utf16_be.c enc/utf16_le.c
	enc/utf32_be.c enc/utf32_le.c
	enc/euc_jp.c enc/sjis.c enc/iso8859_1.c
	enc/iso8859_2.c  enc/iso8859_3.c
	enc/iso8859_4.c  enc/iso8859_5.c
	enc/iso8859_6.c  enc/iso8859_7.c
	enc/iso8859_8.c  enc/iso8859_9.c
	enc/iso8859_10.c enc/iso8859_11.c
	enc/iso8859_13.c enc/iso8859_14.c
	enc/iso8859_15.c enc/iso8859_16.c
	enc/euc_tw.c enc/euc_kr.c enc/big5.c
	enc/gb18030.c enc/koi8_r.c enc/cp1251.c
)

IF(MSVC)
	SET(DEF_FILE libonig.def)
	ADD_DEFINITIONS(-DEXPORT)
ENDIF()

ADD_LIBRARY(onig SHARED ${ONIGLIB_SRC}  ${DEF_FILE})

# Install module
INSTALL(TARGETS onig DESTINATION ${INSTALL_LIB})

# Install headers
INSTALL(FILES oniguruma.h regint.h regparse.h regenc.h st.h onigposix.h DESTINATION ${INSTALL_INC})

# Install documentation
INSTALL(DIRECTORY doc/ DESTINATION ${INSTALL_DOC})
INSTALL(FILES AUTHORS COPYING HISTORY README DESTINATION ${INSTALL_DATA})
INSTALL(FILES index.html index_ja.html DESTINATION ${INSTALL_DOC})
