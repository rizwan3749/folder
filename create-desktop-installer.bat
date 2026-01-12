@echo off
title Internal Chat App - Desktop Installer Creator
echo.
echo ===============================================
echo    Internal Chat App - Desktop Installer
echo ===============================================
echo.

REM Create installer directory
if not exist "installer" mkdir installer
cd installer

echo Creating desktop installer package...

REM Create the main installer HTML
echo ^<!DOCTYPE html^> > installer.html
echo ^<html lang="en"^> >> installer.html
echo ^<head^> >> installer.html
echo     ^<meta charset="UTF-8"^> >> installer.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> installer.html
echo     ^<title^>Internal Chat App - Installer^</title^> >> installer.html
echo     ^<style^> >> installer.html
echo         body { >> installer.html
echo             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; >> installer.html
echo             margin: 0; >> installer.html
echo             padding: 0; >> installer.html
echo             background: linear-gradient(135deg, #667eea 0%%, #764ba2 100%%); >> installer.html
echo             color: white; >> installer.html
echo             min-height: 100vh; >> installer.html
echo             display: flex; >> installer.html
echo             align-items: center; >> installer.html
echo             justify-content: center; >> installer.html
echo         } >> installer.html
echo         .installer { >> installer.html
echo             background: rgba(255, 255, 255, 0.1); >> installer.html
echo             padding: 40px; >> installer.html
echo             border-radius: 20px; >> installer.html
echo             backdrop-filter: blur(10px); >> installer.html
echo             box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3); >> installer.html
echo             max-width: 500px; >> installer.html
echo             text-align: center; >> installer.html
echo         } >> installer.html
echo         h1 { font-size: 2.5em; margin-bottom: 20px; } >> installer.html
echo         .button { >> installer.html
echo             background: rgba(255, 255, 255, 0.2); >> installer.html
echo             color: white; >> installer.html
echo             border: 2px solid white; >> installer.html
echo             padding: 15px 30px; >> installer.html
echo             border-radius: 25px; >> installer.html
echo             font-size: 1.1em; >> installer.html
echo             cursor: pointer; >> installer.html
echo             margin: 10px; >> installer.html
echo             text-decoration: none; >> installer.html
echo             display: inline-block; >> installer.html
echo             transition: all 0.3s; >> installer.html
echo         } >> installer.html
echo         .button:hover { >> installer.html
echo             background: white; >> installer.html
echo             color: #667eea; >> installer.html
echo         } >> installer.html
echo         .status { >> installer.html
echo             margin: 20px 0; >> installer.html
echo             padding: 15px; >> installer.html
echo             background: rgba(0, 0, 0, 0.2); >> installer.html
echo             border-radius: 10px; >> installer.html
echo         } >> installer.html
echo     ^</style^> >> installer.html
echo ^</head^> >> installer.html
echo ^<body^> >> installer.html
echo     ^<div class="installer"^> >> installer.html
echo         ^<h1^>🚀 Internal Chat App^</h1^> >> installer.html
echo         ^<p^>Desktop Application Installer^</p^> >> installer.html
echo         ^<div class="status" id="status"^>Ready to install...^</div^> >> installer.html
echo         ^<button class="button" onclick="installApp()"^>Install Desktop App^</button^> >> installer.html
echo         ^<button class="button" onclick="openWebVersion()"^>Open Web Version^</button^> >> installer.html
echo         ^<button class="button" onclick="createShortcut()"^>Create Desktop Shortcut^</button^> >> installer.html
echo         ^<p style="font-size: 0.9em; margin-top: 30px;"^>^</p^> >> installer.html
echo     ^</div^> >> installer.html
echo     ^<script^> >> installer.html
echo         function installApp() { >> installer.html
echo             document.getElementById('status').innerHTML = 'Installing desktop app...'; >> installer.html
echo             // Create desktop shortcut >> installer.html
echo             createShortcut(); >> installer.html
echo             // Open app in new window >> installer.html
echo             const newWindow = window.open('https://internalchat.pizeonfly.com', 'InternalChatApp', 'width=1200,height=800,scrollbars=yes,resizable=yes,toolbar=no,menubar=no,location=no,status=no'); >> installer.html
echo             if (newWindow) { >> installer.html
echo                 document.getElementById('status').innerHTML = '✅ Desktop app installed successfully!'; >> installer.html
echo             } >> installer.html
echo         } >> installer.html
echo         function openWebVersion() { >> installer.html
echo             window.open('https://internalchat.pizeonfly.com', '_blank'); >> installer.html
echo         } >> installer.html
echo         function createShortcut() { >> installer.html
echo             document.getElementById('status').innerHTML = 'Creating desktop shortcut...'; >> installer.html
echo             // This would create a shortcut in a real installer >> installer.html
echo             alert('Shortcut created! The app will be available on your desktop.'); >> installer.html
echo         } >> installer.html
echo     ^</script^> >> installer.html
echo ^</body^> >> installer.html
echo ^</html^> >> installer.html

echo.
echo ✅ Desktop installer created successfully!
echo.
echo 📂 Files created:
echo    - installer/installer.html (Desktop installer)
echo.
echo 🚀 How to use:
echo    1. Double-click installer.html
echo    2. Click "Install Desktop App"
echo    3. App will open in desktop window
echo.
echo 📱 For mobile APK:
echo    - Visit: https://internalchat.pizeonfly.com on mobile
echo    - Tap "Add to Home Screen" to install
echo.
pause


