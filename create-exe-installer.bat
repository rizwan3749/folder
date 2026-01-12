@echo off
title Create EXE Installer for Internal Chat App
echo.
echo ===============================================
echo    Creating EXE Installer Package
echo ===============================================
echo.

REM Create installer directory
if not exist "exe-installer" mkdir exe-installer
cd exe-installer

echo 📦 Creating EXE installer...

REM Create the main installer script
echo Creating installer script...
echo @echo off > install.bat
echo title Internal Chat App - Installer >> install.bat
echo echo. >> install.bat
echo echo =============================================== >> install.bat
echo echo    Internal Chat App - Installation >> install.bat
echo echo =============================================== >> install.bat
echo echo. >> install.bat
echo echo Installing Internal Chat App... >> install.bat
echo echo. >> install.bat
echo. >> install.bat
echo REM Create installation directory >> install.bat
echo if not exist "%%PROGRAMFILES%%\Internal Chat App" mkdir "%%PROGRAMFILES%%\Internal Chat App" >> install.bat
echo. >> install.bat
echo REM Copy app files >> install.bat
echo copy "Internal Chat App.bat" "%%PROGRAMFILES%%\Internal Chat App\" ^>nul >> install.bat
echo copy "uninstall.bat" "%%PROGRAMFILES%%\Internal Chat App\" ^>nul >> install.bat
echo. >> install.bat
echo REM Create desktop shortcut >> install.bat
echo powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%%USERPROFILE%%\Desktop\Internal Chat App.lnk'); $Shortcut.TargetPath = '%%PROGRAMFILES%%\Internal Chat App\Internal Chat App.bat'; $Shortcut.WorkingDirectory = '%%PROGRAMFILES%%\Internal Chat App'; $Shortcut.Description = 'Internal Chat App'; $Shortcut.Save()" ^>nul >> install.bat
echo. >> install.bat
echo REM Create start menu shortcut >> install.bat
echo if not exist "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Internal Chat App" mkdir "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Internal Chat App" >> install.bat
echo powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Internal Chat App\Internal Chat App.lnk'); $Shortcut.TargetPath = '%%PROGRAMFILES%%\Internal Chat App\Internal Chat App.bat'; $Shortcut.WorkingDirectory = '%%PROGRAMFILES%%\Internal Chat App'; $Shortcut.Description = 'Internal Chat App'; $Shortcut.Save()" ^>nul >> install.bat
echo powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Internal Chat App\Uninstall.lnk'); $Shortcut.TargetPath = '%%PROGRAMFILES%%\Internal Chat App\uninstall.bat'; $Shortcut.WorkingDirectory = '%%PROGRAMFILES%%\Internal Chat App'; $Shortcut.Description = 'Uninstall Internal Chat App'; $Shortcut.Save()" ^>nul >> install.bat
echo. >> install.bat
echo echo ✅ Installation completed successfully! >> install.bat
echo echo. >> install.bat
echo echo Internal Chat App has been installed to: >> install.bat
echo echo %%PROGRAMFILES%%\Internal Chat App >> install.bat
echo echo. >> install.bat
echo echo Desktop shortcut created! >> install.bat
echo echo Start menu shortcut created! >> install.bat
echo echo. >> install.bat
echo echo You can now launch Internal Chat App from: >> install.bat
echo echo - Desktop shortcut >> install.bat
echo echo - Start menu >> install.bat
echo echo. >> install.bat
echo pause >> install.bat

REM Create the main app launcher
echo Creating main app launcher...
echo @echo off > "Internal Chat App.bat"
echo title Internal Chat App >> "Internal Chat App.bat"
echo echo Starting Internal Chat App... >> "Internal Chat App.bat"
echo echo Please wait while the app loads... >> "Internal Chat App.bat"
echo echo. >> "Internal Chat App.bat"
echo start "" "https://internalchat.pizeonfly.com" >> "Internal Chat App.bat"
echo exit >> "Internal Chat App.bat"

REM Create uninstaller
echo Creating uninstaller...
echo @echo off > uninstall.bat
echo title Uninstall Internal Chat App >> uninstall.bat
echo echo. >> uninstall.bat
echo echo =============================================== >> uninstall.bat
echo echo    Uninstalling Internal Chat App >> uninstall.bat
echo echo =============================================== >> uninstall.bat
echo echo. >> uninstall.bat
echo echo Are you sure you want to uninstall Internal Chat App? >> uninstall.bat
echo pause >> uninstall.bat
echo echo. >> uninstall.bat
echo echo Removing Internal Chat App... >> uninstall.bat
echo del "%%USERPROFILE%%\Desktop\Internal Chat App.lnk" 2^>nul >> uninstall.bat
echo rmdir /s /q "%%APPDATA%%\Microsoft\Windows\Start Menu\Programs\Internal Chat App" 2^>nul >> uninstall.bat
echo rmdir /s /q "%%PROGRAMFILES%%\Internal Chat App" 2^>nul >> uninstall.bat
echo echo. >> uninstall.bat
echo echo ✅ Internal Chat App uninstalled successfully! >> uninstall.bat
echo pause >> uninstall.bat

REM Create a simple icon (placeholder)
echo Creating app icon...
copy nul icon.ico >nul 2>&1

echo.
echo ✅ EXE installer package created!
echo.
echo 📂 Package contents:
echo    - install.bat (Main installer)
echo    - Internal Chat App.bat (App launcher)
echo    - uninstall.bat (Uninstaller)
echo    - icon.ico (App icon)
echo.
echo 🚀 To create EXE installer:
echo    1. Use a tool like IExpress (built into Windows)
echo    2. Or use 7-Zip to create self-extracting archive
echo    3. Or use NSIS for professional installer
echo.
echo 📱 For mobile APK:
echo    - Visit: https://internalchat.pizeonfly.com on mobile
echo    - Tap "Add to Home Screen" to install
echo.
echo 🎯 The desktop app will:
echo    - Install to Program Files
echo    - Create desktop shortcut
echo    - Create start menu entry
echo    - Open your Internal Chat website
echo.
pause


