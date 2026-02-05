@echo off
color 3F
REM Script para crear un punto de restauración del sistema.
REM Requiere ejecutar este .bat como Administrador.

:: Comprobar privilegios de administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Este script debe ejecutarse como Administrador.
    echo Haz clic derecho sobre el archivo y selecciona "Ejecutar como administrador".
    pause
    exit /b 1
)

set "USER=%USERNAME%"
echo Usuario activo detectado: %USER%
echo.
echo El uso de este script es para realizar un punto de restauracion y asegurar la integridad de tus archivos.

echo.
choice /M "Deseas continuar el proceso S=SI, N=NO"
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

:: Obtener la fecha actual
set "FECHA=%DATE%"

echo ============================================================
echo Creando Punto de Restauración del Sistema...
echo ============================================================
echo.
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Punto de Restauración TECHCODE - %FECHA%", 100, 7
if %errorlevel% equ 0 (
    echo Punto de restauración creado exitosamente.
) else (
    echo Error al crear el punto de restauración.
)

echo Proceso completado exitosamente, gracias por la espera.
pause


