@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
color 0c
title Windows System Checker v3(complete) - by AW

:start
call :background
NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
	echo.
	echo.
    echo    This script needs to be run as Administrator. Re-open this batch file as Administrator for it to start working.
	echo.
	echo.
	echo    To do so, simply right-click on the batch file and press "Run as administrator".
	echo.
	echo.
    pause
    exit
)

echo.
echo.
echo Running with administrative privileges!
echo.
echo Press any key twice to enter the main menu.
echo.
echo.
pause
goto menu

:menu
cls
call :background
echo.
echo NOTE: GO TO EXPLANATION AND CREATE A RESTORE POINT BEFORE USING COMMANDS
echo.
echo	1) System Restoration menu
echo	2) Disk Optimization menu
echo	3) Network settings
echo	4) Check your Temp folders
echo	5) Manually disable unnecessary start-up programms
echo	6) Create a restore point (MANDATORY AND MANUAL, WILL OPEN YOUTUBE)
echo	7) Misc
echo.
echo	---------------------------------------------------------------------
echo.
echo	0) User Guide (Opens YouTube)
echo.
set /p input=%B%     Choice:
(
if /I %input% EQU 0 call :menu3 && pause
if /I %input% EQU 1 call :resmenu && pause
if /I %input% EQU 2 call :menu1
if /I %input% EQU 3 call :ntwmenu
if /I %input% EQU 4 start Temp && start %Temp% && pause
if /I %input% EQU 5 start msconfig
if /I %input% EQU 6 start https://www.youtube.com/watch?v=vKH0QeV0coM
if /I %input% EQU 7 call :miscmenu
else goto menu && echo SELECT AN OPTION PROVIDED ABOVE BASED ON YOUR DESIRE 
)
cls
goto start
pause

:miscmenu
cls
call :background
echo.
echo.
echo			0) Exit to main menu
echo.
echo.
echo			1) Manually disable unnecessary start-up programms
echo			2) Check all temporary files and/or manually delete them
echo.
echo.
set /p input=%B%     Choice:
if /I %input% equ 0 call :menu
if /I %input% equ 1 start msconfig
if /I %input% equ 2 start Temp && start %Temp% && pause
cls
echo.
pause

:ntwmenu
cls
call :background
echo.
echo.
echo			0) Exit to the main menu
echo.
echo.
echo			1) Flush DNS Cache
echo			2) Reset Network Settings (DANGEROUS)
echo.
echo.
set /p input=%B%     Choice:
if /I %input% equ 0 call :menu && pause
if /I %input% EQU 1 start ipconfig /flushdns
if /I %input% EQU 2 start netsh
cls
echo.
pause

:resmenu
cls
call :background
echo.
echo.
echo			0) Exit to the main menu
echo.
echo.
echo			1) System File Check
echo			2) DISM Restore Health (in case of faulty windows update)
echo			3) Scan for miners (STILL IN BETA, ONLY WORKS WITH STOCK MICROSOFR ANTIVIRUS "WinDefender", SHOULD RESTART YOUR PC)
echo			4) View your crash history
echo.
echo.
set /p input=%B%     Choice: 
if /I %input% equ 0 call :menu && pause
if /I %input% EQU 1 start sfc /SCANNOW && echo %errorlevel% [MISTAKES FOUND & FIXED] && echo System File Check was succesful! && pause
if /I %input% equ 2 start DISM /Online /Cleanup-Image /RestoreHealth
if /I %input% equ 3 (
echo Scanning for miners...
powershell -Command "Get-Service -Name WinDefender"
powershell -Command "Get-Service -Name WinDefender"
powershell -Command "Start-MpScan -ScanType FullScan"
pause
)
if /I %input% 4 perfmon /rel
cls
echo.
pause

:menu1
cls
echo.
echo.
echo.
echo.
echo			1)HDD Disks				0) Exit to the main menu
echo			2)SSD Disks
echo			3)Disk Info
echo.
echo			-----------------------------------------------------------------------
echo.
echo			Note: run disk info option before using this option, for it may make
echo			your pc slower if you dont get the right MediaType and drive letter.
set /p input=%B%     Choice: 
	if /I %input% EQU 1 call :menu4 && pause 
	if /I %input% EQU 2 call :menu5 && pause
	if /I %input% EQU 3 (
	start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools"
	start dfrgui.exe
	)
	if /I %input% equ 0 call :menu && pause
pause

cls
echo.
pause

:menu2
cls
echo.
echo.
echo	0) Exit to the main menu
echo.
echo			1) Disk A:
echo			2) Disk B:
echo			3) Disk C:
echo			4) Disk D:
echo			5) Disk E:
echo			6) Disk F:
echo			7) Disk G:
echo			8) Disk H:
echo			9) Disk I:
echo			10) Disk J:
echo			11) Disk K:
echo			12) Disk L:
echo			13) Disk M:
echo			14) Disk N:
echo			15) Disk O:
echo			16) Disk P:
echo			17) Disk Q:
echo			18) Disk R:
echo			19) Disk S:
echo			20) Disk T:
echo			21) Disk U:
echo			22) Disk V:
echo			23) Disk W:
echo			24) Disk X:
echo			25) Disk Y:
echo			26) Disk Z:
echo.
set /p input=%B%     Choice:
if /I %input% equ 0 call :menu && pause
if /I %input% EQU 1 start fsutil behavior set DisableDeleteNotify 0 && defrag A: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start fsutil behavior set DisableDeleteNotify 0 && defrag B: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start fsutil behavior set DisableDeleteNotify 0 && defrag C: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start fsutil behavior set DisableDeleteNotify 0 && defrag D: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start fsutil behavior set DisableDeleteNotify 0 && defrag E: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start fsutil behavior set DisableDeleteNotify 0 && defrag F: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start fsutil behavior set DisableDeleteNotify 0 && defrag G: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start fsutil behavior set DisableDeleteNotify 0 && defrag H: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start fsutil behavior set DisableDeleteNotify 0 && defrag I: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start fsutil behavior set DisableDeleteNotify 0 && defrag J: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 11 start fsutil behavior set DisableDeleteNotify 0 && defrag K: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 12 start fsutil behavior set DisableDeleteNotify 0 && defrag L: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 13 start fsutil behavior set DisableDeleteNotify 0 && defrag M: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 14 start fsutil behavior set DisableDeleteNotify 0 && defrag N: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 15 start fsutil behavior set DisableDeleteNotify 0 && defrag O: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 16 start fsutil behavior set DisableDeleteNotify 0 && defrag P: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 17 start fsutil behavior set DisableDeleteNotify 0 && defrag Q: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 18 start fsutil behavior set DisableDeleteNotify 0 && defrag R: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 19 start fsutil behavior set DisableDeleteNotify 0 && defrag S: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 20 start fsutil behavior set DisableDeleteNotify 0 && defrag T: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 21 start fsutil behavior set DisableDeleteNotify 0 && defrag U: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 22 start fsutil behavior set DisableDeleteNotify 0 && defrag V: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 23 start fsutil behavior set DisableDeleteNotify 0 && defrag W: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 24 start fsutil behavior set DisableDeleteNotify 0 && defrag X: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 25 start fsutil behavior set DisableDeleteNotify 0 && defrag Y: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 26 start fsutil behavior set DisableDeleteNotify 0 && defrag Z: /L && echo Disk Defragmentation was succesful! && pause
cls
echo.
pause
goto menu

:menu4
cls
pause
echo.
echo.
echo 	0) Exit to the main menu
echo.
echo.
echo			1) Disk A:
echo			2) Disk B:
echo			3) Disk C:
echo			4) Disk D:
echo			5) Disk E:
echo			6) Disk F:
echo			7) Disk G:
echo			8) Disk H:
echo			9) Disk I:
echo			10) Disk J:
echo			11) Disk K:
echo			12) Disk L:
echo			13) Disk M:
echo			14) Disk N:
echo			15) Disk O:
echo			16) Disk P:
echo			17) Disk Q:
echo			18) Disk R:
echo			19) Disk S:
echo			20) Disk T:
echo			21) Disk U:
echo			22) Disk V:
echo			23) Disk W:
echo			24) Disk X:
echo			25) Disk Y:
echo			26) Disk Z:
echo.
set /p input=%B%     Choice:
if /I %input% equ 0 call :menu && pause
if /I %input% EQU 1 start defrag.exe a: -u -v > A:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start defrag.exe b: -u -v > B:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start defrag.exe c: -u -v > C:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start defrag.exe d: -u -v > D:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start defrag.exe e: -u -v > E:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start defrag.exe f: -u -v > F:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start defrag.exe g: -u -v > G:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start defrag.exe h: -u -v > H:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start defrag.exe i: -u -v > I:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start defrag.exe j: -u -v > J:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 11 start defrag.exe k: -u -v > K:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 12 start defrag.exe l: -u -v > L:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 13 start defrag.exe m: -u -v > M:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 14 start defrag.exe n: -u -v > N:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 15 start defrag.exe o: -u -v > O:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 16 start defrag.exe p: -u -v > P:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 17 start defrag.exe q: -u -v > Q:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 18 start defrag.exe r: -u -v > R:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 19 start defrag.exe s: -u -v > S:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 20 start defrag.exe t: -u -v > T:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 21 start defrag.exe u: -u -v > U:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 22 start defrag.exe v: -u -v > V:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 23 start defrag.exe w: -u -v > W:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 24 start defrag.exe x: -u -v > X:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 25 start defrag.exe y: -u -v > Y:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 26 start defrag.exe z: -u -v > Z:\defraglog.log && echo Disk Defragmentation was succesful! && pause
cls
goto menu
pause

:menu5
cls
echo.
echo.
echo 	Press enter to go back to start
echo.
echo.
echo			1) Disk A:
echo			2) Disk B:
echo			3) Disk C:
echo			4) Disk D:
echo			5) Disk E:
echo			6) Disk F:
echo			7) Disk G:
echo			8) Disk H:
echo			9) Disk I:
echo			10) Disk J:
echo			11) Disk K:
echo			12) Disk L:
echo			13) Disk M:
echo			14) Disk N:
echo			15) Disk O:
echo			16) Disk P:
echo			17) Disk Q:
echo			18) Disk R:
echo			19) Disk S:
echo			20) Disk T:
echo			21) Disk U:
echo			22) Disk V:
echo			23) Disk W:
echo			24) Disk X:
echo			25) Disk Y:
echo			26) Disk Z:
echo.
set /p input=%B%     Choice:
(
if /I %input% EQU 1 start fsutil behavior set DisableDeleteNotify 0 && defrag A: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start fsutil behavior set DisableDeleteNotify 0 && defrag B: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start fsutil behavior set DisableDeleteNotify 0 && defrag C: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start fsutil behavior set DisableDeleteNotify 0 && defrag D: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start fsutil behavior set DisableDeleteNotify 0 && defrag E: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start fsutil behavior set DisableDeleteNotify 0 && defrag F: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start fsutil behavior set DisableDeleteNotify 0 && defrag G: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start fsutil behavior set DisableDeleteNotify 0 && defrag H: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start fsutil behavior set DisableDeleteNotify 0 && defrag I: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start fsutil behavior set DisableDeleteNotify 0 && defrag J: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 11 start fsutil behavior set DisableDeleteNotify 0 && defrag K: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 12 start fsutil behavior set DisableDeleteNotify 0 && defrag L: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 13 start fsutil behavior set DisableDeleteNotify 0 && defrag M: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 14 start fsutil behavior set DisableDeleteNotify 0 && defrag N: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 15 start fsutil behavior set DisableDeleteNotify 0 && defrag O: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 16 start fsutil behavior set DisableDeleteNotify 0 && defrag P: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 17 start fsutil behavior set DisableDeleteNotify 0 && defrag Q: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 18 start fsutil behavior set DisableDeleteNotify 0 && defrag R: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 19 start fsutil behavior set DisableDeleteNotify 0 && defrag S: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 20 start fsutil behavior set DisableDeleteNotify 0 && defrag T: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 21 start fsutil behavior set DisableDeleteNotify 0 && defrag U: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 22 start fsutil behavior set DisableDeleteNotify 0 && defrag V: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 23 start fsutil behavior set DisableDeleteNotify 0 && defrag W: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 24 start fsutil behavior set DisableDeleteNotify 0 && defrag X: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 25 start fsutil behavior set DisableDeleteNotify 0 && defrag Y: /L && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 26 start fsutil behavior set DisableDeleteNotify 0 && defrag Z: /L && echo Disk Defragmentation was succesful! && pause
else exit
)


cls
goto menu
echo.
pause

:background
echo.
echo.
echo.  
echo.                                                                  
echo			 ██     ██ ███████  ██████     ██    ██ ██████  
echo			 ██     ██ ██      ██          ██    ██      ██ 
echo			 ██  █  ██ ███████ ██          ██    ██  █████  
echo			 ██ ███ ██      ██ ██           ██  ██       ██ 
echo			  ███ ███  ███████  ██████       ████   ██████                                 		                                                                   			                                                         
echo.
echo.
pause