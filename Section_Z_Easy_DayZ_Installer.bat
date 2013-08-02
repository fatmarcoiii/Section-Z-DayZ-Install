@echo off
COLOR 0D
set menu=%1

echo #########################################################################
echo #                                                                       #
echo #              Welcome to Section Z easy DayZ installler.               #
echo #     This little script will help you to install DayZ on your PC.      #
echo #   If you have any trouble, please report on our RaidCall: 25597687.   #
echo #                                                                       #
echo #                                           Installer created by CE28N  #
echo #########################################################################
echo.

:install
echo.
echo If you are ready to install, press any key to continue.
pause
cls
goto menu

:menu
cls
echo Welcome to Section Z easy DayZ installer menu. 
echo.
echo ArmA 2 settings
echo ---------------
echo 1 - Change your ArmA 2 and OA CD keys
echo 2 - Install ArmA 2 Beta Patch 108074
echo 3 - Download the latest ArmA 2 Beta patches
echo.
echo DayZ FAQ
echo ---------------
echo 4 - I can't change my CD-KEY, it says "Access Denied"?
echo 5 - I can't enter the game because of "Bad CD-KEY given in setup"?
echo 6 - I entered the server, but it says "Invalid CD-KEY"?
echo 7 - My DayZ save in a server has been changed even i'm not online?
echo 8 - I saw all the servers are with a red-cross, what's wrong?
echo.
echo E - Exit this installer
echo.
set /P menu=Select a number or lettter: 
if "%menu%"=="1" start dayz_install\arma2_keygen.exe & cls & goto cd_key
if "%menu%"=="2" cls & goto beta
if "%menu%"=="3" start http://www.arma2.com/beta-patch.php & cls & goto menu
if "%menu%"=="4" cls & goto key_error_ac
if "%menu%"=="5" cls & goto key_error_bad
if "%menu%"=="6" cls & goto key_error_invalid
if "%menu%"=="7" cls & goto key_error_save
if "%menu%"=="8" cls & goto server_redcross
if "%menu%"=="e" exit
if "%menu%"=="E" exit

:cd_key
if exist SimpleShutdownTimer.exe del /f/q SimpleShutdownTimer.exe >nul
if exist "%commonprogramfiles(x86)%" (
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /v KEY 2^>nul') DO SET arma2key=%%B
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /v KEY 2^>nul') DO SET arma2OAkey=%%B
) else (
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Bohemia Interactive Studio\ArmA 2" /v KEY 2^>nul') DO SET arma2key=%%B
	FOR /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\Software\Bohemia Interactive Studio\ArmA 2 OA" /v KEY 2^>nul') DO SET arma2OAkey=%%B
)
SET elegir_serial=99
cls
echo Applying a new CD-KEY to your game... 
echo.
if "%arma2key%"=="" (
	echo There is no ArmA 2 key installed. You must install one.
) else (
	echo Current ArmA 2 key: %arma2key%
)
if "%arma2OAkey%"=="" (
	echo There is no ArmA 2 OA key installed. You must install one.
) else (
	echo Current ArmA 2 : OA key: %arma2OAkey%
)	
echo.
echo.
echo Generate ArmA 2 and ArmA 2 : OA key with the keygen
echo and copy the LOWER SERIALS to here WITHOUT SPACE!
echo.
echo.
SET /P arma2key=Type 30 digits to use as ArmA 2 serial number: 
SET /P arma2OAkey=Type 30 digits to use as ArmA 2 : OA serial number: 

dayz_install\arma2_keygen.exe

if exist "%commonprogramfiles(x86)%" (
	if not "%arma2key%"=="" REG ADD "HKLM\Software\Wow6432Node\Bohemia Interactive Studio\ArmA 2" /f /v KEY /t REG_BINARY /d "%arma2key%"
	if not "%arma2OAkey%"=="" REG ADD "HKLM\Software\Wow6432Node\Bohemia Interactive Studio\ArmA 2 OA" /f /v KEY /t REG_BINARY /d "%arma2OAkey%"
) else (
	if not "%arma2key%"=="" REG ADD "HKLM\Software\Bohemia Interactive Studio\ArmA 2" /v KEY /t REG_BINARY /d "%arma2key%"
	if not "%arma2OAkey%"=="" REG ADD "HKLM\Software\Bohemia Interactive Studio\ArmA 2 OA" /v KEY /t REG_BINARY /d "%arma2OAkey%"
)

cls
echo New key successfully installed.
pause
cls
goto menu

:beta
echo.
echo Installing ARMA2_OA_Build_108074...
dayz_install\ARMA2_OA_Build_108074.exe
cls
goto menu

:key_error_ac
echo.
echo If you can't change your CD-KEY because of "Access Denied",
echo Please run the program with administrator.
echo.
pause
cls & goto menu

:key_error_bad
echo.
echo If you can't enter the game because of "Bad CD-KEY given in setup"
echo Please run the program and change another CD-KEY to your game.
echo.
pause
cls & goto menu

:key_error_invalid
echo.
echo If you entered the server but it says "Invalid CD-KEY", 
echo Please make sure your server filter has inputted "NO CD"/"NO-CD"/"NOCD" or kind of tags.
echo Illegal copies of ArmA2 can NOT join the genuine server unless you bought the game.
echo.
pause
cls & goto menu

:key_error_save
echo.
echo If you found that your DayZ save in a server has been changed even you're not online,
echo Which means you're using the same CD-KEY with others because it is illegal copy.
echo You may change your key again, or buy the genuine version of the game.
echo.
pause
cls & goto menu

:server_redcross
echo.
echo If you saw all the servers are with a red-cross,
echo Please make sure you're using the same Mods and version with the server.
echo Also you can check your server filter to see if you did something wrong.
echo.
pause
cls & goto menu