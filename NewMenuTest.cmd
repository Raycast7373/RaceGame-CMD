@echo off
set test=this is another test i guess
set color=b
set PrevMenu=placeholder

call :menuFUNCTION1 "%test%" %color%
call :menuFUNCTION2 %PrevMenu% 1 1 2 2 3 3 4 4 5 5 6 6

echo wut
goto end
:menuFUNCTION1
setlocal
set Title=%~1
set Color=%2

cls
title %Title%
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
Shift
rem shifting 1 time to make it possible to have 9 menu items
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

rem Optiona is the title of the option
rem Optionb is what the option will do ( where it will go using goto )
@ECHO.
@ECHO.
if not "%Optiona1%" == "" ( set /a count=1 & echo 1^) %Optiona1% & if not "%Optiona2%" == "" ( set /a count=2 & echo 2^) %Optiona2% & if not "%Optiona3%" == "" ( set /a count=3 & echo 3^) %Optiona3% & if not "%Optiona4%" == "" ( set /a count=4 & echo 4^) %Optiona4% & if not "%Optiona5%" == "" ( set /a count=5 & echo 5^) %Optiona5% & if not "%Optiona6%" == "" ( set /a count=6 & echo 6^) %Optiona6% & if not "%Optiona7%" == "" ( set /a count=7 & echo 7^) %Optiona7% & if not "%Optiona8%" == "" ( set /a count=8 & echo 1^) %Optiona1% ) else ( set Optionb8=MenuItemChooser )) else ( set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb3=MenuItemChooser & set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( set Optionb2=MenuItemChooser & set Optionb3=MenuItemChooser & set Optionb4=MenuItemChooser & set Optionb5=MenuItemChooser & set Optionb6=MenuItemChooser & set Optionb7=MenuItemChooser & set Optionb8=MenuItemChooser )) else ( cls & echo Empty menu! & goto error )
rem this counts the ammount of menu items
@ECHO.
@ECHO ----------------------------
@ECHO 9) Back
@ECHO ----------------------------
@ECHO.
set counter=1
set Choice=1
:MenuChoiceLoop
set /a counter=counter+1
set Choice=%Choice%%counter%
if %counter% equ %count% ( goto EndOfMenuChoiceLoop )
goto MenuChoiceLoop
:EndOfMenuChoiceLoop
:MenuItemChooser
choice /c 123456789 /M "Which thing do you want to run? [1-%count%, 9]: " /n 
if errorlevel 9 ( cls & endlocal & goto %PrevMenu% )
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
if errorlevel 9 ( cls & endlocal & goto %PrevMenu% )
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

:1
echo 1
goto end
:2
echo 2
goto end
:3
echo 3
goto end
:4
echo 4
goto end
:5
echo 5
goto end
:6
echo 6
goto end
:7
echo 7
goto end
:8
echo 8
goto end




:end
echo this is the end
color a
pause
exit