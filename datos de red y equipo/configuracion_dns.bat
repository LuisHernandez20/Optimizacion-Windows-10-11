:: WinScript 
@echo off
setlocal enabledelayedexpansion
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

:menu
color 3
cls
echo.
echo ====================================
echo    CONFIGURACION DE DNS
echo ====================================
echo.
echo Seleccione una opcion:
echo.
echo 1. Google DNS (8.8.8.8 / 8.8.4.4)
echo 2. Cloudflare DNS (1.1.1.1 / 1.0.0.1)
echo 3. Nuevos_usebeq (192.168.230.37 / 192.168.230.38)
echo 4. Anteriores_usebeq (10.122.4.169 / 192.168.230.38)
echo 5. Ingresar DNS personalizados
echo 6. Ver DNS actual
echo 7. Salir
echo.
set /p opcion="Ingrese su opcion (1-7): "

if "%opcion%"=="1" goto google_dns
if "%opcion%"=="2" goto cloudflare_dns
if "%opcion%"=="3" goto nuevos_usebeq
if "%opcion%"=="4" goto anteriores_usebeq
if "%opcion%"=="5" goto custom_dns
if "%opcion%"=="6" goto show_dns
if "%opcion%"=="7" goto fin
goto menu

:google_dns
set "dns_primario=8.8.8.8"
set "dns_alternativo=8.8.4.4"
set "nombre_dns=Google"
goto aplicar_dns

:cloudflare_dns
set "dns_primario=1.1.1.1"
set "dns_alternativo=1.0.0.1"
set "nombre_dns=Cloudflare"
goto aplicar_dns

:nuevos_usebeq
set "dns_primario=192.168.230.37"
set "dns_alternativo=192.168.230.38"
set "nombre_dns=nuevos_usebeq"
goto aplicar_dns

:anteriores_usebeq
set "dns_primario=10.122.4.169"
set "dns_alternativo=192.168.230.38"
set "nombre_dns=anteriores_usebeq"
goto aplicar_dns

:custom_dns
echo.
set /p dns_primario="Ingrese DNS primario: "
set /p dns_alternativo="Ingrese DNS alternativo: "
set "nombre_dns=Personalizado"
goto aplicar_dns

:aplicar_dns
cls
echo.
echo ====================================
echo    APLICANDO CONFIGURACION DNS
echo ====================================
echo.
echo Configuracion: %nombre_dns%
echo DNS Primario: %dns_primario%
echo DNS Alternativo: %dns_alternativo%
echo.

:: Get network interface name
for /f "tokens=* delims=" %%a in ('powershell -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Select-Object -ExpandProperty Name | Select-Object -First 1"') do (
    set "interfaz=%%a"
)

if "%interfaz%"=="" (
    echo No se encontro interfaz de red activa.
    pause
    goto menu
)

echo Configurando interfaz: %interfaz%
echo.

:: Set DNS
netsh interface ip set dns name="%interfaz%" static %dns_primario% primary
netsh interface ip add dns name="%interfaz%" %dns_alternativo% index=2

echo.
echo DNS configurado exitosamente.
echo.
pause
goto menu

:show_dns
cls
echo.
echo ====================================
echo    DNS ACTUAL
echo ====================================
echo.
ipconfig /all | findstr /R "DNS"
echo.
pause
goto menu

:fin
echo.
echo ====================================
echo    Gracias por usar este script, Creado por Luis Hernandez (TechCode, 5620648883, estamos para servirte)
echo ====================================
pause
exit /b 0
