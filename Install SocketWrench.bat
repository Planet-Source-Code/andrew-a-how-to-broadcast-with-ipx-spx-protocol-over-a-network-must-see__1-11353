echo off
cls
echo This will install the SocketWrench files to C:\Windows\System.
echo.
echo If your windows\system directory is different from this, just copy:
echo Csw25ctl.hlp
echo Cswsk32.dep
echo Cswsk32.oca
echo Cswsk32.ocx
echo.
echo to your Windows\system directory!
echo Press any key to do this all for you! (As long as your windows\system path is C:\windows\System)
echo.
echo READY! Press a key!
echo.
pause >nul
echo Copying... Please wait!
copy Csw25ctl.hlp C:\Windows\system
copy Cswsk32.dep C:\windows\system
copy Cswsk32.oca C:\windows\system
copy Cswsk32.ocx C:\windows\system
echo.
echo.
echo Copying Complete!
echo.
echo Press a key to close this window/exit!
echo.
pause >nul
cls
exit
