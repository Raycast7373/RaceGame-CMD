@echo off
set SCORE=0
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
cls
title MAIN MENU
set AITEST=0
set SCORE=0
color a
if not exist Savedata\ ( mkdir Savedata )
@ECHO  ----------------------------
@ECHO  		Race Thing
@ECHO  ----------------------------
@ECHO. 
@ECHO.
@ECHO  1) Start
@ECHO  2) Scores
@ECHO.
@ECHO  3) RoadTester
@ECHO  4) AI Test
@ECHO.
@ECHO  ----------------------------
@ECHO  5) Exit         
@ECHO  ----------------------------
@ECHO.
@choice /c 12345 /M "Which thing do you want to run? [1-5]: " /n 
if errorlevel 5 goto EXIT
if errorlevel 4 goto AITEST
if errorlevel 3 goto ROADTESTER
if errorlevel 2 goto SCORES
if errorlevel 1 goto START
goto MENU

:START
cls
color a
title RoadGame
echo Press a key to start!
pause >nul
cls
set Xaxis=1
set Yaxis=0

set Xmin=0
set Xmax=2

set Ymin=0
set Ymax=3

set eXaxis=1
set eYaxis=5

set eXmin=0
set eXmax=2

set eYmin=-1
set eYmax=5
color e
:roadgame
echo cls
@echo on

set r1=%random%
if %eYaxis% EQU 0 ( set eYaxis=-1 ) Else ( if %r1% LSS 6915 ( if not %eXaxis% LEQ %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1) ) ELSE ( if %r1% GTR 25852 ( if not %eXaxis% GEQ %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1) ) Else ( if not %eYaxis% LEQ %eYmin% ( set /A eYaxis=eYaxis-1 ) Else ( set /A eYaxis=eYmin) ) ) )


if %eYaxis% EQU -1 ( set eYaxis=4 )

echo Score = %SCORE%

if %Yaxis% EQU %eYaxis% ( 
if %Xaxis% EQU %eXaxis% ( 
goto GAMEOVER 
) 
) else ( set /A SCORE=SCORE+1 )



if %Yaxis% EQU %eYaxis% ( 
if %Xaxis% EQU 1 ( 
if %eXaxis% EQU 2 ( 
type DATA\Road-2-1.txt 
) Else ( 
if %Xaxis% EQU 2 ( 
if %eXaxis% EQU 1 ( 
type DATA\Road-1-2.txt 
) Else ( 
type Road-3-2.txt 
) 
) 
) 
) ElsE ( 
if %Yaxis% NEQ 4 ( 
if %eYaxis% NEQ 4 ( 
type DATA\Road-0-0.txt 
) Else ( 
if %eXaxis% EQU 0 ( 
type DATA\Road-1-0.txt 
) Else ( 
if %eXaxis% EQU 1 ( 
type DATA\Road-2-0.txt 
) Else ( 
if %eXaxis% EQU 2 ( 
type DATA\Road-3-0.txt 
) 
) 
) 
)
) Else ( 
if %Xaxis% EQU 0 ( 
type DATA\Road-0-1.txt 
) Else ( 
if %Xaxis% EQU 1 ( 
type DATA\Road-0-2.txt 
) Else ( if %Xaxis% EQU 2 ( 
type DATA\Road-0-3.txt 
) 
) 
) 
)

if %Yaxis% EQU %eYaxis% ( if %Xaxis% EQU 1 ( if %eXaxis% EQU 2 ( type DATA\Road-2-1.txt ) Else ( if %Xaxis% EQU 2 ( if %eXaxis% EQU 1 ( type DATA\Road-1-2.txt ) Else ( type Road-3-2.txt ) ) 
) Else ( if %Yaxis% NEQ 3 ( if %eYaxis% NEQ 3 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) ) ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )

if %Yaxis% EQU %eYaxis% ( if %Xaxis% EQU 1 ( if %eXaxis% EQU 2 ( type DATA\Road-2-1.txt ) Else ( if %Xaxis% EQU 2 ( if %eXaxis% EQU 1 ( type DATA\Road-1-2.txt ) Else ( type Road-3-2.txt ) ) 
) Else ( if %Yaxis% NEQ 2 ( if %eYaxis% NEQ 2 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) ) ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )

if %Yaxis% EQU %eYaxis% ( if %Xaxis% EQU 1 ( if %eXaxis% EQU 2 ( type DATA\Road-2-1.txt ) Else ( if %Xaxis% EQU 2 ( if %eXaxis% EQU 1 ( type DATA\Road-1-2.txt ) Else ( type Road-3-2.txt ) ) 
) Else ( if %Yaxis% NEQ 1 ( if %eYaxis% NEQ 1 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) ) ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )

if %Yaxis% EQU %eYaxis% ( if %Xaxis% EQU 1 ( if %eXaxis% EQU 2 ( type DATA\Road-2-1.txt ) Else ( if %Xaxis% EQU 2 ( if %eXaxis% EQU 1 ( type DATA\Road-1-2.txt ) Else ( type Road-3-2.txt ) ) 
) Else ( if %Yaxis% NEQ 0 ( if %eYaxis% NEQ 0 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) ) ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )





@choice /c WASDMP /n /T 1 /D M >nul
if errorlevel 6 cls & pause
if errorlevel 5 goto roadgame
if errorlevel 4 if not %Xaxis% GEQ %Xmax% ( set /A Xaxis=Xaxis+1 ) Else ( set /A Xaxis=Xmax)
if errorlevel 3 if not %Yaxis% LEQ %Ymin% ( set /A Yaxis=Yaxis-1 ) Else ( set /A Yaxis=Ymin)
if errorlevel 2 if not %Xaxis% LEQ %Xmin% ( set /A Xaxis=Xaxis-1 ) Else ( set /A Xaxis=Xmin)
if errorlevel 1 if not %Yaxis% GEQ %Ymax% ( set /A Yaxis=Yaxis+1 ) Else ( set /A Yaxis=Ymax)

goto roadgame

goto GAMEOVER



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
set Xaxis=1
set Yaxis=0

set Xmin=0
set Xmax=2

set Ymin=0
set Ymax=3

if %AITEST% EQU 1 ( goto roadloopai ) Else ( goto roadloop )
:roadloop
cls
color b
if %Yaxis% NEQ 5 ( type DATA\Road-0-0.txt )
if %Yaxis% NEQ 4 ( type DATA\Road-0-0.txt )
if %Yaxis% NEQ 3 ( type DATA\Road-0-0.txt ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )
if %Yaxis% NEQ 2 ( type DATA\Road-0-0.txt ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )
if %Yaxis% NEQ 1 ( type DATA\Road-0-0.txt ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )
if %Yaxis% NEQ 0 ( type DATA\Road-0-0.txt ) Else ( if %Xaxis% EQU 0 ( type DATA\Road-0-1.txt ) Else ( if %Xaxis% EQU 1 ( type DATA\Road-0-2.txt ) Else ( if %Xaxis% EQU 2 ( type DATA\Road-0-3.txt ) ) ) )

echo X=%Xaxis%
echo Y=%Yaxis%

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
set eXaxis=1
set eYaxis=5

set eXmin=0
set eXmax=2

set eYmin=-1
set eYmax=5


:roadloopai
cls

set r1=%random%
if %eYaxis% EQU 0 ( set eYaxis=-1 ) Else ( if %r1% LSS 6915 ( if not %eXaxis% LEQ %eXmin% ( set /A eXaxis=eXaxis-1 ) Else ( set /A eXaxis=eXaxis+1) ) ELSE ( if %r1% GTR 25852 ( if not %eXaxis% GEQ %eXmax% ( set /A eXaxis=eXaxis+1 ) Else ( set /A eXaxis=eXaxis-1) ) Else ( if not %eYaxis% LEQ %eYmin% ( set /A eYaxis=eYaxis-1 ) Else ( set /A eYaxis=eYmin) ) ) )

if %eYaxis% EQU -1 ( set eYaxis=5 )

echo if %eYaxis% NEQ 5 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) ) >nul

if %eYaxis% NEQ 4 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) )
if %eYaxis% NEQ 3 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) )
if %eYaxis% NEQ 2 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) )
if %eYaxis% NEQ 1 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) )
if %eYaxis% NEQ 0 ( type DATA\Road-0-0.txt ) Else ( if %eXaxis% EQU 0 ( type DATA\Road-1-0.txt ) Else ( if %eXaxis% EQU 1 ( type DATA\Road-2-0.txt ) Else ( if %eXaxis% EQU 2 ( type DATA\Road-3-0.txt ) ) ) )

echo X=%eXaxis%
echo Y=%eYaxis%

@choice /c MPC /n /T 1 /D M >nul
if errorlevel 3 goto MENU
if errorlevel 2 cls & pause
if errorlevel 1 goto roadloopai

goto roadloopai

goto MENU












:GAMEOVER
cls
title DEAD BOIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
echo U DED
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
exit


