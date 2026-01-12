@echo off
echo ========================================
echo  Internal Chat Desktop App Setup
echo ========================================
echo.

echo Step 1: Installing dependencies...
call npm install
if errorlevel 1 (
    echo ERROR: Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo Step 2: Building desktop app for Windows...
call npm run build:win
if errorlevel 1 (
    echo ERROR: Failed to build desktop app
    pause
    exit /b 1
)

echo.
echo ========================================
echo  BUILD COMPLETE!
echo ========================================
echo.
echo Your desktop app installer is ready!
echo Location: Frontend\release\
echo.
echo Look for: Internal-Chat-Setup-1.0.0.exe
echo.
pause


