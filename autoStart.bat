@echo off
set "src=AutoHotkey\desk-controller.ahk"
set "dest=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\desk-controller.ahk"

echo Moving desk-controller.ahk...
move "%src%" "%dest%"

echo Desk-controller moved to startup folder.
pause
