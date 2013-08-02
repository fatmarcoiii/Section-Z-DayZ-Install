@echo off
COLOR 0D
set mod=%1
set map=%2

:start
echo Welcome to Section Z Game Launcher created by CE28N.
echo Join us at our RaidCall Group: 25597687!
echo.
echo Select the mod you want to play by input the mod number.
echo.
echo 1 - DayZ
echo 2 - ArmA 2 : OA
echo.
set /P mod=Select a lettter: 
if "%mod%"=="1" goto maps_dayz
if "%mod%"=="2" goto mods_OA

:maps_dayz
cls
echo Select the map you want to play by input the map number.
echo The map "Chernarus" is the most basic map with most players.
echo.
echo 1 - Chernarus
echo.
echo If you wanna play the advanced maps, you can input the map number below.
echo.
echo 2 - Namalsk
echo 3 - Taviana (dayztaviana.com) 
echo 4 - Origins
echo.
echo E - Back to menu
echo.
set /P map=Map number: 
if "%map%"=="1" goto start_chernarus
if "%map%"=="2" goto start_namalsk
if "%map%"=="3" goto start_taviana
if "%map%"=="4" goto start_origins
if "%map%"=="e" cls & goto start
if "%map%"=="E" cls & goto start

:start_chernarus
cls
if exist @DayZ\addons\dayz.pbo (start Expansion\beta\arma2oa.exe -mod=@Dayz;CA;Expansion\beta;Expansion\beta\Expansion -noFilePatching -nosplash -noPause -world=Chernarus) else (goto dayz_checkfail)
exit

:start_namalsk
cls
if exist @DayZ_Namalsk\addons\namalsk.pbo (start Expansion\beta\arma2oa.exe -mod=@DayZ_Namalsk_@DayZ;@DayZ_Namalsk;Expansion\beta;Expansion\beta\Expansion -noFilePatching -nosplash -noPause) else (goto dayz_checkfail)
exit

:start_taviana
cls
if exist @Taviana\addons\dayz.pbo (start Expansion\beta\arma2oa.exe -mod=@Taviana;Expansion\beta;Expansion\beta\Expansion -noFilePatching -nosplash -noPause) else (goto dayz_checkfail)
exit

:start_origins
cls
if exist @DayzOrigins\addons\dayz.pbo (start Expansion\beta\arma2oa.exe -mod=@DayzOrigins;Expansion\beta;Expansion\beta\Expansion -noFilePatching -nosplash -noPause) else (goto dayz_checkfail)
exit

:dayz_checkfail
cls
echo Please download this map before you start playing servers with this map.
echo You can use DayZ Commander to download the latest maps.
pause
cls & goto maps_dayz

:mods_OA
cls
echo Select the mod you want to play by input the mod number.
echo.
echo A - ACE
echo O - ArmA 2 : OA
echo W - Wasteland
echo.
echo E - Back to menu
echo.
set /P map=Mod number: 
if "%map%"=="a" goto start_ace
if "%map%"=="A" goto start_ace
if "%map%"=="o" goto start_oa
if "%map%"=="O" goto start_oa
if "%map%"=="w" goto start_oa
if "%map%"=="W" goto start_oa
if "%map%"=="e" cls & goto start
if "%map%"=="E" cls & goto start

:start_ace
cls
if exist @ACE\addons\ace_anims.pbo (start Expansion\beta\arma2oa.exe -mod=@ACE;@ACEX;@ACEX_RU;@ACEX_SM;@ACEX_USNavy;@CBA;@CBA_A2;@CBA_OA -noFilePatching -nosplash -noPause) else (goto ace_checkfail)
exit

:start_oa
cls
if exist Expansion\beta\arma2oa.exe (start Expansion\beta\arma2oa.exe -noFilePatching -nosplash -noPause) else (goto oa_checkfail)
exit

:ace_checkfail
cls
echo Please download this mod before you start playing servers with this mod.
echo You can use Six Launcher to download the latest ACE mods.
pause
cls & goto start

:oa_checkfail
cls
echo Please make sure you had installed all the files correctly.
pause
cls & goto start