# Copyright (C) 2007-2009 LuaDist.
# Created by Peter Kapec
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( oniguruma C )
cmake_minimum_required ( VERSION 2.8 )
include ( cmake/dist.cmake )

###########################################################################################
# generating config.h file:
message ( "Configure: oniguruma - generating config.h:" )
include ( CheckIncludeFiles )
include ( CheckFunctionExists )
include ( CheckSymbolExists )
include ( CheckTypeSize )
include ( TestBigEndian )

# TODO
# /* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP systems. This function is required for `alloca.c' support on those systems. */

# TODO
# /* Define to 1 if using `alloca.c'. */

check_function_exists ( alloca HAVE_ALLOCA )
check_include_files ( alloca.h HAVE_ALLOCA_H )
check_include_files ( dlfcn.h HAVE_DLFCN_H )
check_include_files ( inttypes.h HAVE_INTTYPES_H )
check_include_files ( memory.h HAVE_MEMORY_H )

# TODO:
set ( HAVE_PROTOTYPES 1 )
set ( HAVE_STDARG_PROTOTYPES 1 )

check_include_files ( stdint.h HAVE_STDINT_H )
check_include_files ( stdlib.h HAVE_STDLIB_H )
check_include_files ( strings.h HAVE_STRINGS_H )
check_include_files ( string.h HAVE_STRING_H )
check_include_files ( "sys/stat.h" HAVE_SYS_STAT_H )
check_include_files ( "sys/times.h" HAVE_SYS_TIMES_H )
check_include_files ( "sys/time.h" HAVE_SYS_TIME_H )
check_include_files ( "sys/types.h" HAVE_SYS_TYPES_H )
check_include_files ( unistd.h HAVE_UNISTD_H )

set ( PACKAGE "onig" )
set ( PACKAGE_BUGREPORT )
set ( PACKAGE_NAME "onig" )
set ( PACKAGE_STRING "onig 5.9.1" )
set ( PACKAGE_TARNAME "onig" )
set ( PACKAGE_VERSION "5.9.1" )

check_type_size ( int SIZEOF_INT )
check_type_size ( long SIZEOF_LONG )
check_type_size ( short SIZEOF_SHORT )

# TODO
#cmakedefine STACK_DIRECTION

#/* Define to 1 if you have the ANSI C header files. */
check_include_files ( "stdlib.h;stdarg.h;string.h;float.h" STDC_HEADERS )

#/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#~ 	This is wrong, but doing it right is very complicated ;-(
#~ 	CHECK_INCLUDE_FILES ("time.h" HAVE_TIME_H)
#~ 	IF(HAVE_SYS_TIME_H AND HAVE_TIME_H)
#~ 		SET(TIME_WITH_SYS_TIME 1)
#~ 	ENDIF()

set ( USE_COMBINATION_EXPLOSION_CHECK 1 )
set ( USE_CRNL_AS_LINE_TERMINATOR 1 )
set ( VERSION "5.9.1" )

# TODO
#/* Define to empty if `const' does not conform to ANSI C. */

# all is defined, so generate config.h
configure_file ( ${CMAKE_CURRENT_SOURCE_DIR}/config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config.h )

message ( "Configure: oniguruma - done." )
# end of generating config.h file:

add_definitions ( -DHAVE_CONFIG_H )
include_directories ( ${CMAKE_CURRENT_BINARY_DIR} )

###########################################################################################

# Oniguruma library
include_directories ( ${CMAKE_CURRENT_SOURCE_DIR} )

set ( ONIGLIB_SRC regerror.c regparse.c regext.c regcomp.c regexec.c reggnu.c regenc.c 
  regsyntax.c regtrav.c regversion.c st.c regposix.c regposerr.c enc/unicode.c enc/ascii.c 
  enc/utf8.c enc/utf16_be.c enc/utf16_le.c enc/utf32_be.c enc/utf32_le.c enc/euc_jp.c 
  enc/sjis.c enc/iso8859_1.c enc/iso8859_2.c enc/iso8859_3.c enc/iso8859_4.c enc/iso8859_5.c 
  enc/iso8859_6.c enc/iso8859_7.c enc/iso8859_8.c enc/iso8859_9.c enc/iso8859_10.c 
  enc/iso8859_11.c enc/iso8859_13.c enc/iso8859_14.c enc/iso8859_15.c enc/iso8859_16.c 
  enc/euc_tw.c enc/euc_kr.c enc/big5.c enc/gb18030.c enc/koi8_r.c enc/cp1251.c )

if ( MSVC )
  set ( DEF_FILE libonig.def )
  add_definitions ( -DEXPORT )
endif ( )

add_library ( onig ${ONIGLIB_SRC} ${DEF_FILE} )

# Install module
install_library ( onig )

# Install headers
install_header ( oniguruma.h regint.h regparse.h regenc.h st.h onigposix.h )

# Install documentation
install_doc ( doc/ )
install_data ( AUTHORS COPYING HISTORY README )
