@echo off
IF %1.==. (
start "baguette" /MAX "%~dpnx0" true
exit
)
:DaGame
@echo off
set SCORE=0
set ECHOSTAT=OFF
set COORDINATESTAT=OFF
set TESTMODE=0
set CHOSENOPTION=MENUA

:DATA

if not exist DATA\ ( 
mkdir DATA

echo	:			: >> DATA\Road-0-0.txt
echo	:	:	:	: >> DATA\Road-0-0.txt
echo	:			: >> DATA\Road-0-0.txt
echo	:	:	:	: >> DATA\Road-0-0.txt
echo	:			: >> DATA\Road-0-0.txt
echo. >> DATA\Road-0-0.txt
echo	:			: >> DATA\Road-0-1.txt
echo	:  {+}	:	:	: >> DATA\Road-0-1.txt
echo	:  {+}			: >> DATA\Road-0-1.txt
echo	:	:	:	: >> DATA\Road-0-1.txt
echo	:			: >> DATA\Road-0-1.txt
echo.  >> DATA\Road-0-1.txt
echo	:			: >> DATA\Road-0-2.txt
echo	:	:  {+}	:	: >> DATA\Road-0-2.txt
echo	:	   {+}		: >> DATA\Road-0-2.txt
echo	:	:	:	: >> DATA\Road-0-2.txt
echo	:			: >> DATA\Road-0-2.txt
echo.  >> DATA\Road-0-2.txt
echo	:			: >> DATA\Road-0-3.txt
echo	: 	:	:  {+}	: >> DATA\Road-0-3.txt
echo	: 		   {+}	: >> DATA\Road-0-3.txt
echo	:	:	:	: >> DATA\Road-0-3.txt
echo	:			: >> DATA\Road-0-3.txt
echo. >> DATA\Road-0-3.txt
echo	:			: >> DATA\Road-1-0.txt
echo	:  [=]	:	:	: >> DATA\Road-1-0.txt
echo	:  [=]			: >> DATA\Road-1-0.txt
echo	:	:	:	: >> DATA\Road-1-0.txt
echo	:			: >> DATA\Road-1-0.txt
echo. >> DATA\Road-1-0.txt
echo	:			: >> DATA\Road-1-2.txt
echo	:  [=]	:  {+}	:	: >> DATA\Road-1-2.txt
echo	:  [=]	   {+}		: >> DATA\Road-1-2.txt
echo	:	:	:	: >> DATA\Road-1-2.txt
echo	:			: >> DATA\Road-1-2.txt
echo. >> DATA\Road-1-2.txt
echo	:			: >> DATA\Road-1-3.txt
echo	:  [=]	:	:  {+}	: >> DATA\Road-1-3.txt
echo	:  [=]		   {+}	: >> DATA\Road-1-3.txt
echo	:	:	:	: >> DATA\Road-1-3.txt
echo	:			: >> DATA\Road-1-3.txt
echo. >> DATA\Road-1-3.txt
echo	:			: >> DATA\Road-2-0.txt
echo	:	:  [=]	:	: >> DATA\Road-2-0.txt
echo	:	   [=]		: >> DATA\Road-2-0.txt
echo	:	:	:	: >> DATA\Road-2-0.txt
echo	:			: >> DATA\Road-2-0.txt
echo. >> DATA\Road-2-0.txt
echo	:			: >> DATA\Road-2-1.txt
echo	:  {+}	:  [=]	:	: >> DATA\Road-2-1.txt
echo	:  {+}	   [=]		: >> DATA\Road-2-1.txt
echo	:	:	:	: >> DATA\Road-2-1.txt
echo	:			: >> DATA\Road-2-1.txt
echo. >> DATA\Road-2-1.txt
echo	:			: >> DATA\Road-2-3.txt
echo	:  	:  [=]	:  {+}	: >> DATA\Road-2-3.txt
echo	:  	   [=]	   {+}	: >> DATA\Road-2-3.txt
echo	:	:	:	: >> DATA\Road-2-3.txt
echo	:			: >> DATA\Road-2-3.txt
echo. >> DATA\Road-2-3.txt
echo	:			: >> DATA\Road-3-0.txt
echo	: 	:	:  [=]	: >> DATA\Road-3-0.txt
echo	: 		   [=]	: >> DATA\Road-3-0.txt
echo	:	:	:	: >> DATA\Road-3-0.txt
echo	:			: >> DATA\Road-3-0.txt
echo. >> DATA\Road-3-0.txt
echo	:			: >> DATA\Road-3-1.txt
echo	:  {+}	:  	:  [=]	: >> DATA\Road-3-1.txt
echo	:  {+}	   	   [=]	: >> DATA\Road-3-1.txt
echo	:	:	:	: >> DATA\Road-3-1.txt
echo	:			: >> DATA\Road-3-1.txt
echo.  >> DATA\Road-3-1.txt
echo	:			: >> DATA\Road-3-2.txt
echo	:  	:  {+}	:  [=]	: >> DATA\Road-3-2.txt
echo	: 	   {+}	   [=]	: >> DATA\Road-3-2.txt
echo	:	:	:	: >> DATA\Road-3-2.txt
echo	:			: >> DATA\Road-3-2.txt
echo. >> DATA\Road-3-2.txt
goto MENU
) Else (
rd /s /q DATA
goto DATA
)


:MENU
set CHOSENOPTION=MENUA
goto SETTINGS
:MENUA
set AITEST=0
set SCORE=0
if not exist Savedata\ ( mkdir Savedata )
if /I "%ECHOSTAT%"=="ON" ( @ECHO ON ) Else ( @ECHO OFF )
set AITEST=0
set SCORE=0
call :menuFUNCTION1 "RaceGame" a "MAIN MENU" 
call :menuFUNCTION2 MENUA True Start START Highscores SCORES TESTMODE TESTMODE Exit EXIT
goto MENU

:TESTMODE
cls
echo enabling testmode...
set TESTMODE=1
goto TESTMODEMENU

:TESTMODEMENU
cls
if /I "%ECHOSTAT%"=="ON" ( @ECHO ON ) Else ( @ECHO OFF )
call :menuFUNCTION1 "RaceGame (TESTMODE)" b "TEST MENU" 
call :menuFUNCTION2 MENUA True Start START Highscores SCORES RoadTester ROADTESTER "Ai Test" AITEST "Gameover Screen" GAMEOVER "Debug Option Menu" DebugOptions "Exit TestMode" DISABLETESTMODE "Exit Game" EXIT
goto TESTMODEMENU

:DebugOptions
cls
title Debug Options
if /I "%ECHOSTAT%"=="ON" ( @ECHO ON ) Else ( @ECHO OFF )
color b
@ECHO  ----------------------------
@ECHO  ---------Debug Tool---------
@ECHO  ----------------------------
@ECHO. 
@ECHO.
@ECHO  1) Toggle Echo
@ECHO  2) Toggle Coordinates
@ECHO  Currently: 
@ECHO           ECHO:          %ECHOSTAT%
@ECHO           COORDINATES:   %COORDINATESTAT%
@ECHO.
@ECHO.
@ECHO  3) Config Options
@ECHO.
@ECHO  ----------------------------
@echo  4) Manual GOTO
@ECHO.
@ECHO  5) Back
@ECHO  ----------------------------
@ECHO.
@choice /c 12345 /M "Which thing do you want to run? [1-5]: " /n 
if errorlevel 5 goto TESTMODEMENU
if errorlevel 4 goto ManualGOTO
if errorlevel 3 goto READCONFIG
if errorlevel 2 goto TOGGLECOORDINATES
if errorlevel 1 goto TOGGLEECHO
goto DebugOptions

:TOGGLECOORDINATES
cls
if /I "%COORDINATESTAT%"=="OFF" (
	echo Enabling Coordinates
	set COORDINATESTAT=ON
	) else (
		echo Disabling Coordinates
	   set COORDINATESTAT=OFF
	)
goto DebugOptions

:TOGGLEECHO
cls
if /I "%ECHOSTAT%"=="OFF" ( 
	echo Enabling Echo
	set ECHOSTAT=ON
	) else (
		echo Disabling Echo
	   set ECHOSTAT=OFF
	)
goto DebugOptions


:DISABLETESTMODE
cls
echo Disabling testmode...
set TESTMODE=0
goto MENU


:START
cls
if /I "%ECHOSTAT%"=="ON" ( @ECHO ON ) Else ( @ECHO OFF )
color a
title RoadGame
echo Press a key to start!
pause >nul
cls


color e
echo loading global config...
set CHOSENOPTION=ROADGAMELOADED
goto LOADCONFIG
:ROADGAMELOADED
color d
echo.
echo Loaded Config!!
color a


rem set COORDINATESTAT=ON

:roadgame
cls

echo Random move generator for enemy >nul
set r1=%random%

if /I "%AICHGDIR%"=="YES" ( goto CHANGEAIGAME ) else ( goto NOCHANGEAIGAME )

:NOCHANGEAIGAME
if /I "%USEAIDOWN%"=="YES" ( goto NOCHANGEAINGAMECUST ) else ( goto NOCHANGEAINGAME )
goto NOCHANGEAINGAME

:NOCHANGEAINGAMECUST
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis) ) Else ( if %r1% GTR %AICONFDMIN% ( if %r1% LSS %AICONFDMAX% ( set /A eYaxis=eYaxis-1 ) else ( goto AICALCERROR ) ) else ( goto AICALCERROR ) ) ) )
goto NXTGAME

:NOCHANGEAINGAME
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis) ) Else ( if %eYaxis% GTR %eYmin% ( set /A eYaxis=eYaxis-1 ) ) ) )
goto NXTGAME

:CHANGEAIGAME
if /I "%USEAIDOWN%"=="YES" ( goto CHANGEAINGAMECUST ) else ( goto CHANGEAINGAME )
goto CHANGEAINGAME

:CHANGEAINGAMECUST
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1) ) Else ( if %r1% GTR %AICONFDMIN% ( if %r1% LSS %AICONFDMAX% ( set /A eYaxis=eYaxis-1 ) else ( goto AICALCERROR ) ) else ( goto AICALCERROR ) ) ) )
goto NXTGAME

:CHANGEAINGAME
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1) ) Else ( if %eYaxis% GTR %eYmin% ( set /A eYaxis=eYaxis-1 ) ) ) )
goto NXTGAME

:NXTGAME
echo Moves enemy back when reaching end of road >nul
set eYmin=-1
if %eYaxis% EQU %eYmin% ( set /a eYaxis=eYmax )

echo Your score >nul
echo Score = %SCORE%


echo Score adding thing >nul
if %Yaxis% EQU %eYaxis% ( if %Xaxis% EQU %eXaxis% ( goto GAMEOVER ) ) else ( set /A SCORE=SCORE+1 )

if /I "%ALLOWPLAYER%"=="NO" ( goto PLAYERHIGHGAME) else ( goto PLAYERHIGHGAME )

:PLAYERHIGHGAME
echo Resets road counter every loop >nul
set /a ROAD=eYmax+1

:ROADLOOPERGAMENHIGH
set /a ROAD=5
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) ) & echo Score = %SCORE%
set /a ROAD=4
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
set /a ROAD=3
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
set /a ROAD=2
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
set /a ROAD=1
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
set /a ROAD=0
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )


goto ROADGAMEN

:NOPLAYERHIGHGAME
echo Resets road counter every loop >nul
set /a ROAD=eYmax

if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt )
:ROADLOOPERGAMEN
set /a ROAD=ROAD-1
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
if %ROAD% NEQ 0 ( goto ROADLOOPERGAMEN ) Else ( goto ROADGAMEN )

:ROADGAMEN
echo.
if /I "%COORDINATESTAT%"=="ON" (
	echo Coordinates:
	echo  Player: X: %Xaxis%
	echo          Y: %Yaxis%
	echo.
	echo  Enemy:  X: %eXaxis%
	echo          Y: %eYaxis%
	echo Random ai:
	echo %r1%
   echo %AICONFL%      %AICONFR%
)

@choice /c WASDMP /n /T 1 /D M >nul
if errorlevel 6 cls & pause
if errorlevel 5 goto roadgame
if errorlevel 4 if not %Xaxis% GEQ %Xmax% ( set /A Xaxis=Xaxis+1 ) Else ( set /A Xaxis=Xmax)
if errorlevel 3 if not %Yaxis% LEQ %Ymin% ( set /A Yaxis=Yaxis-1 ) Else ( set /A Yaxis=Ymin)
if errorlevel 2 if not %Xaxis% LEQ %Xmin% ( set /A Xaxis=Xaxis-1 ) Else ( set /A Xaxis=Xmin)
if errorlevel 1 if not %Yaxis% GEQ %Ymax% ( set /A Yaxis=Yaxis+1 ) Else ( set /A Yaxis=Ymax)

goto roadgame


:SCORES
cls
echo Saved Scores:
echo.
type Savedata\Score.txt
echo.
echo Press a key to return to the menu...
pause >nul
goto MENU



:ROADTESTER
cls
color a
title RoadTester
echo Da Test Thing For Debugging The Road, Press a Key To Start Testing!
pause >nul
cls
color e
echo loading global config...
set CHOSENOPTION=ROADTESTLOADED
goto LOADCONFIG
:ROADTESTLOADED
color d
echo.
echo Loaded Config!!
color a
:roadloop
cls
color b

echo Your score >nul
echo Score = %SCORE%


echo Score adding thing >nul
set /A SCORE=SCORE+1




if %ALLOWPLAYER% EQU NO ( goto NOPLAYERHIGHTEST ) else ( goto PLAYERHIGHTEST )

:PLAYERHIGHTEST
echo Resets road counter every loop >nul
set /a ROAD=eYmax

:ROADLOOPERTESTNHIGH
set /a ROAD=ROAD-1
if %Yaxis% NEQ %ROAD% ( if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt ) ) Else ( if %Yaxis% EQU %eYaxis% ( type DATA\Road-%eXaxis%-%Xaxis%.txt ) Else ( type DATA\Road-0-%Xaxis%.txt ) )
if %ROAD% NEQ 0 ( goto ROADLOOPERTESTNHIGH ) Else ( goto ROADTESTN )

:NOPLAYERHIGHTEST
echo Resets road counter every loop >nul
set /a ROAD=eYmax-1

if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt )

:ROADLOOPERTESTN
set /a ROAD=ROAD-1
if %Yaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-0-%Xaxis%.txt )
if %ROAD% NEQ 0 ( goto ROADLOOPERTESTN ) Else ( goto ROADTESTN )

:ROADTESTN
echo.
if /I "%COORDINATESTAT%"=="ON" (
	echo Coordinates:
	echo  Player: X: %Xaxis%
	echo          Y: %Yaxis%
)

@choice /c WASDMPC /n /T 1 /D M >nul
if errorlevel 7 goto MENU
if errorlevel 6 cls & pause
if errorlevel 5 goto roadloop
if errorlevel 4 if not %Xaxis% GEQ %Xmax% ( set /A Xaxis=Xaxis+1 ) Else ( set /A Xaxis=Xmax)
if errorlevel 3 if not %Yaxis% LEQ %Ymin% ( set /A Yaxis=Yaxis-1 ) Else ( set /A Yaxis=Ymin)
if errorlevel 2 if not %Xaxis% LEQ %Xmin% ( set /A Xaxis=Xaxis-1 ) Else ( set /A Xaxis=Xmin)
if errorlevel 1 if not %Yaxis% GEQ %Ymax% ( set /A Yaxis=Yaxis+1 ) Else ( set /A Yaxis=Ymax)

goto roadloop


:AITEST
cls
color d
title AI Tester

echo Da Test Thing For Debugging The AI, Press a Key To Start Testing!
pause >nul
cls

echo loading global config...
set CHOSENOPTION=AITESTLOADED
goto LOADCONFIG
:AITESTLOADED
color d
echo.
echo Loaded Config!!

:roadloopai
cls

echo Random move generator for enemy >nul
set r1=%random%

if /I "%AICHGDIR%"=="YES" ( goto CHANGEAI ) else ( goto NOCHANGEAI )

:NOCHANGEAI
if /I "%USEAIDOWN%"=="YES" ( goto NOCHANGEAINCUST ) else ( goto NOCHANGEAIN )
goto NOCHANGEAIN

:NOCHANGEAINCUST
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis ) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis ) ) Else ( if %r1% GTR %AICONFDMIN% ( if %r1% LSS %AICONFDMAX% ( set /A eYaxis=eYaxis-1 ) else ( goto AICALCERROR ) ) else ( goto AICALCERROR ) ) ) )

:NOCHANGEAIN
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis ) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis ) ) Else ( if %eYaxis% GTR %eYmin% ( set /A eYaxis=eYaxis-1 ) ) ) )
goto NXTAI

:CHANGEAI
if /I "%USEAIDOWN%"=="YES" ( goto CHANGEAINCUST ) else ( goto CHANGEAIN )
goto CHANGEAIN

:CHANGEAINCUST
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1 ) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1 ) ) Else ( if %r1% GTR %AICONFDMIN% ( if %r1% LSS %AICONFDMAX% ( set /A eYaxis=eYaxis-1 ) else ( goto AICALCERROR ) ) else ( goto AICALCERROR ) ) ) )
goto NXTAI

:CHANGEAIN
if %eYaxis% EQU 0 ( set eYaxis=eYmin ) Else ( if %r1% LSS %AICONFL% ( if %eXaxis% GTR %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1 ) ) ELSE ( if %r1% GTR %AICONFR% ( if %eXaxis% LSS %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1 ) ) Else ( if %eYaxis% GTR %eYmin% ( set /A eYaxis=eYaxis-1 ) ) ) )
goto NXTAI

:NXTAI
echo Moves enemy back when reaching end of road >nul
if %eYaxis% EQU %eYmin% ( set /a eYaxis=eYmax+1 )


echo Resets road counter every loop >nul
set /a ROAD=eYmax

:ROADLOOPERAIN
set /a ROAD=ROAD-1
if %eYaxis% NEQ %ROAD% ( type DATA\Road-0-0.txt ) Else ( type DATA\Road-%eXaxis%-0.txt )
if %ROAD% NEQ 0 ( goto ROADLOOPERAIN ) Else ( goto ROADAITESTN )

:ROADAITESTN
echo.
if /I "%COORDINATESTAT%"=="ON" (
	echo Coordinates:
	echo  Enemy:  X: %eXaxis%
	echo          Y: %eYaxis%
)

@choice /c MPC /n /T 1 /D M >nul
if errorlevel 3 goto MENU
if errorlevel 2 cls & pause
if errorlevel 1 goto roadloopai

goto roadloopai

goto MENU






:AICALCERROR
echo Oh no!! The number generator made a error!!
goto CHOSENOPTION




:GAMEOVER
cls
title DEAD BOIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
echo You Died
echo Score: %SCORE%
echo.
@choice /c YN /M "Save Score? [Y/N]: " /n
if errorlevel 2 goto MENU
if errorlevel 1 goto SAVE
goto error


:SAVE
cls
title Save Menu
color 1
set /P NAME=Please enter a name: 
echo.
@choice /c YN /M "Is this name correct? [Y/N]: " /n
if errorlevel 2 goto SAVE
if errorlevel 1 goto S2
:S2
echo %NAME%: %SCORE% >> Savedata\Score.txt
echo Score Saved! Press a key to go back to the menu...
pause >nul
goto MENU


:ERROR
title ERROR!
echo Something went wrong!
pause
goto Exit

:EXIT
cls
title BYE!!
echo Bye!
if %DELETETEXTURESBYEXIT% EQU NO ( 
	exit 
	) else (
	rmdir /s /q DATA
	exit
)


:RELOAD
set RELOAD=1
goto LOADCONFIG

:READCONFIG
cls
echo loading config...
@echo off
set CHOSENOPTION=READCONFIGLOADED
goto LOADCONFIG
:READCONFIGLOADED
echo config loaded!!
rem if %RELOAD% EQU 1 ( )

:READCONFIGMENU
cls
title Current Configuration
color b
set CHOSENOPTION=READCONFIGMENU
if /I "%ECHOSTAT%"=="ON" ( @ECHO ON ) Else ( @ECHO OFF )
@ECHO  ----------------------------
@ECHO  -----------Config-----------
@ECHO  ----------------------------
@ECHO. 
@ECHO.
@ECHO  1) Read Userconfig
@ECHO.
@ECHO  2) Read Advanced config
@ECHO.
@ECHO  3) Edit config
@ECHO.
@ECHO  4) Edit advanced config
@ECHO.
@ECHO  5) Backup config
@ECHO.
@echo  6) Reset config
@ECHO.
@ECHO  ----------------------------
@ECHO  7) Back
@ECHO  ----------------------------
@ECHO.
@choice /c 1234567 /M "Which thing do you want to run? [1-7]: " /n 
if errorlevel 7 goto DebugOptions
if errorlevel 6 goto RESETCONFIG
if errorlevel 5 goto BACKUPCONFIG
if errorlevel 4 goto EDITADVCONFIG
if errorlevel 3 goto EDITCONFIG
if errorlevel 2 goto READADVCONFIG
if errorlevel 1 goto READUSERCONFIG
goto READCONFIGMENU

:ManualGOTO
cls
set /p CHOSENOPTION="Enter Goto Name Thingy: "
goto %CHOSENOPTION%

:BACK
echo Press any key to go back...
pause >nul
goto %CHOSENOPTION%

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


:menuFUNCTION1
setlocal
set Title=%~1
set Color=%2
set TitleBar=%~3
cls
title %TitleBar%
color %Color%
@ECHO ----------------------------
@ECHO -----%Title%
@ECHO ----------------------------
echo.
endlocal
exit /B
:menuFUNCTION2
setlocal enableextensions
set PrevMenu=%1
set NoBack=%2
Shift & Shift
set Optiona1=%~1
set Optionb1=%~2
set Optiona2=%~3
set Optionb2=%~4
set Optiona3=%~5
set Optionb3=%~6
set Optiona4=%~7
set Optionb4=%~8
set Optiona5=%~9
Shift & Shift & Shift & Shift & Shift & Shift & Shift & Shift & Shift
set Optionb5=%~1
set Optiona6=%~2
set Optionb6=%~3
set Optiona7=%~4
set Optionb7=%~5
set Optiona8=%~6
set Optionb8=%~7
@ECHO.
@ECHO.
if not "%Optiona1%" == "" ( set /a count=1 & echo 1^) %Optiona1% & if not "%Optiona2%" == "" ( set /a count=2 & echo 2^) %Optiona2% & if not "%Optiona3%" == "" ( set /a count=3 & echo 3^) %Optiona3% & if not "%Optiona4%" == "" ( set /a count=4 & echo 4^) %Optiona4% & if not "%Optiona5%" == "" ( set /a count=5 & echo 5^) %Optiona5% & if not "%Optiona6%" == "" ( set /a count=6 & echo 6^) %Optiona6% & if not "%Optiona7%" == "" ( set /a count=7 & echo 7^) %Optiona7% & if not "%Optiona8%" == "" ( set /a count=8 & echo 8^) %Optiona8% ) else ( set Optionb8=MenuItemChooser )) else ( set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb3=MenuItemChooser & set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb2=MenuItemChooser & set Optionb3=MenuItemChooser & set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( cls & echo Empty menu! & goto error )
if not %NoBack% == True (
@ECHO.
@ECHO ----------------------------
@ECHO 9^) Back
@ECHO ----------------------------
@ECHO.
) else ( @ECHO. )
set counter=1
set Choice=1
:MenuChoiceLoop
set /a counter=counter+1
set Choice=%Choice%%counter%
if %counter% equ %count% ( goto EndOfMenuChoiceLoop )
goto MenuChoiceLoop
:EndOfMenuChoiceLoop
if not %NoBack% == True ( set string="Which thing do you want to run? [1-%count%, 9]: " ) else ( set string="Which thing do you want to run? [1-%count%]: " )
:MenuItemChooser
choice /c 123456789 /M %string% /n 
if errorlevel 9 ( if not %NoBack% == True ( cls & endlocal & goto %PrevMenu% ) else ( goto MenuItemChooser2 ) )
if errorlevel 8 ( if not %Optionb8% == MenuItemChooser ( cls & endlocal & goto %Optionb8% ) else ( goto MenuItemChooser2 ) )
if errorlevel 7 ( if not %Optionb7% == MenuItemChooser ( cls & endlocal & goto %Optionb7% ) else ( goto MenuItemChooser2 ) )
if errorlevel 6 ( if not %Optionb6% == MenuItemChooser ( cls & endlocal & goto %Optionb6% ) else ( goto MenuItemChooser2 ) )
if errorlevel 5 ( if not %Optionb5% == MenuItemChooser ( cls & endlocal & goto %Optionb5% ) else ( goto MenuItemChooser2 ) )
if errorlevel 4 ( if not %Optionb4% == MenuItemChooser ( cls & endlocal & goto %Optionb4% ) else ( goto MenuItemChooser2 ) )
if errorlevel 3 ( if not %Optionb3% == MenuItemChooser ( cls & endlocal & goto %Optionb3% ) else ( goto MenuItemChooser2 ) )
if errorlevel 2 ( if not %Optionb2% == MenuItemChooser ( cls & endlocal & goto %Optionb2% ) else ( goto MenuItemChooser2 ) )
if errorlevel 1 ( if not %Optionb1% == MenuItemChooser ( cls & endlocal & goto %Optionb1% ) else ( goto MenuItemChooser2 ) )
goto MenuItemChooser2
:MenuItemChooser2
choice /c 123456789 /n 
if errorlevel 9 ( if not %NoBack% == True ( cls & endlocal & goto %PrevMenu% ) else ( goto MenuItemChooser2 ) )
if errorlevel 8 ( if not %Optionb8% == MenuItemChooser ( cls & endlocal & goto %Optionb8% ) else ( goto MenuItemChooser2 ) )
if errorlevel 7 ( if not %Optionb7% == MenuItemChooser ( cls & endlocal & goto %Optionb7% ) else ( goto MenuItemChooser2 ) )
if errorlevel 6 ( if not %Optionb6% == MenuItemChooser ( cls & endlocal & goto %Optionb6% ) else ( goto MenuItemChooser2 ) )
if errorlevel 5 ( if not %Optionb5% == MenuItemChooser ( cls & endlocal & goto %Optionb5% ) else ( goto MenuItemChooser2 ) )
if errorlevel 4 ( if not %Optionb4% == MenuItemChooser ( cls & endlocal & goto %Optionb4% ) else ( goto MenuItemChooser2 ) )
if errorlevel 3 ( if not %Optionb3% == MenuItemChooser ( cls & endlocal & goto %Optionb3% ) else ( goto MenuItemChooser2 ) )
if errorlevel 2 ( if not %Optionb2% == MenuItemChooser ( cls & endlocal & goto %Optionb2% ) else ( goto MenuItemChooser2 ) )
if errorlevel 1 ( if not %Optionb1% == MenuItemChooser ( cls & endlocal & goto %Optionb1% ) else ( goto MenuItemChooser2 ) )
goto MenuItemChooser2
endlocal
exit /B