@echo off

cmd /c call build.cmd vc12-x86 static mt debug
if errorlevel 1 goto :error

goto :eof

:error
exit /b 1
