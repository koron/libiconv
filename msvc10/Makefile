#  Build debug version:		nmake
#  Build release version:	nmake nodebug=1

OUTPUTS =	libiconv.dll iconv_no_i18n.exe

DEFINES =	/D_BIND_TO_CURRENT_VCLIBS_VERSION=1 \
		/D_CRT_SECURE_NO_WARNINGS=1

INCLUDES =	-I. -I..\srclib

CCFLAGS =	/wd 4100 /wd 4819 /wd 4127 $(INCLUDES) $(DEFINES)

############################################################################
# WINDOWS BUILD SETTINGS.

APPVER = 6.0
TARGET = WINNT
TARGETLANG = LANG_JAPANESE

!INCLUDE <Win32.Mak>

build : $(OUTPUTS)

tags :
	ctags -R ../lib ../src ../srclib .

check : test

clean :
	-DEL /F /Q *.dll
	-DEL /F /Q *.exe
	-DEL /F /Q *.exp
	-DEL /F /Q *.lib
	-DEL /F /Q *.obj
	-DEL /F /Q *.pdb

distclean : clean
	-DEL /F tags
	-DEL /F tmp-*.TXT

.PHONY : build tags check clean distclean test $(TESTS)

############################################################################

### libiconv.dll

OBJS_LIBICONV_DLL = libiconv.obj localcharset.obj

libiconv.dll : $(OBJS_LIBICONV_DLL)
	$(link) /NOLOGO $(ldebug) $(dlllflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ $(OBJS_LIBICONV_DLL)

libiconv.obj : ..\lib\iconv.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/DBUILDING_LIBICONV=1 \
		/Fo$@ /c ..\lib\iconv.c

localcharset.obj : ..\libcharset\lib\localcharset.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/DBUILDING_LIBICONV=1 \
		/Fo$@ /c ..\libcharset\lib\localcharset.c

### iconv_no_i18n.exe

OBJS_ICONV_NO_I18N_EXE = iconv_no_i18n.obj progname.obj width.obj safe-read.obj

iconv_no_i18n.exe : $(OBJS_ICONV_NO_I18N_EXE) libiconv.dll
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ $(OBJS_ICONV_NO_I18N_EXE) libiconv.lib

iconv_no_i18n.obj : ..\src\iconv_no_i18n.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\src\iconv_no_i18n.c

progname.obj : ..\srclib\progname.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\srclib\progname.c

width.obj : ..\srclib\uniwidth\width.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\srclib\uniwidth\width.c

safe-read.obj : ..\srclib\safe-read.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\srclib\safe-read.c

### table-from.exe

table-from.exe : table-from.obj libiconv.dll
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ table-from.obj libiconv.lib

table-from.obj : ..\tests\table-from.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\table-from.c

### table-to.exe

table-to.exe : table-to.obj libiconv.dll
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ table-to.obj libiconv.lib

table-to.obj : ..\tests\table-to.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\table-to.c

### test-shiftseq.exe

test-shiftseq.exe : test-shiftseq.obj libiconv.dll
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ test-shiftseq.obj libiconv.lib

test-shiftseq.obj : ..\tests\test-shiftseq.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\test-shiftseq.c

### test-to-wchar.exe

test-to-wchar.exe : test-to-wchar.obj libiconv.dll
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ test-to-wchar.obj libiconv.lib

test-to-wchar.obj : ..\tests\test-to-wchar.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\test-to-wchar.c

### genutf8.exe

genutf8.exe : genutf8.obj
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ genutf8.obj

genutf8.obj : ..\tests\genutf8.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\genutf8.c

### gengb18030z.exe

gengb18030z.exe : gengb18030z.obj
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ gengb18030z.obj

gengb18030z.obj : ..\tests\gengb18030z.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\gengb18030z.c

### uniq-u.exe

uniq-u.exe : uniq-u.obj
	$(link) /NOLOGO $(ldebug) $(conlflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ uniq-u.obj

uniq-u.obj : ..\tests\uniq-u.c
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) \
		/Fo$@ /c ..\tests\uniq-u.c

############################################################################
# TESTS

TESTS =	test1 test2 $(TESTS3) $(TESTS4) $(TESTS5) test6 test7 test8

TESTS3 = test3a test3b test3c test3d 
TESTS4 = test4a test4b test4c test4d
TESTS5 = test5a test5b test5c test5d

TEST_EXES =	iconv_no_i18n.exe table-from.exe table-to.exe \
		test-shiftseq.exe test-to-wchar.exe \
		genutf8.exe gengb18030z.exe uniq-u.exe

TESTDIR =	..\tests

test : $(TESTS)

test_compile : $(TEST_EXES)

test1 : table-from.exe table-to.exe uniq-u.exe genutf8.exe
	check-stateless.bat $(TESTDIR) ASCII

# General multi-byte encodings
test2 : iconv_no_i18n.exe
	genutf8 > UTF-8.TXT && \
	  check-stateless.bat . UTF-8 && \
	  DEL /F UTF-8.TXT
	check-stateful.bat $(TESTDIR) UCS-2BE
	check-stateful.bat $(TESTDIR) UCS-2LE
	check-stateful.bat $(TESTDIR) UCS-4BE
	check-stateful.bat $(TESTDIR) UCS-4LE
	check-stateful.bat $(TESTDIR) UTF-16
	check-stateful.bat $(TESTDIR) UTF-16BE
	check-stateful.bat $(TESTDIR) UTF-16LE
	check-stateful.bat $(TESTDIR) UTF-32
	check-stateful.bat $(TESTDIR) UTF-32BE
	check-stateful.bat $(TESTDIR) UTF-32LE
	check-stateful.bat $(TESTDIR) UTF-7

# 8-bit encodings
test3 : $(TESTS3)

test3a : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) ISO-8859-1
	check-stateless.bat $(TESTDIR) ISO-8859-2
	check-stateless.bat $(TESTDIR) ISO-8859-3
	check-stateless.bat $(TESTDIR) ISO-8859-4
	check-stateless.bat $(TESTDIR) ISO-8859-5
	check-stateless.bat $(TESTDIR) ISO-8859-6
	check-stateless.bat $(TESTDIR) ISO-8859-7
	check-stateless.bat $(TESTDIR) ISO-8859-8
	check-stateless.bat $(TESTDIR) ISO-8859-9
	check-stateless.bat $(TESTDIR) ISO-8859-10
	check-stateless.bat $(TESTDIR) ISO-8859-11
	check-stateless.bat $(TESTDIR) ISO-8859-13
	check-stateless.bat $(TESTDIR) ISO-8859-14
	check-stateless.bat $(TESTDIR) ISO-8859-15
	check-stateless.bat $(TESTDIR) ISO-8859-16

test3b : table-from.exe table-to.exe uniq-u.exe iconv_no_i18n.exe
	check-stateless.bat $(TESTDIR) KOI8-R
	check-stateless.bat $(TESTDIR) KOI8-U
	check-stateless.bat $(TESTDIR) KOI8-RU
	check-stateless.bat $(TESTDIR) CP1250
	check-stateless.bat $(TESTDIR) CP1251
	check-stateless.bat $(TESTDIR) CP1252
	check-stateless.bat $(TESTDIR) CP1253
	check-stateless.bat $(TESTDIR) CP1254
	check-stateless.bat $(TESTDIR) CP1255
	check-stateful.bat $(TESTDIR) CP1255
	check-stateless.bat $(TESTDIR) CP1256
	check-stateless.bat $(TESTDIR) CP1257
	check-stateless.bat $(TESTDIR) CP1258
	check-stateful.bat $(TESTDIR) CP1258
	check-stateless.bat $(TESTDIR) CP850
	check-stateless.bat $(TESTDIR) CP862
	check-stateless.bat $(TESTDIR) CP866
	check-stateless.bat $(TESTDIR) CP1131

test3c : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) MacRoman
	check-stateless.bat $(TESTDIR) MacCentralEurope
	check-stateless.bat $(TESTDIR) MacIceland
	check-stateless.bat $(TESTDIR) MacCroatian
	check-stateless.bat $(TESTDIR) MacRomania
	check-stateless.bat $(TESTDIR) MacCyrillic
	check-stateless.bat $(TESTDIR) MacUkraine
	check-stateless.bat $(TESTDIR) MacGreek
	check-stateless.bat $(TESTDIR) MacTurkish
	check-stateless.bat $(TESTDIR) MacHebrew
	check-stateless.bat $(TESTDIR) MacArabic
	check-stateless.bat $(TESTDIR) MacThai
	check-stateless.bat $(TESTDIR) HP-ROMAN8
	check-stateless.bat $(TESTDIR) MacRoman
	check-stateless.bat $(TESTDIR) NEXTSTEP

test3d : table-from.exe table-to.exe uniq-u.exe iconv_no_i18n.exe
	check-stateless.bat $(TESTDIR) ARMSCII-8
	check-stateless.bat $(TESTDIR) Georgian-Academy
	check-stateless.bat $(TESTDIR) Georgian-PS
	check-stateless.bat $(TESTDIR) KOI8-T
	check-stateless.bat $(TESTDIR) PT154
	check-stateless.bat $(TESTDIR) RK1048
	check-stateless.bat $(TESTDIR) MuleLao-1
	check-stateless.bat $(TESTDIR) CP1133
	check-stateless.bat $(TESTDIR) TIS-620
	check-stateless.bat $(TESTDIR) CP874
	check-stateless.bat $(TESTDIR) VISCII
	check-stateless.bat $(TESTDIR) TCVN
	check-stateful.bat $(TESTDIR) TCVN

# CJK character sets
test4 : $(TESTS4)

test4a : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) ISO646-JP
	check-stateless.bat $(TESTDIR) JIS_X0201
	check-stateless.bat $(TESTDIR) ISO646-CN
	check-stateless.bat $(TESTDIR) ISO-IR-165

# CJK encodings
test4b : table-from.exe table-to.exe uniq-u.exe iconv_no_i18n.exe
	check-stateless.bat $(TESTDIR) EUC-JP
	check-stateless.bat $(TESTDIR) SHIFT_JIS
	check-stateless.bat $(TESTDIR) CP932
	check-stateful.bat $(TESTDIR) ISO-2022-JP
	check-stateful.bat $(TESTDIR) ISO-2022-JP-2
	check-stateful.bat $(TESTDIR) ISO-2022-JP-1
	check-stateless.bat $(TESTDIR) EUC-CN
	check-stateless.bat $(TESTDIR) GBK
	check-stateless.bat $(TESTDIR) CP936

# CJK encodings (GB18030)
test4c : table-from.exe table-to.exe uniq-u.exe gengb18030z.exe
	copy $(TESTDIR)\GB18030-BMP.TXT GB18030-TMP.TXT
	gengb18030z >> GB18030-TMP.TXT
	sort GB18030-TMP.TXT > GB18030.TXT
	-DEL /F GB18030-TMP.TXT
	check-stateless.bat . GB18030
	-DEL /F GB18030.TXT

# CJK encodings (others)
test4d : table-from.exe table-to.exe uniq-u.exe iconv_no_i18n.exe
	check-stateful.bat $(TESTDIR) ISO-2022-CN
	check-stateful.bat $(TESTDIR) ISO-2022-CN-EXT
	check-stateful.bat $(TESTDIR) HZ
	check-stateless.bat $(TESTDIR) EUC-TW
	check-stateless.bat $(TESTDIR) BIG5
	check-stateless.bat $(TESTDIR) CP950
	check-stateless.bat $(TESTDIR) BIG5-HKSCS:1999
	check-stateful.bat $(TESTDIR) BIG5-HKSCS:1999
	check-stateless.bat $(TESTDIR) BIG5-HKSCS:2001
	check-stateful.bat $(TESTDIR) BIG5-HKSCS:2001
	check-stateless.bat $(TESTDIR) BIG5-HKSCS:2004
	check-stateful.bat $(TESTDIR) BIG5-HKSCS:2004
	check-stateless.bat $(TESTDIR) BIG5-HKSCS:2008
	check-stateful.bat $(TESTDIR) BIG5-HKSCS:2008
	check-stateless.bat $(TESTDIR) EUC-KR
	check-stateless.bat $(TESTDIR) CP949
	check-stateless.bat $(TESTDIR) JOHAB
	check-stateful.bat $(TESTDIR) ISO-2022-KR

# system dependent and extra encodings
test5 : $(TESTS5)

# AIX specific encodings
test5a : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) CP856
	check-stateless.bat $(TESTDIR) CP922
	check-stateless.bat $(TESTDIR) CP1046
	check-stateless.bat $(TESTDIR) CP1124
	check-stateless.bat $(TESTDIR) CP1129
	check-stateless.bat $(TESTDIR) CP1161
	check-stateless.bat $(TESTDIR) CP1162
	check-stateless.bat $(TESTDIR) CP1163

# OSF/1 specific encodings
test5b : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) DEC-KANJI
	check-stateless.bat $(TESTDIR) DEC-HANYU

test5c : table-from.exe table-to.exe uniq-u.exe
	check-stateless.bat $(TESTDIR) CP437
	check-stateless.bat $(TESTDIR) CP737
	check-stateless.bat $(TESTDIR) CP775
	check-stateless.bat $(TESTDIR) CP852
	check-stateless.bat $(TESTDIR) CP853
	check-stateless.bat $(TESTDIR) CP855
	check-stateless.bat $(TESTDIR) CP857
	check-stateless.bat $(TESTDIR) CP858
	check-stateless.bat $(TESTDIR) CP860
	check-stateless.bat $(TESTDIR) CP861
	check-stateless.bat $(TESTDIR) CP863
	check-stateless.bat $(TESTDIR) CP864
	check-stateless.bat $(TESTDIR) CP865
	check-stateless.bat $(TESTDIR) CP869
	check-stateless.bat $(TESTDIR) CP1125

# Extra encodings
test5d : table-from.exe table-to.exe uniq-u.exe iconv_no_i18n.exe
	check-stateless.bat $(TESTDIR) EUC-JISX0213
	check-stateful.bat $(TESTDIR) EUC-JISX0213
	check-stateless.bat $(TESTDIR) SHIFT_JISX0213
	check-stateful.bat $(TESTDIR) SHIFT_JISX0213
	check-stateful.bat $(TESTDIR) ISO-2022-JP-3
	check-stateless.bat $(TESTDIR) BIG5-2003
	check-stateless.bat $(TESTDIR) TDS565
	check-stateless.bat $(TESTDIR) ATARIST
	check-stateless.bat $(TESTDIR) RISCOS-LATIN1

# transliteration
test6 : iconv_no_i18n.exe
	check-translit.bat $(TESTDIR) Quotes UTF-8 ISO-8859-1
	check-translit.bat $(TESTDIR) Quotes UTF-8 ASCII
	check-translit.bat $(TESTDIR) Translit1 ISO-8859-1 ASCII
# TODO: port check-translitfailure test.
#	check-translitfailure.bat $(TESTDIR) TranslitFail1 ISO-8859-1 ASCII

# substitution
test7 :
# TODO: port check-subst test.
#	check-subst.bat

# others
test8 : test-shiftseq.exe test-to-wchar.exe
	test-shiftseq
	test-to-wchar
