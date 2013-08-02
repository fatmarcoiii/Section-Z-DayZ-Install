@echo off
COLOR 0D
set fix=%1

echo Welcome to Section Z 35%% error fix program created by CE28N.
echo Join us at our RaidCall Group: 25597687!
echo.
echo Do you want to start the fix of installation stop at 35%%?
echo.
echo Y - Yes
echo N - No
echo.
set /P fix=Selete a letter: 
if "%fix%"=="y" goto fix
if "%fix%"=="Y" goto fix
if "%fix%"=="n" exit
if "%fix%"=="N" exit


:fix
bcdedit /set IncreaseUserVA 3072
echo.
echo Fix command is done on your computer, press any key to reboot your computer now.
echo Please note that you should remove/uninstall all the old program files and re-install the game after the reboot.
echo.
pause
shutdown /r
cls & exit