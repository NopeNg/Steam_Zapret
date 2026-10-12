@echo off
taskkill /f /im winws.exe 2>nul
taskkill /f /im winws2.exe 2>nul
echo Zapret stopped.
timeout /t 2 >nul

