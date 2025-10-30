@echo off
REM Quick Conversation Saver - Double-click to run
REM This batch file makes it easy to save your Cursor conversations

echo.
echo ===============================================
echo   CURSOR CONVERSATION SAVER
echo ===============================================
echo.

set /p project="Enter Project Name (or press Enter for 'General'): "
if "%project%"=="" set project=General

set /p topic="Enter Topic/Description: "
if "%topic%"=="" set topic=Conversation

set /p tags="Enter Tags (optional, e.g., #bugfix #python): "

echo.
echo Creating conversation file...
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0save_conversation.ps1" -ProjectName "%project%" -Topic "%topic%" -Tags "%tags%"

echo.
echo Done! Now paste your conversation into the opened file.
echo.
pause

