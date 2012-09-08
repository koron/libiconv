@ECHO OFF
REM Simple check of a stateful encoding.
REM Usage: check-stateful.bat SRCDIR CHARSET

SET fname=%2
SET fname=%fname::=-%

iconv_no_i18n -f %2 -t UTF-8 < %1\%fname%-snippet > tmp-snippet1
fc %1\%fname%-snippet.UTF-8 tmp-snippet1
iconv_no_i18n -f UTF-8 -t %2 < %1\%fname%-snippet.UTF-8 > tmp-snippet2
fc %1\%fname%-snippet tmp-snippet2

del tmp-snippet1
del tmp-snippet2
