:: WinScript 
@echo off
:: Check if the script is running as admin
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    color 4
    echo This script requires administrator privileges.
    echo Please run this script as an administrator.
    pause
    exit
)
:: Admin privileges confirmed, continue execution

:: Get IP address and username
color 3
echo.
echo ====================================
echo    INFORMACION DE RED Y USUARIO
echo ====================================
echo.
echo Nombre de Usuario:
echo %USERNAME%
echo.
echo Direccion IP:
ipconfig | findstr /R "IPv4"
echo.
echo ====================================
echo    Gracias por usar este script, Creado por Luis Hernandez (TechCode, 5620648883, estamos para servirte)
echo ====================================
pause
