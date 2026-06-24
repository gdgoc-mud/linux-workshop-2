@echo off
echo ================================
echo  SSH Workshop Setup
echo ================================
echo.

echo [1/3] Installing cloudflared...
winget install Cloudflare.cloudflared -e --silent
if %errorlevel% neq 0 (
    echo [!] winget failed. Download manually from:
    echo     https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-windows-amd64.msi
    pause
    exit /b 1
)

echo [2/3] Creating SSH config...
if not exist "%USERPROFILE%\.ssh" mkdir "%USERPROFILE%\.ssh"

echo Host *.trycloudflare.com> "%USERPROFILE%\.ssh\config"
echo     ProxyCommand cloudflared access ssh --hostname %%h>> "%USERPROFILE%\.ssh\config"

echo [3/3] Done.
echo.
echo ================================
echo  To connect, open a NEW terminal
echo  and run:
echo.
echo  ssh ubuntu@your-url.trycloudflare.com
echo.
echo  Password: tomato
echo ================================
pause
