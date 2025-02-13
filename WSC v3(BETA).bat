:: THIS IS EXPERIMENTAL, READ ITS DESCRIPTION BEFORE USING IT
@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
color f5
title Windows System Checker v3(experimental) - by AW

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
echo	1) System File Check
echo	2) Disk Defragmentation
echo	3) Disk Info ("MediaType" will be Hard Drive Disk(HDD) or Solid State Drive(SSD).Also pay attention to "Drive" letter)
echo	4) Flush DNS Cache
echo	5) Manually disable unnecessary start-up programms
echo	6) Reset your network settings (not recommended)
echo	7) Check all temporary files and/or manually delete them
echo	8) DISM Restore Health (in case of faulty windows update)
echo	9) Create a restore point (MANDATORY AND MANUAL, WILL OPEN YOUTUBE)
echo	10) Scan for miners (BETA, ONLY WORKS WITH STOCK MICROSOFR ANTIVIRUS "WinDefender", SHOULD RESTART YOUR PC)
echo	11) View your crash history
echo.
echo	---------------------------------------------------------
echo.
echo	0) Explanation for the commands
echo.
set /p input=%B%     Choice:
(
if /I %input% EQU 0 call :menu3 && pause
if /I %input% EQU 1 start sfc /SCANNOW && echo %errorlevel% [MISTAKES FOUND & FIXED] && echo System File Check was succesful! && pause
if /I %input% EQU 2 call :menu1
if /I %input% EQU 3 (
	start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools"
	start dfrgui.exe
	)
if /I %input% EQU 4 start ipconfig /flushdns
if /I %input% EQU 5 start msconfig
if /I %input% EQU 6 start netsh
if /I %input% EQU 7 start Temp && pause
if /I %input% equ 8 start DISM /Online /Cleanup-Image /RestoreHealth
if /I %input% EQU 9 start https://www.youtube.com/watch?v=vKH0QeV0coM
if /I %input% EQU 10 (
powershell -Command "Get-Service -Name WinDefender"
powershell -Command "Start-Service -Name WinDefender"
powershell -Command "Start-MpScan -ScanType FullScan"
pause
)
if /I %input% equ 11 (
 perfmon /rel
 else exit
 )
else goto menu && echo SELECT A NUMBER 1-10 BASED ON YOUR DESIRE 
)
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
echo			-----------------------------------------------------------------------
echo.
echo			Note: run disk info option before using this option, for it may make
echo			your pc slower if you dont get the right MediaType and drive letter.
set /p input=%B%     Choice: 
(
	if /I %input% EQU 1 call :menu4 
	if /I %input% EQU 2 call :menu5
	else goto menu 
)
pause

cls
goto menu
echo.
pause

:menu2
cls
echo.
echo.
echo	Press enter to go back to start
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
echo.
pause
goto menu
:menu3
cls
echo.
echo.
echo			ALL OPTIONS OPEN YOUTUBE! Press enter to go back to start
echo.
echo.
echo			1) sfc explained
echo			2) Disk Defrag explained
echo			3) Disk check [chkdsk] explained
echo			4) Flush DNS Cache explained
echo			5) Msconfig explained
echo			6) Netsh (network reset) explained
echo			7) Temp files explained
echo			8) DISM /Online /RestoreHealth explained
echo.
set /p input=%B%     Choice:
(
if /I %input% EQU 1 start https://www.youtube.com/watch?v=0ORXhaEOgxw
if /I %input% EQU 2 start https://www.youtube.com/watch?v=AtRIOUZuI2c
if /I %input% EQU 3 start https://www.youtube.com/watch?v=b41yobfBt4E
if /I %input% EQU 4 start https://www.youtube.com/watch?v=ZKhorleA5aA
if /I %input% EQU 5 start https://www.youtube.com/watch?v=XOlW4fGZzkI&t=23s
if /I %input% EQU 6 start https://www.youtube.com/watch?v=Ktc6Q_yhwJA
if /I %input% EQU 7 start https://www.youtube.com/watch?v=i4gH9zPCyS8
if /I %input% EQU 8 start https://www.youtube.com/watch?v=3ka-FIiZK2k
else goto menu
)
cls
goto menu
echo.

:menu4
cls
pause
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
if /I %input% EQU 1 start defrag.exe a: -f -v > A:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 2 start defrag.exe b: -f -v > B:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 3 start defrag.exe c: -f -v > C:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 4 start defrag.exe d: -f -v > D:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 5 start defrag.exe e: -f -v > E:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 6 start defrag.exe f: -f -v > F:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 7 start defrag.exe g: -f -v > G:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 8 start defrag.exe h: -f -v > H:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 9 start defrag.exe i: -f -v > I:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 10 start defrag.exe j: -f -v > J:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 11 start defrag.exe k: -f -v > K:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 12 start defrag.exe l: -f -v > L:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 13 start defrag.exe m: -f -v > M:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 14 start defrag.exe n: -f -v > N:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 15 start defrag.exe o: -f -v > O:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 16 start defrag.exe p: -f -v > P:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 17 start defrag.exe q: -f -v > Q:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 18 start defrag.exe r: -f -v > R:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 19 start defrag.exe s: -f -v > S:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 20 start defrag.exe t: -f -v > T:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 21 start defrag.exe u: -f -v > U:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 22 start defrag.exe v: -f -v > V:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 23 start defrag.exe w: -f -v > W:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 24 start defrag.exe x: -f -v > X:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 25 start defrag.exe y: -f -v > Y:\defraglog.log && echo Disk Defragmentation was succesful! && pause
if /I %input% EQU 26 start defrag.exe z: -f -v > Z:\defraglog.log && echo Disk Defragmentation was succesful! && pause
else exit
)
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
echo					┓ ┏┏┓┏┓    ┏┓
echo					┃┃┃┗┓┃   ┓┏ ┫
echo					┗┻┛┗┛┗┛  ┗┛┗┛                               		                                                                   			                                                         
echo.
echo.
pause
