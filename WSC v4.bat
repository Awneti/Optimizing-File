@echo off
chcp 65001 >nul
title Windows System Chekcer v4 - by AW
color f5

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges. Restarting as admin...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

:menu
cls
call :banner
echo.
echo.
echo=========================================================================================================================
echo							Main menu
echo=========================================================================================================================
echo			 1. Check Disk Health
echo			 2. System Cleanup
echo			 3. Performance Boost
echo			 4. PC Health Check
echo			 5. Create a restore point (MANDATORY AND MANUAL, WILL OPEN YOUTUBE) 
echo			 6. View your crash history
echo			 7. System File Check
echo			 8. DISM Restore Health (in case of faulty windows update)
echo=========================================================================================================================
echo.
set /p input=Select an option:
if %input%==1 goto chkdsk
if %input%==2 goto cleanup
if %input%==3 goto performance
if %input%==4 goto :smenu
if /I %input%==5 start https://www.youtube.com/watch?v=vKH0QeV0coM
if /I %input%==6 perfmon /rel
if /I %input%==7 start sfc /SCANNOW 
if /I %input%==8 start DISM /Online /Cleanup-Image /RestoreHealth
goto menu

:chkdsk
cls
echo Running CHKDSK on C: drive...
chkdsk C: /F /R /X
pause
goto menu

:cleanup
cls
echo Cleaning temporary files...
del /s /f /q "%temp%\*.*" >nul 2>&1
rd /s /q "%temp%" >nul 2>&1
md "%temp%" >nul 2>&1
echo Temp files cleared.
cleanmgr
echo Disk Cleanup opened.
pause
goto menu

:performance
cls
call :banner
echo.
echo.
echo=========================================================================================================================
echo						   Performance Boost menu
echo=========================================================================================================================
echo			 1. Disable Startup Programs
echo			 2. Flush DNS
echo			 3. Optimize Drives
echo			 4. Return to Main Menu
echo=========================================================================================================================
echo.
set /p perfInput=Select an option: 
if %perfInput%==1 goto disable_startup
if %perfInput%==2 goto flush_dns
if %perfInput%==3 goto optimize_drives
if %perfInput%==4 goto menu
goto performance

:smenu
cls
call :banner
echo.
echo.
echo=========================================================================================================================
echo							PC Health Check menu        
echo=========================================================================================================================
echo			 1. Check CPU Usage
echo			 2. Check RAM Usage
echo			 3. Go to main menu
echo=========================================================================================================================
echo.
set /p input=Select an option: 
if /I %input% EQU 1 goto cpu
if /I %input% EQU 2 goto ram
if /I %input% EQU 3 goto menu
pause

:cpu
wmic cpu get /format:list
timeout /t 30 >nul
goto smenu

:ram
for /f "tokens=2 delims==" %%A in ('wmic OS get FreePhysicalMemory /Value') do set FreeMemoryKB=%%A
for /f "tokens=2 delims==" %%A in ('wmic OS get TotalVisibleMemorySize /Value') do set TotalMemoryKB=%%A

set /a FreeMemoryMB=%FreeMemoryKB% / 1024
set /a TotalMemoryMB=%TotalMemoryKB% / 1024
set /a UsedMemoryMB=%TotalMemoryMB% - %FreeMemoryMB%

echo Free Memory: %FreeMemoryMB% MB
echo Total Memory: %TotalMemoryMB% MB
echo Used Memory: %UsedMemoryMB% MB

timeout /t 5 >nul
goto smenu

:disable_startup
cls
echo Disabling unnecessary startup programs...
powershell -Command "Get-CimInstance Win32_StartupCommand | ForEach-Object { If ($_.Location -notmatch 'Microsoft') { $_.Disable() } }"
echo Startup programs disabled.
pause
goto performance

:flush_dns
cls
echo Flushing DNS...
ipconfig /flushdns
echo DNS cache cleared.
pause
goto performance

:optimize_drives
cls
echo Optimizing drives...
defrag C: /O
echo Drives optimized.
pause
goto performance

:banner
echo				888       888  .d8888b.   .d8888b.                    d8888  
echo				888   o   888 d88P  Y88b d88P  Y88b                  d8P888  
echo				888  d8b  888 Y88b.      888    888                 d8P 888  
echo				888 d888b 888  "Y888b.   888             888  888  d8P  888  
echo				888d88888b888     "Y88b. 888             888  888 d88   888  
echo				88888P Y88888       "888 888    888      Y88  88P 8888888888 
echo				8888P   Y8888 Y88b  d88P Y88b  d88P       Y8bd8P        888  
echo				888P     Y888  "Y8888P"   "Y8888P"         Y88P         888  