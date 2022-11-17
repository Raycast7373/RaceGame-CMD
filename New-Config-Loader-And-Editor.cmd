rem this is a test file for the new config loader/editor thing im trying to add

:DefaultConfig
rem Config Name
set ConfigName=Default

rem Launch Game fullscreen ( Default: True )
set MakeFullscreen=True

rem Player Start Position
rem Horizontal Position: ( Default: 2 )
set PLAYERHORIZONTAL=2
rem Vertical Position: ( Default: 1 )
set PLAYERVERTICAL=1

rem Enemy Start Position
rem Horizontal Position: ( Default: 2 )
set ENEMYHORIZONTAL=2
rem Vertical Position: ( Default: 6 )
set ENEMYVERTICAL=6

rem Enemy AI Config
rem Go other direction when the enemy X coordinate is already at its higest or lowest (this makes it make a diffrent choice when the ai is at the lowest or highest X coordinate) ( Default: YES )
set AICHANGEDIRECTION=YES

rem Use Calculated Down Percentage? ( Default: NO )
set USEAIDOWN=YES
rem Left: ( Default: 18% )
set EONEL=18
rem Right: ( Default: 18% )
set EONER=18
rem Down: Remaining percentage (100-EONER-EONEL)

rem Experimental!!
rem Road Length: ( Default: 5 )
rem this changes the length of the road (this only works when Road Looper is enabled)
set ROADLENGTH=5
rem Road Looper: ( Default: False )
rem this changes the way the road is drawn, enabling it makes stuff look a bit less good
set ROADLOOPER=False
rem Allow Player to go on higest roadpiece (will otherwise be one less than max)? ( Default: NO )
set ALLOWPLAYER=NO

Rem the next part is needed to make stuff work, so please dont make any changes because the chance of stuff breaking is big
set SCORE=0
set eYmin=-1
set Ymin=0
set Xmax=2
set Xmin=0
set eXmin=0
set eXmax=2
set AICHGDIR=AICHANGEDIRECTION
set /a eYmax=ROADLENGTH-1
set /a Xaxis=PLAYERHORIZONTAL-1
set /a Yaxis=PLAYERVERTICAL-1
set /a eXaxis=ENEMYHORIZONTAL-1
set /a ONEPERCENTAI=32768/100
set /a AICONFL=EONEL*ONEPERCENTAI
set /a AICONFR=EONER*ONEPERCENTAI
set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI
set /a AICONFDP=(100-EONEL-EONER)
set /a AICONFDMIN=AICONFD
set /a AICONFDMAX=32768-AICONFD
if /I "%ALLOWPLAYER%"=="NO"  ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax )
if %ENEMYVERTICAL% GTR %ROADLENGTH% ( set /a eYaxis=ROADLENGTH ) else ( if %ENEMYVERTICAL% LSS 1 ( set /a eYaxis=ROADLENGTH ) )
if %PLAYERVERTICAL% GTR %Ymax% ( set /a Yaxis=Ymax-2 ) else ( if %PLAYERVERTICAL% LSS %Ymin% ( set /a Yaxis=Ymin ) )
exit /b
///////


:GenerateConfig
cls
rem the next part generates the custom config file (Without any changes) to make it possible to change stuff easily
setlocal
echo :ConfigLoadSettings > Savedata\UserConfig.cmd
echo set arg=%1 >> Savedata\UserConfig.cmd >> Savedata\UserConfig.cmd
echo if %arg%=True ( goto CustomUserConfig ) >> Savedata\UserConfig.cmd
echo set LoadUserConfig=False >> Savedata\UserConfig.cmd
echo set UserConfigName=CustomUserConfig >> Savedata\UserConfig.cmd
echo if "%LoadUserConfig%"="True" ( goto %UserConfigName% ) else ( exit /B ) >> Savedata\UserConfig.cmd
echo :CustomUserConfig >> Savedata\UserConfig.cmd
echo set ConfigName=Default >> Savedata\UserConfig.cmd
echo set MakeFullscreen=True >> Savedata\UserConfig.cmd
echo set PLAYERHORIZONTAL=2 >> Savedata\UserConfig.cmd
echo set PLAYERVERTICAL=1 >> Savedata\UserConfig.cmd
echo set ENEMYHORIZONTAL=2 >> Savedata\UserConfig.cmd
echo set ENEMYVERTICAL=6 >> Savedata\UserConfig.cmd
echo set AICHANGEDIRECTION=YES >> Savedata\UserConfig.cmd
echo set USEAIDOWN=YES >> Savedata\UserConfig.cmd
echo set EONEL=18 >> Savedata\UserConfig.cmd
echo set EONER=18 >> Savedata\UserConfig.cmd
echo set ROADLOOPER=False >> Savedata\UserConfig.cmd
echo set ROADLENGTH=5 >> Savedata\UserConfig.cmd
echo set ALLOWPLAYER=NO >> Savedata\UserConfig.cmd
echo set SCORE=0 >> Savedata\UserConfig.cmd
echo set eYmin=-1 >> Savedata\UserConfig.cmd
echo set Ymin=0 >> Savedata\UserConfig.cmd
echo set Xmax=2 >> Savedata\UserConfig.cmd
echo set Xmin=0 >> Savedata\UserConfig.cmd
echo set eXmin=0 >> Savedata\UserConfig.cmd
echo set eXmax=2 >> Savedata\UserConfig.cmd
echo set AICHGDIR=AICHANGEDIRECTION >> Savedata\UserConfig.cmd
echo set /a eYmax=ROADLENGTH-1 >> Savedata\UserConfig.cmd
echo set /a Xaxis=PLAYERHORIZONTAL-1 >> Savedata\UserConfig.cmd
echo set /a Yaxis=PLAYERVERTICAL-1 >> Savedata\UserConfig.cmd
echo set /a eXaxis=ENEMYHORIZONTAL-1 >> Savedata\UserConfig.cmd
echo set /a ONEPERCENTAI=32768/100 >> Savedata\UserConfig.cmd
echo set /a AICONFL=EONEL*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFR=EONER*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFDP=(100-EONEL-EONER) >> Savedata\UserConfig.cmd
echo set /a AICONFDMIN=AICONFD >> Savedata\UserConfig.cmd
echo set /a AICONFDMAX=32768-AICONFD >> Savedata\UserConfig.cmd
echo if /I "%ALLOWPLAYER%"=="NO"  ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax ) >> Savedata\UserConfig.cmd
echo if %ENEMYVERTICAL% GTR %ROADLENGTH% ( set /a eYaxis=ROADLENGTH ) else ( if %ENEMYVERTICAL% LSS 1 ( set /a eYaxis=ROADLENGTH ) ) >> Savedata\UserConfig.cmd
echo if %PLAYERVERTICAL% GTR %Ymax% ( set /a Yaxis=Ymax-2 ) else ( if %PLAYERVERTICAL% LSS %Ymin% ( set /a Yaxis=Ymin ) ) >> Savedata\UserConfig.cmd
echo exit /b >> Savedata\UserConfig.cmd
endlocal
////

:EDITCONFIG
cls
rem this part of the code allows the user to edit the config from within the game
@choice /c YN /M "Do you want to first load a already existing config or do you want to start from the beginning? [Y/N]: " /n
if errorlevel 2 set LoadConfigBeforeEdit=False
if errorlevel 1 set LoadConfigBeforeEdit=True
if "%LoadConfigBeforeEdit%"=="True" (
cls
echo Available configs:
echo Default
if exist Savedata\UserConfig.cmd ( 
echo UserConfig 
echo.
set /P ConfigFileToLoadEditor=Please enter the name of the config file to load (caps sensitive):
if "%ConfigFileToLoadEditor%"="Default" (
    echo loading default config for the editor...
   call :DefaultConfig
   goto EditWithLoaded
) else (
    echo loading custom config for the editor...
    call Savedata\UserConfig.cmd True
    goto EditWithLoaded
)
) else ( 
echo No user config found, loading default config..
call :DefaultConfig
goto EditWithLoaded
)


) else (
goto EditWithoutLoaded

)

:EditWithLoaded
cls
color c
title Config Editor (General Settings)
echo ----------------------------
echo -----Config Editor (General Settings)
echo ----------------------------
echo 1) Config name ( Currently: %ConfigNameTemp% ) ( Old Config: %ConfigName% )
echo.
echo 2) Make Fullscreen on Launch ( Currently: %MakeFullscreenTemp% ) ( Old Config: %MakeFullscreen% ) ( Default: True ) [True-False]
echo.
echo 3) Use UserConfig on start ( Currently: %LoadUserConfigTemp% ) ( Old Config: %LoadUserConfig% ) ( Default: False ) [True-False]
echo.
echo 4) Road Length {only changes when Road Looper is true} ( Currently: %ROADLENGTHTemp% ) ( Old Config: %ROADLENGTH% ) ( Default: 5 ) [Minimum is 5]
echo 5) Road Looper {Changes the way the roads are loaded} ( Currently: %ROADLOOPERTemp% ) ( Old Config: %ROADLOOPER% ) ( Default: False ) [True-False]
echo.
echo 6) Enemy Use Calculated Down Percentage? ( Currently: %USEAIDOWNTemp% ) ( Old Config: %USEAIDOWN% ) ( Default: YES ) [YES/NO]
echo.
echo 7) Next page
echo.
echo 8) Save Config (This will delete your old config!!)
echo 9) Discard Changes and go back
echo.
@choice /c 123456789 /M "Which thing do you want to run? [1-9]: " /n 
if errorlevel 9 goto DiscardChanges //////////////
if errorlevel 8 goto SaveNewConfig
if errorlevel 7 goto EditWithLoaded2
if errorlevel 6 call :EditorEnemyUseAIDown
if errorlevel 5 call :EditorRoadLooper
if errorlevel 4 call :EditorRoadLength
if errorlevel 3 call :EditorUseUserConfigOnStart
if errorlevel 2 call :EditorFullscreenOnStart
if errorlevel 1 call :EditorChangeConfigName
goto EditWithLoaded

:EditWithLoaded2
cls
color c
title Config Editor (AI Settings)
echo ----------------------------
echo -----Config Editor (AI Settings)
echo ----------------------------
echo 1) Enemy Start Position Horizontal ( Currently: %ENEMYHORIZONTALTemp% ) ( Old Config: %ENEMYHORIZONTAL% ) ( Default: 2 ) [1-3]
echo.
echo 2) Enemy Start Position Vertical ( Currently: %ENEMYVERTICALTemp% ) ( Old Config: %ENEMYVERTICAL% ) ( Default: 6 ) [0 is Minimum]
echo.
echo 3) Enemy Make AI do something else when it is at the most left or right X coord when it tries to go further to that direction ( Currently: %AICHANGEDIRECTIONTemp% ) ( Old Config: %AICHANGEDIRECTION% ) ( Default: YES ) [YES/NO]
echo.
echo 4) Enemy chance going left in percentage ( Currently: %EONELTemp% ) ( Old Config: %EONEL% ) ( Default: 18 ) [0-100]
echo 5) Enemy chance going right in percentage ( Currently: %EONERTemp% ) ( Old Config: %EONER% ) ( Default: 18 ) [0-100]
echo.
echo 6) Previous page
echo 7) Next page
echo.
echo 8) Save Config (This will delete your old config!!)
echo 9) Discard Changes and go back
echo.
@choice /c 123456789 /M "Which thing do you want to run? [1-9]: " /n 
if errorlevel 9 goto DiscardChanges //////////////
if errorlevel 8 goto SaveNewConfig
if errorlevel 7 goto EditWithLoaded3
if errorlevel 6 goto EditWithLoaded
if errorlevel 5 call :EditorEnemyChanceGoRight
if errorlevel 4 call :EditorEnemyChanceGoLeft
if errorlevel 3 call :EditorEnemyCHANGEDir
if errorlevel 2 call :EditorEnemyStartPosVer
if errorlevel 1 call :EditorEnemyStartPosHor
goto EditWithLoaded2

:EditWithLoaded3
cls
color c
title Config Editor (Player Settings)
echo ----------------------------
echo -----Config Editor (Player Settings)
echo ----------------------------
echo 1) Player Start Position Horizontal ( Currently: %PLAYERHORIZONTALTemp% ) ( Old Config: %PLAYERHORIZONTAL% ) ( Default: 2 ) [1-3]
echo.
echo 2) Player Start Position Vertical ( Currently: %PLAYERVERTICALTemp% ) ( Old Config: %PLAYERVERTICAL% ) ( Default: 1 ) [0 is Minimum]
echo.
echo.
echo 3) Previous page
echo.
echo 4) Save Config (This will delete your old config!!)
echo 5) Discard Changes and go back
echo.
@choice /c 12345 /M "Which thing do you want to run? [1-5]: " /n 
if errorlevel 5 goto DiscardChanges //////////////
if errorlevel 4 goto SaveNewConfig
if errorlevel 3 goto EditWithLoaded2
if errorlevel 2 call :EditorPlayerStartPosVer
if errorlevel 1 call :EditorPlayerStartPosHor
goto EditWithLoaded3



:EditWithoutLoaded
cls
color c
title Config Editor (General Settings)
echo ----------------------------
echo -----Config Editor (General Settings)
echo ----------------------------
echo 1) Config name ( Currently: %ConfigNameTemp% )
echo.
echo 2) Make Fullscreen on Launch ( Currently: %MakeFullscreenTemp% ) ( Default: True ) [True-False]
echo.
echo 3) Use UserConfig on start ( Currently: %LoadUserConfigTemp% ) ( Default: False ) [True-False]
echo.
echo 4) Road Length {only changes when Road Looper is true} ( Currently: %ROADLENGTHTemp% ) ( Default: 5 ) [Minimum is 5]
echo 5) Road Looper {Changes the way the roads are loaded} ( Currently: %ROADLOOPERTemp% ) ( Default: False ) [True-False]
echo.
echo 6) Enemy Use Calculated Down Percentage? ( Currently: %USEAIDOWNTemp% ) ( Default: YES ) [YES/NO]
echo.
echo 7) Next page
echo.
echo 8) Save Config (This will delete your old config!!)
echo 9) Discard Changes and go back
echo.
@choice /c 123456789 /M "Which thing do you want to run? [1-9]: " /n 
if errorlevel 9 goto DiscardChanges //////////////
if errorlevel 8 goto SaveNewConfig
if errorlevel 7 goto EditWithoutLoaded2
if errorlevel 6 call :EditorEnemyUseAIDown
if errorlevel 5 call :EditorRoadLooper
if errorlevel 4 call :EditorRoadLength
if errorlevel 3 call :EditorUseUserConfigOnStart
if errorlevel 2 call :EditorFullscreenOnStart
if errorlevel 1 call :EditorChangeConfigName
goto EditWithoutLoaded

:EditWithoutLoaded2
cls
color c
title Config Editor (AI Settings)
echo ----------------------------
echo -----Config Editor (AI Settings)
echo ----------------------------
echo 1) Enemy Start Position Horizontal ( Currently: %ENEMYHORIZONTALTemp% ) ( Default: 2 ) [1-3]
echo.
echo 2) Enemy Start Position Vertical ( Currently: %ENEMYVERTICALTemp% ) ( Default: 6 ) [0 is Minimum]
echo.
echo 3) Enemy Make AI do something else when it is at the most left or right X coord when it tries to go further to that direction ( Currently: %AICHANGEDIRECTIONTemp% ) ( Old Config: %AICHANGEDIRECTION% ) ( Default: YES ) [YES/NO]
echo.
echo 4) Enemy chance going left in percentage ( Currently: %EONELTemp% ) ( Default: 18 ) [0-100]
echo 5) Enemy chance going right in percentage ( Currently: %EONERTemp% ) ( Default: 18 ) [0-100]
echo.
echo 6) Previous page
echo 7) Next page
echo.
echo 8) Save Config (This will delete your old config!!)
echo 9) Discard Changes and go back
echo.
@choice /c 123456789 /M "Which thing do you want to run? [1-9]: " /n 
if errorlevel 9 goto DiscardChanges //////////////
if errorlevel 8 goto SaveNewConfig
if errorlevel 7 goto EditWithoutLoaded3
if errorlevel 6 goto EditWithoutLoaded
if errorlevel 5 call :EditorEnemyChanceGoRight
if errorlevel 4 call :EditorEnemyChanceGoLeft
if errorlevel 3 call :EditorEnemyCHANGEDir
if errorlevel 2 call :EditorEnemyStartPosVer
if errorlevel 1 call :EditorEnemyStartPosHor
goto EditWithoutLoaded2

:EditWithoutLoaded3
cls
color c
title Config Editor (Player Settings)
echo ----------------------------
echo -----Config Editor (Player Settings)
echo ----------------------------
echo 1) Player Start Position Horizontal ( Currently: %PLAYERHORIZONTALTemp% ) ( Default: 2 ) [1-3]
echo.
echo 2) Player Start Position Vertical ( Currently: %PLAYERVERTICALTemp% ) ( Default: 1 ) [0 is Minimum]
echo.
echo.
echo 3) Previous page
echo.
echo 4) Save Config (This will delete your old config!!)
echo 5) Discard Changes and go back
echo.
@choice /c 12345 /M "Which thing do you want to run? [1-5]: " /n 
if errorlevel 5 goto DiscardChanges //////////////
if errorlevel 4 goto SaveNewConfig
if errorlevel 3 goto EditWithoutLoaded2
if errorlevel 2 call :EditorPlayerStartPosVer
if errorlevel 1 call :EditorPlayerStartPosHor
goto EditWithoutLoaded3




:EditorChangeConfigName
cls
set /P ConfigNameTemp=Please enter a name for your config: 
exit /b

:EditorFullscreenOnStart
cls
set /P MakeFullscreenTemp=Launch game fullscreen on startup? [True/False]: 
exit /b

:EditorUseUserConfigOnStart
cls
set /P MakeFullscreenTemp=Use userconfig on startup? [True/False]: 
exit /b

:EditorRoadLength
cls
set /P ROADLENGTHTemp=Length of the road? (This only works when roadlooper is enabled) [Minimum is 5]: 
exit /b

:EditorRoadLooper
cls
set /P ROADLOOPERTemp=Use the RoadLooper to draw the road? [True/False]: 
exit /b

:EditorEnemyStartPosHor
cls
set /P ENEMYHORIZONTALTemp=Enemy Horizontal start coordinate [1-3]: 
exit /b

:EditorEnemyStartPosVer
cls
set /P ENEMYVERTICALTemp=Enemy Vertical start coordinate [0 is Minimum]: 
exit /b

:EditorEnemyCHANGEDir
cls
set /P AICHANGEDIRECTIONTemp=Make AI do something else when it is at the most left or right X coord when it tries to go further to that direction [YES/NO]: 
exit /b

:EditorEnemyUseAIDown
cls
set /P USEAIDOWNTemp=Add the down chance percentage to the calculation of where the ai will go? (this currently doesnt do anything) [YES/NO]: 
exit /b

:EditorEnemyChanceGoLeft
cls
set /P EONELTemp=The chance that the enemy will go left in percentage [0-100]: 
exit /b

:EditorEnemyChanceGoRight
cls
set /P EONERTemp=The chance that the enemy will go right in percentage [0-100]: 
exit /b

:EditorPlayerStartPosHor
cls
set /P PLAYERHORIZONTALTemp=Player Horizontal start coordinate [1-3]: 
exit /b

:EditorPlayerStartPosVer
cls
set /P PLAYERVERTICALTemp=Player Vertical start coordinate [0 is Minimum]: 
exit /b



:SaveNewConfig
cls
echo New Config:
echo Config Name: %ConfigNameTemp%
echo.
echo General settings:
echo Make Fullscreen on Launch: %MakeFullscreenTemp%
echo Use UserConfig on start: %LoadUserConfigTemp%
echo.
echo Road Options:
echo Road Length: %ROADLENGTHTemp%
echo Road Looper: %ROADLOOPERTemp%
echo.
echo Enemy settings:
echo Enemy Start Position:
echo Enemy Start Position Horizontal: %ENEMYHORIZONTALTemp%
echo Enemy Start Position Vertical: %ENEMYVERTICALTemp%
echo Enemy AI:
echo Enemy Change Direction when X is on Minimum or Maximum: %AICHANGEDIRECTIONTemp%
echo Enemy Use Calculated Down Percentage?: %USEAIDOWNTemp%
echo Enemy chance going left: %EONELTemp%
echo Enemy chance going right: %EONERTemp%
echo.
echo Player settings:
echo Player Start Position:
echo Player Start Position Horizontal: %PLAYERHORIZONTALTemp%
echo Player Start Position Vertical: %PLAYERVERTICALTemp%
echo.
echo.
@choice /c YN /M "Save Configuration? (This will overwrite your old config) (Press N to go back to the configuration editor) [Y/N]: " /n
if errorlevel 2 if "%LoadConfigBeforeEdit%"=="True" ( goto EditWithLoaded ) else ( goto EditWithoutLoaded )
if errorlevel 1 goto SavingNewConfig
goto SaveNewConfig

:SavingNewConfig
cls
echo Saving config...

echo :ConfigLoadSettings > Savedata\UserConfig.cmd
echo set arg=%1 >> Savedata\UserConfig.cmd >> Savedata\UserConfig.cmd
echo if %arg%=True ( goto CustomUserConfig ) >> Savedata\UserConfig.cmd
set thewritething=set LoadUserConfig=%LoadUserConfigTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
echo set UserConfigName=CustomUserConfig >> Savedata\UserConfig.cmd
echo if "%LoadUserConfig%"="True" ( goto %UserConfigName% ) else ( exit /B ) >> Savedata\UserConfig.cmd
echo :CustomUserConfig >> Savedata\UserConfig.cmd
set thewritething=set ConfigName=%ConfigNameTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set MakeFullscreen=%MakeFullscreenTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set PLAYERHORIZONTAL=%PLAYERHORIZONTALTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set PLAYERVERTICAL=%PLAYERVERTICALTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set ENEMYHORIZONTAL=%ENEMYHORIZONTALTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set ENEMYVERTICAL=%ENEMYVERTICALTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set AICHANGEDIRECTION=%AICHANGEDIRECTIONTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set USEAIDOWN=%USEAIDOWNTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set EONEL=%EONELTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set EONER=%EONER%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set ROADLOOPER=%ROADLOOPERTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
set thewritething=set ROADLENGTH=%ROADLENGTHTemp%
echo %thewritething% >> Savedata\UserConfig.cmd
echo set ALLOWPLAYER=NO >> Savedata\UserConfig.cmd
echo set SCORE=0 >> Savedata\UserConfig.cmd
echo set eYmin=-1 >> Savedata\UserConfig.cmd
echo set Ymin=0 >> Savedata\UserConfig.cmd
echo set Xmax=2 >> Savedata\UserConfig.cmd
echo set Xmin=0 >> Savedata\UserConfig.cmd
echo set eXmin=0 >> Savedata\UserConfig.cmd
echo set eXmax=2 >> Savedata\UserConfig.cmd
echo set AICHGDIR=AICHANGEDIRECTION >> Savedata\UserConfig.cmd
echo set /a eYmax=ROADLENGTH-1 >> Savedata\UserConfig.cmd
echo set /a Xaxis=PLAYERHORIZONTAL-1 >> Savedata\UserConfig.cmd
echo set /a Yaxis=PLAYERVERTICAL-1 >> Savedata\UserConfig.cmd
echo set /a eXaxis=ENEMYHORIZONTAL-1 >> Savedata\UserConfig.cmd
echo set /a ONEPERCENTAI=32768/100 >> Savedata\UserConfig.cmd
echo set /a AICONFL=EONEL*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFR=EONER*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI >> Savedata\UserConfig.cmd
echo set /a AICONFDP=(100-EONEL-EONER) >> Savedata\UserConfig.cmd
echo set /a AICONFDMIN=AICONFD >> Savedata\UserConfig.cmd
echo set /a AICONFDMAX=32768-AICONFD >> Savedata\UserConfig.cmd
echo if /I "%ALLOWPLAYER%"=="NO"  ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax ) >> Savedata\UserConfig.cmd
echo if %ENEMYVERTICAL% GTR %ROADLENGTH% ( set /a eYaxis=ROADLENGTH ) else ( if %ENEMYVERTICAL% LSS 1 ( set /a eYaxis=ROADLENGTH ) ) >> Savedata\UserConfig.cmd
echo if %PLAYERVERTICAL% GTR %Ymax% ( set /a Yaxis=Ymax-2 ) else ( if %PLAYERVERTICAL% LSS %Ymin% ( set /a Yaxis=Ymin ) ) >> Savedata\UserConfig.cmd
echo exit /b >> Savedata\UserConfig.cmd
///////////////

:ShowCurrentlyLoadedConfig
cls
rem this shows the user the current configuration
echo Current settings:
echo Config Name: %ConfigName% ////////////
echo.
echo Player Config:
echo Player Start Position
echo Horizontal: %PLAYERHORIZONTAL%
echo Vertical: %PLAYERVERTICAL%
echo.
echo Enemy Config:
echo Enemy Start Position
echo Horizontal: %ENEMYHORIZONTAL%
echo Vertical: %ENEMYVERTICAL%
echo.
echo Enemy Ai Config
echo Go other direction when the enemy X coordinate is already at its higest or lowest: %AICHANGEDIRECTION%
echo Use Calculated Down Percentage? (this basically doesnt do much currently due to how the ai decides where to go, this might change later): %USEAIDOWN%
echo Chance it goes left (percentage): %EONEL%
echo Chance it goes right (percentage): %EONER%
echo Chance it goes down (percentage): %AICONFDP%
echo
echo Road Config:
echo Road Length (only works when road looper is enabled): %ROADLENGTH%
echo Road Looper: %ROADLOOPER%
echo.
echo General Config:
echo Load User Config on start: %LoadUserConfig% /////////////
echo Name of config to load on startup: %UserConfigName% ////////
echo Use looper methode of showing road: %RoadLoopEnabled% /////////
echo Fullscreen mode: %MakeFullscreen% /////////
echo.
echo - End of config -
echo Press a key to go back
pause >nul
exit /b
////////////////














:READUSERCONFIG
cls
set CHOSENOPTION=READ
echo Current config:
if %UseCustomConfig% EQU 1 ( 
	goto CustomConfig 
	) else ( 
		if %UseEXTConfig% EQU 1 ( 
			goto EXTConfig 
			) else ( 
				goto CONFIG 
				) 
		)
:READ
type Savedata\CONFIG.BAT

echo.
goto BACK

:READADVCONFIG
cls
type Savedata\CONFIG.BAT
echo.
goto BACK

:RESETBACKUP
set CHOSENOPTION=RESET
set autoback=1
:BACKUPCONFIG
cls
if not exist CONFIGBACKUP\ ( 
	mkdir CONFIGBACKUP 
	goto BACKUP
	) else ( 
		goto BACKUP 
		)
:BACKUP
time /t > time.txt
date /t > date.txt
for /f %%i in (time.txt) do set TIMEN=[%%i]
for /f %%i in (date.txt) do set DATEN=[%%i]
SET TIMER=%TIMEN::=- %
SET DATER=%DATEN:/=- %
echo copying files...
copy Savedata\CONFIG.BAT CONFIGBACKUP\CONFIG-(%TIMER%)-(%DATER%).BAT
copy Savedata\CONFIG.BAT CONFIGBACKUP\ADVCONFIG-(%TIMER%)-(%DATER%).BAT
del time.txt
del date.txt
echo Done!!
if %autoback% EQU 0 ( goto BACK ) else ( goto AUTOBACK )


:RESETCONFIG
cls
ECHO   1) First make backup before reset
echo.
ECHO   2) Reset config without backup
echo.
ECHO   3) Cancel
echo.
@choice /c 123 /M "Are you sure you want to reset the config? [1-3]: " /n 
if errorlevel 3 goto AUTOBACK
if errorlevel 2 goto RESET
if errorlevel 1 goto RESETBACKUP
goto RESETCONFIG

:RESET
cls
echo Config is being reset...
if %UseCustomConfig% EQU 1 ( 
	goto RCustomConfig 
	) else ( 
		if %UseEXTConfig% EQU 1 ( 
			goto IEXTCONF 
			)
goto ResetError
:IEXTCONF
del Savedata\CONFIG.BAT
del Savedata\CONFIG.BAT
echo Done removing config files!!
set CHOSENOPTION=READCONFIGMENU
goto COPYCONFIG
:RCustomConfig

echo Done removing config files!!
set CHOSENOPTION=READCONFIGMENU
goto COPYCONFIG


:ResetError
cls
echo not using any custom configs!!
timeout 5 >nul
goto AUTOBACK

:AUTOBACK
cls
set autoback=0
goto %CHOSENOPTION%

:COPYCONFIG
cls

echo Generating config files...
echo now generating CONFIG.BAT
echo echo Player Start: ^>nul >> Savedata\CONFIG.BAT
echo echo Horizontal Position: ( Default: 2 )^>nul >> Savedata\CONFIG.BAT
echo set PLAYERHORIZONTAL=2 >> Savedata\CONFIG.BAT
echo echo Vertical Position: ( Default: 1 )^>nul >> Savedata\CONFIG.BAT
echo set PLAYERVERTICAL=1 >> Savedata\CONFIG.BAT
echo echo Enemy Start: ^>nul >> Savedata\CONFIG.BAT
echo echo Horizontal Position: ( Default: 2 )^>nul >> Savedata\CONFIG.BAT
echo set ENEMYHORIZONTAL=2 >> Savedata\CONFIG.BAT
echo echo Vertical Position: ( Default: 6 )^>nul >> Savedata\CONFIG.BAT
echo set ENEMYVERTICAL=6 >> Savedata\CONFIG.BAT
echo echo Enemy AI Config: ^>nul >> Savedata\CONFIG.BAT
echo echo Go other direction when eXaxis is already  at its higest or lowest: ( Default: YES ) ^>nul >> Savedata\CONFIG.BAT
echo set AICHANGEDIRECTION=YES >> Savedata\CONFIG.BAT
echo echo Use Calculated Down Percentage? ( Default: NO ) ^>nul >> Savedata\CONFIG.BAT
echo set USEAIDOWN=NO >> Savedata\CONFIG.BAT
echo echo Left: ( Default: 18^% ) ^>nul >> Savedata\CONFIG.BAT
echo set EONEL=18 >> Savedata\CONFIG.BAT
echo echo Right: ( Default: 18^% ) ^>nul >> Savedata\CONFIG.BAT
echo set EONER=18 >> Savedata\CONFIG.BAT
echo echo Down: Remaining percentage (100-EONER-EONEL) ^>nul >> Savedata\CONFIG.BAT
echo echo Experimental!!: ^>nul >> Savedata\CONFIG.BAT
echo echo Road Length: ( Default: 5 )^>nul >> Savedata\CONFIG.BAT
echo set ROADLENGTH=5 >> Savedata\CONFIG.BAT
echo echo Allow Player to go on higest roadpiece (will otherwise be one less than max)? ( Default: NO ) ^>nul >> Savedata\CONFIG.BAT
echo set ALLOWPLAYER=NO >> Savedata\CONFIG.BAT
echo. >> Savedata\CONFIG.BAT
echo echo Only touch the stuff down here if you know what you are doing, setting a wrong value can break everything!! ^>nul >> Savedata\CONFIG.BAT
echo set SCORE=0 >> Savedata\CONFIG.BAT
echo set eYmin=-1 >> Savedata\CONFIG.BAT
echo set Ymin=0 >> Savedata\CONFIG.BAT
echo set Xmin=0 >> Savedata\CONFIG.BAT
echo set eXmin=0 >> Savedata\CONFIG.BAT
echo set Xmax=2 >> Savedata\CONFIG.BAT
echo set eXmax=2 >> Savedata\CONFIG.BAT
echo set AICHGDIR=AICHANGEDIRECTION >> Savedata\CONFIG.BAT
echo set /a eYmax=ROADLENGTH-1 >> Savedata\CONFIG.BAT
echo set /a Xaxis=PLAYERHORIZONTAL-1 >> Savedata\CONFIG.BAT
echo set /a Yaxis=PLAYERVERTICAL-1 >> Savedata\CONFIG.BAT
echo set /a eXaxis=ENEMYHORIZONTAL-1 >> Savedata\CONFIG.BAT
echo set /a ONEPERCENTAI=32768/100 >> Savedata\CONFIG.BAT
echo set /a AICONFL=EONEL*ONEPERCENTAI >> Savedata\CONFIG.BAT
echo set /a AICONFR=EONER*ONEPERCENTAI >> Savedata\CONFIG.BAT
echo set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI >> Savedata\CONFIG.BAT
echo set /a AICONFDMIN=AICONFD >> Savedata\CONFIG.BAT
echo set /a AICONFDMAX=32768-AICONFD >> Savedata\CONFIG.BAT
echo if /I "^%ALLOWPLAYER^%"=="NO"  ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax ) >> Savedata\CONFIG.BAT
echo if ^%ENEMYVERTICAL^% GTR ^%ROADLENGTH^% ( set /a eYaxis=ROADLENGTH ) else ( if ^%ENEMYVERTICAL^% LSS 1 ( set /a eYaxis=ROADLENGTH ) ) >> Savedata\CONFIG.BAT
echo if ^%PLAYERVERTICAL^% GTR ^%Ymax^% ( set /a Yaxis=Ymax-2 ) else ( if ^%PLAYERVERTICAL^% LSS ^%Ymin^% ( set /a Yaxis=Ymin ) ) >> Savedata\CONFIG.BAT
echo goto AUTOBACK >> Savedata\CONFIG.BAT
echo Done!!


if %UseCustomConfig% EQU 1 ( 
	goto CCustomConfig 
	) else ( 
		if %UseEXTConfig% EQU 1 ( 
			goto AUTOBACK
			)
:CCustomConfig
for /f "set" in (Savedata\CONFIG.BAT) do SET EDIT=[%%i]
SET ENDIT=%EDIT:*:CustomConfig=%
CALL SET FINISHED=%%EDIT:%ENDIT%=%%

set "FILENAME=%~nx0"
call :WRITE %FILENAME%
:WRITE
set /a LINE=0
for /f "delims=: tokens=1" %A IN ('findstr /n ":CustomConfig" Race.cmd') do ( @set "LINE=%A" )
set /a LINE=LINE-1
for /f "delims=: skip=%LINE% tokens=*" %A IN ('findstr /n ":CustomConfig" Race.cmd') do ( @set "STR=%A" )

SET _endbit=%STR:*:CustomConfig=%
Echo We dont want: [%_endbit%]

   ::Now remove this from the original string
CALL SET _result=%%STR:%_endbit%=%%
echo %_result%


echo %FINISHED%

goto AUTOBACK

:LOADCONFIG
color 1
goto SETTINGS
:LOADCONFIGN
echo %UseCustomConfig%
if /I "%UseCustomConfig%"=="YES" ( 
	goto CustomConfig 
	) else ( 
		if /I "%UseEXTConfig%"=="YES" ( 
			goto EXTConfig 
			) else ( 
				goto CONFIG 
				) 
		)
goto CONFIG

:EXTConfig
if not exist Savedata\CONFIG.BAT ( goto EXTConfigError ) else (
    echo.
	 echo Loading external config...
	 Savedata\CONFIG.BAT
	 echo Done!!
	 goto AUTOBACK
)


:EXTConfigError
cls
echo Error! No external config found!! Will now use internal (custom) config instead
echo.
timeout 5 >nul
set EXTConfigError=1
if /I "%UseCustomConfig%"=="YES" ( goto CustomConfig ) else ( goto Config )
goto CONFIG


:SETTINGS
cls
echo loading settings...

echo Save scores inside game: ( Default: YES ) >nul
set localscores=YES

echo Uses internal custom config (makes stuff a bit more portable): ( Default: YES ) >nul
set UseCustomConfig=YES

echo Delete textures when closing game (when you close it using exit): ( Default: NO ) >nul
set DELETETEXTURESBYEXIT=NO

echo Use external config file: ( Default: NO ) >nul
set EXTCONF=NO

echo done!!
goto LOADCONFIGN

:CONFIG


:USERCONFIG
echo Player Start: >nul
echo Horizontal Position: ( Default: 2 )>nul
set PLAYERHORIZONTAL=2
echo Vertical Position: ( Default: 1 )>nul
set PLAYERVERTICAL=1
echo Enemy Start: >nul
echo Horizontal Position: ( Default: 2 )>nul
set ENEMYHORIZONTAL=2
echo Vertical Position: ( Default: 6 )>nul
set ENEMYVERTICAL=6
echo Enemy AI Config: >nul
echo Go other direction when eXaxis is already  at its higest or lowest: ( Default: YES ) >nul
set AICHANGEDIRECTION=YES
echo Use Calculated Down Percentage? ( Default: NO ) >nul
set USEAIDOWN=YES
echo Left: ( Default: 18% ) >nul
set EONEL=18
echo Right: ( Default: 18% ) >nul
set EONER=18
echo Down: Remaining percentage (100-EONER-EONEL) >nul
echo Experimental!!: >nul
echo Road Length: ( Default: 5 )>nul
set ROADLENGTH=5
echo Allow Player to go on higest roadpiece (will otherwise be one less than max)? ( Default: NO ) >nul
set ALLOWPLAYER=NO

:ADVCONFIG
echo Dont touch the stuff down here, setting a wrong value breaks everything!! >nul
set SCORE=0
set eYmin=-1
set Ymin=0
set Xmax=2
set Xmin=0
set eXmin=0
set eXmax=2
set AICHGDIR=AICHANGEDIRECTION
set /a eYmax=ROADLENGTH-1
set /a Xaxis=PLAYERHORIZONTAL-1
set /a Yaxis=PLAYERVERTICAL-1
set /a eXaxis=ENEMYHORIZONTAL-1
set /a ONEPERCENTAI=32768/100
set /a AICONFL=EONEL*ONEPERCENTAI
set /a AICONFR=EONER*ONEPERCENTAI
set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI
set /a AICONFDMIN=AICONFD
set /a AICONFDMAX=32768-AICONFD
if /I "%ALLOWPLAYER%"=="NO"  ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax )
if %ENEMYVERTICAL% GTR %ROADLENGTH% ( set /a eYaxis=ROADLENGTH ) else ( if %ENEMYVERTICAL% LSS 1 ( set /a eYaxis=ROADLENGTH ) )
if %PLAYERVERTICAL% GTR %Ymax% ( set /a Yaxis=Ymax-2 ) else ( if %PLAYERVERTICAL% LSS %Ymin% ( set /a Yaxis=Ymin ) )
echo.
echo Done!!
goto AUTOBACK


:CustomConfig
cls
echo loading custom config...
:CCONFIG
echo Player Start: >nul
set PLAYERHORIZONTAL=2
set PLAYERVERTICAL=1
set ENEMYHORIZONTAL=2
set ENEMYVERTICAL=5

set AICHGDIR=YES
set AICHANGEDIRECTION=YES

set USEAIDOWN=NO
set EONEL=22
set EONER=22
set ROADLENGTH=5
set ALLOWPLAYER=YES

echo Dont touch the stuff down here, setting a wrong value breaks everything!! >nul
set SCORE=0
set eYmin=0
set Ymin=0
set Xmin=1
set eXmin=1
set Xmax=3
set eXmax=3
set /a eYmax=ROADLENGTH
set /a Xaxis=PLAYERHORIZONTAL-1
set /a Yaxis=PLAYERVERTICAL-1
set /a eXaxis=ENEMYHORIZONTAL-1
set /a ONEPERCENTAI=32768/100
set /a AICONFL=EONEL*ONEPERCENTAI
set /a AICONFR=EONER*ONEPERCENTAI
set /a AICONFR=32768-AICONFR
set /a AICONFD=(100-EONEL-EONER)*ONEPERCENTAI
set /a AICONFDMIN=AICONFD
set /a AICONFDMAX=32768-AICONFD
if /I "%ALLOWPLAYER%"=="NO" ( set /A Ymax=eYmax-1 ) Else ( set /A Ymax=eYmax )
if %ENEMYVERTICAL% GTR %ROADLENGTH% ( set /a eYaxis=ROADLENGTH ) else ( if %ENEMYVERTICAL% LSS 1 ( set /a eYaxis=ROADLENGTH ) else ( set /a eYaxis=ENEMYVERTICAL ) )
if %PLAYERVERTICAL% GTR %Ymax% ( set /a Yaxis=Ymax-2 ) else ( if %PLAYERVERTICAL% LSS %Ymin% ( set /a Yaxis=Ymin ) else ( set /a Yaxis=PLAYERVERTICAL ) )
echo Done!!
goto AUTOBACK
