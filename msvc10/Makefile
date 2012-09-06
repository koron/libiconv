#  Build debug version:		nmake
#  Build release version:	nmake nodebug=1

TARGET = libiconv.dll
SRCS =	..\lib\iconv.c

DEFINES =	/D_BIND_TO_CURRENT_VCLIBS_VERSION=1

INCLUDES =	-I . \
		-I ..\lib \
		-I ..\srclib

CCFLAGS =	$(DEFINESJ) $(INCLUDES) \
	  	/wd 4100 /wd 4819

############################################################################
# WINDOWS BUILD SETTINGS.

APPVER = 5.0
TARGET = WINNT
TARGETLANG = LANG_JAPANESE

!INCLUDE <Win32.Mak>

############################################################################
# DON'T CHANGE BELOW.

OBJS = $(SRCS:.c=.obj)

$(TARGET) : $(OBJS)
	$(link) /NOLOGO $(ldebug) $(dlllflags) $(conlibsdll) $(LFLAGS) \
		/OUT:$@ $(OBJS)

{..\lib}.c.obj ::
	$(CC) $(cdebug) $(cflags) $(cvarsdll) $(CCFLAGS) /c $<
