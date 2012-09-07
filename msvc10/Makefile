#  Build debug version:		nmake
#  Build release version:	nmake nodebug=1

OUTPUT = libiconv.dll

SRCS =	..\lib\iconv.c \
	..\libcharset\lib\localcharset.c
OBJS =	.\iconv.obj \
	.\localcharset.obj

DEFINES =	/D_BIND_TO_CURRENT_VCLIBS_VERSION=1 \
		/D_CRT_SECURE_NO_WARNINGS=1 \
		/DBUILDING_LIBICONV=1

INCLUDES =	-I . \
		-I ..\lib \
		-I ..\srclib

CCFLAGS =	$(DEFINES) $(INCLUDES) \
	  	/wd 4100 /wd 4819 /wd4127

############################################################################
# WINDOWS BUILD SETTINGS.

APPVER = 5.0
TARGET = WINNT
TARGETLANG = LANG_JAPANESE

!INCLUDE <Win32.Mak>

############################################################################
# DON'T CHANGE BELOW.

$(OUTPUT) : $(OBJS)
	$(link) /NOLOGO $(ldebug) $(dlllflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ $(OBJS)

{..\lib}.c.obj ::
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) /c $<

{..\libcharset\lib}.c.obj ::
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) /c $<

build : $(OUTPUT)

clean :
	-DEL /F /Q *.dll
	-DEL /F /Q *.exe
	-DEL /F /Q *.exp
	-DEL /F /Q *.lib
	-DEL /F /Q *.obj
	-DEL /F /Q *.pdb
