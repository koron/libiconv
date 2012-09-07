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

test : table-from.exe table-to.exe test-shiftseq.exe test-to-wchar.exe

clean :
	-DEL /F /Q *.dll
	-DEL /F /Q *.exe
	-DEL /F /Q *.exp
	-DEL /F /Q *.lib
	-DEL /F /Q *.obj
	-DEL /F /Q *.pdb

distclean :
	-DEL /F tags

.PHONY : build tags clean distclean

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
