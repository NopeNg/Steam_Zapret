@echo off
cd /d "%~dp0"

:: Check administrator privileges; elevate if needed via elevator.exe
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    "%~dp0elevator" "%~f0"
    exit /b
)

title Zapret winws - Steam DPI Bypass
echo ==============================================================
echo              ZAPRET WINWS - STEAM DPI BYPASS
echo ==============================================================
echo  - Filtered Ports : TCP 80, 443 (Steam Web, Community, Chat)
echo  - Game Traffic   : Untouched UDP (No ping/latency impact)
echo  - Target Hosts   : files\list-steam.txt
echo ==============================================================
echo.
echo [INFO] Running winws... Keep this window open while playing/using Steam.
echo [INFO] Close this window or press Ctrl+C to stop.
echo.

"%~dp0winws.exe" ^
--wf-tcp=80,443 ^
--filter-tcp=80,443 --hostlist="%~dp0files\list-steam.txt" --dpi-desync=fake,split2 --dpi-desync-fooling=badsum --dpi-desync-autottl=2

pause

