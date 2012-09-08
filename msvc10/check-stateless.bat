@ECHO OFF
REM Complete check of a stateless encoding.
REM Usage: check-stateless.bat SRCDIR CHARSET

SET fname=%2
SET fname=%fname::=-%

.\table-from %2 > tmp-%fname%.TXT
.\table-to %2 | sort > tmp-%fname%.INVERSE.TXT
fc %1\%fname%.TXT tmp-%fname%.TXT

if not exist %1\%fname%.IRREVERSIBLE.TXT goto ELSE_1
  copy /B %1\%fname%.TXT /B + %1\%fname%.IRREVERSIBLE.TXT /B tmp
  sort < tmp | uniq-u > tmp-orig-%fname%.INVERSE.TXT
  fc tmp-orig-%fname%.INVERSE.TXT tmp-%fname%.INVERSE.TXT
  del tmp
  del tmp-orig-%fname%.INVERSE.TXT
  goto ENDIF_1
:ELSE_1
if not exist %1\%fname%.UNCOMBINING.TXT goto ELSE_2
  sort < %1\%fname%.UNCOMBINING.TXT | uniq-u > tmp-orig-%fname%.INVERSE.TXT
  fc tmp-orig-%fname%.INVERSE.TXT tmp-%fname%.INVERSE.TXT
  del tmp-orig-%fname%.INVERSE.TXT
  goto ENDIF_1
:ELSE_2
  sort < %1\%fname%.TXT | uniq-u > tmp-orig-%fname%.INVERSE.TXT
  fc tmp-orig-%fname%.INVERSE.TXT tmp-%fname%.INVERSE.TXT
  del tmp-orig-%fname%.INVERSE.TXT
:ENDIF_1

del tmp-%fname%.TXT
del tmp-%fname%.INVERSE.TXT
