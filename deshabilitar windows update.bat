@echo off
color 0A
REM Script para intentar eliminar (hacer vac�a) la contrase�a del usuario activo.
REM Requiere ejecutar este .bat como Administrador y puede fallar en cuentas Microsoft o con pol�ticas de seguridad.

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
echo ADVERTENCIA: Recuerda que la deshabilitacion de windows uipdate puede afectar la seguridad y estabilidad del sistema operativo, al no recibir actualizaciones criticas y parches de seguridad.
echo Esto puede generar vulnerabilidades y problemas de rendimiento si no se realiza un mantenimiento adecuado.
echo El uso de este script se realiza con el fin de mejorar el rendimiento del sistema y reducir interrupciones causadas por actualizaciones automáticas.
echo El uso de este script es bajo tu propia responsabilidad.

echo.
choice /M "Deseas continuar el proceso S=SI, N=NO"
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

echo ============================================================
echo Deshabilitando Telemetria de Windows Update
echo ============================================================
echo.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t "REG_DWORD" /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t "REG_DWORD" /d 0 /f
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop wuauserv
sc config wuauserv start= disabled 
sc stop UsoSvc
sc config UsoSvc start= disabled
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disable
@REM schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable


echo ============================================================
echo Proceso completado. Es recomendable reiniciar el equipo para aplicar todos los cambios.
echo ============================================================
pause
endlocal
taskkill /f /im explorer.exe & start explorer.exe

