:: WinScript 
@echo off
:: Check if the script is running as admin
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    color 4
    echo This script requires administrator privileges.
    echo Please run WinScript as an administrator.
    pause
    exit
)
:: Admin privileges confirmed, continue execution
:: Get system serial number
color 3
echo.
echo ====================================
echo    NUMERO DE SERIE DEL SISTEMA
echo ====================================
echo.
powershell -Command "Get-CimInstance Win32_BIOS | Select-Object SerialNumber"
echo.
echo ====================================
echo    Creado por Luis Hernandez, Informatica, REGION II CADEREYTA
echo ====================================
pause