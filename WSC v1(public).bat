@echo off
chcp 65001 >nul
color f5
title Windows System Checker v1 - by AW

:start
call :background
:: Check if the script is running as Administrator
NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
	echo.
	echo.
    echo This script needs to be run as Administrator. Re-open this batch file as Administrator for it to start working.
	echo.
	echo To do so, simply right-click on the batch file and press "Run as administrator".
	echo.
	echo.
    pause
    exit
)

:: Your batch file commands here
echo.
echo.
echo Running with administrative privileges!
echo.
echo	   Press Enter to continue.
echo.
echo.
pause
cls

:menu
call :background
echo.
echo NOTE: GO TO EXPLANATION AND CREATE A RESTORE POINT BEFORE USING COMMANDS
echo.
echo		1) System File Check
echo		2) Disk Defragmentation
echo			10) Check if you have HDD or SSD
echo		3) Disk Check
echo		4) Flush DNS Cache
echo		5) Manually disable unnecessary start-up programms
echo		6) Reset your network settings (not recommended)
echo		7) Check all temporary files and/or manually delete them
echo		8) Create a restore point (MANDATORY AND MANUAL)
echo.
echo		---------------------------------------------------------
echo.
echo		0) Explanation for the commands
echo.
set /p input=%B%     Choice:
if /I %input% EQU 0 call :menu3 && pause
if /I %input% EQU 1 start sfc /SCANNOW && echo %errorlevel% [MISTAKES FOUND] && echo System File Check was succesful! && pause
if /I %input% EQU 2 call :menu1
if /I %input% EQU 10 (
	start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools"
	start dfrgui.exe
	)
if /I %input% EQU 3 call :menu2
if /I %input% EQU 4 start ipconfig /flushdns
if /I %input% EQU 5 start msconfig
if /I %input% EQU 6 start netsh
if /I %input% EQU 7 start Temp && start "" "C:\Users\328F~1\AppData\Local\Temp"
if /I %input% EQU 8 start https://www.youtube.com/watch?v=vKH0QeV0coM
cls
goto start
pause
:menu1
cls
echo.
echo.
echo 	Press enter to go back to start
echo.
echo.
echo			1)HDD Disks
echo			2)SSD Disks
echo.
set /p input=%B%     Choice: 
if /I %input% EQU 1 call :menu4 
if /I %input% EQU 2 call :menu5
cls
goto start
echo.
pause
:menu2
cls
echo.
echo.
echo	Press enter to go back to start
echo.
echo			1) Disk C:
echo			2) Disk D:
echo			3) Disk E:
echo			4) Disk F:
echo			5) Disk G:
echo			6) Disk H:
echo			7) Disk J:
echo			8) Disk K:
echo			9) Disk L:
echo			10) Disk P:
echo.
set /p input=%B%     Choice: 
if /I %input% EQU 1 start chkdsk C: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 2 start chkdsk D: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 3 start chkdsk E: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 4 start chkdsk F: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 5 start chkdsk G: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 6 start chkdsk H: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 7 start chkdsk J: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 8 start chkdsk K: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 9 start chkdsk L: /V && echo %errorlevel% [Mistakes Found] && pause
if /I %input% EQU 10 start chkdsk P: /V && echo %errorlevel% [Mistakes Found] && pause
cls
goto start
echo.
pause
:menu3
cls
echo.
echo.
echo			!ALL OPTIONS OPEN YOUTUBE! Press enter to go back to start
echo.
echo.
echo			1) sfc explained
echo			2) Disk Defrag explained
echo			3) Disk check [chkdsk] explained
echo			4) Flush DNS Cache explained
echo			5) Msconfig explained
echo			6) Netsh (network reset) explained
echo			7) Temp files explained
echo.
set /p input=%B%     Choice:
if /I %input% EQU 1 start https://www.youtube.com/watch?v=0ORXhaEOgxw
if /I %input% EQU 2 start https://www.youtube.com/watch?v=AtRIOUZuI2c
if /I %input% EQU 3 start https://www.youtube.com/watch?v=b41yobfBt4E
if /I %input% EQU 4 start https://www.youtube.com/watch?v=ZKhorleA5aA
if /I %input% EQU 5 start https://www.youtube.com/watch?v=XOlW4fGZzkI&t=23s
if /I %input% EQU 6 start https://www.youtube.com/watch?v=Ktc6Q_yhwJA
if /I %input% EQU 7 start https://www.youtube.com/watch?v=i4gH9zPCyS8
cls
goto start
echo.

:menu4
cls
echo.
echo.
echo 	Press enter to go back to start
echo.
echo.
echo			1) Disk C:
echo			2) Disk D:
echo			3) Disk E:
echo			4) Disk F:
echo			5) Disk G:
echo			6) Disk H:
echo			7) Disk J:
echo			8) Disk K:
echo			9) Disk L:
echo			10) Disk P:
echo.
set /p input=%B%     Choice: 
if /I %input% EQU 1 start defrag.exe c: -f -v > C:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start defrag.exe d: -f -v > D:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start defrag.exe e: -f -v > E:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start defrag.exe f: -f -v > F:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start defrag.exe g: -f -v > G:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start defrag.exe h: -f -v > H:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start defrag.exe j: -f -v > J:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start defrag.exe k: -f -v > K:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start defrag.exe l: -f -v > L:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start defrag.exe p: -f -v > P:\defraglog.log && echo Disk Defragmentation was succesful! && pause

cls
goto start
echo.
pause

:menu5
cls
echo.
echo.
echo 	Press enter to go back to start
echo.
echo.
echo			1) Disk C:
echo			2) Disk D:
echo			3) Disk E:
echo			4) Disk F:
echo			5) Disk G:
echo			6) Disk H:
echo			7) Disk J:
echo			8) Disk K:
echo			9) Disk L:
echo			10) Disk P:
echo.
set /p input=%B%     Choice: 
if /I %input% EQU 1 start fsutil behavior set DisableDeleteNotify 0 && defrag C: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start fsutil behavior set DisableDeleteNotify 0 && defrag D: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start fsutil behavior set DisableDeleteNotify 0 && defrag E: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start fsutil behavior set DisableDeleteNotify 0 && defrag F: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start fsutil behavior set DisableDeleteNotify 0 && defrag G: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start fsutil behavior set DisableDeleteNotify 0 && defrag H: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start fsutil behavior set DisableDeleteNotify 0 && defrag J: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start fsutil behavior set DisableDeleteNotify 0 && defrag K: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start fsutil behavior set DisableDeleteNotify 0 && defrag L: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start fsutil behavior set DisableDeleteNotify 0 && defrag P: /L && echo Disk Defragmentation was succesful! && pause

cls
goto start
echo.
pause

:background
echo.
echo.
echo 				888       888  .d8888b.   .d8888b.                d888   
echo 				888   o   888 d88P  Y88b d88P  Y88b              d8888   
echo 				888  d8b  888 Y88b.      888    888                888   
echo 				888 d888b 888  "Y888b.   888             888  888  888   
echo 				888d88888b888     "Y88b. 888             888  888  888   
echo 				88888P Y88888       "888 888    888      Y88  88P  888   
echo 				8888P   Y8888 Y88b  d88P Y88b  d88P       Y8bd8P   888   
echo 				888P     Y888  "Y8888P"   "Y8888P"         Y88P  8888888 			                                                         
echo.
echo.
pause