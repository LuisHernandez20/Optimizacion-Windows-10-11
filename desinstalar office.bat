@echo off
color 60
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
echo ADVERTENCIA: Recuerda que el uso de este script tiene como objetivo desinstalar office en su totalidad para realizar una nueva instalacion limpia.
echo Asegurate de tener una copia de seguridad de tus datos importantes antes de proceder.
echo El uso de este script es bajo tu propia responsabilidad.

echo.
choice /M "Deseas continuar el proceso S=SI, N=NO"
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

echo ============================================================
echo Desinstalando Microsoft office...
echo ============================================================
echo.
:: Detener procesos relacionados con Office
taskkill /f /im winword.exe >nul 2>&1
taskkill /f /im excel.exe >nul 2>&1
taskkill /f /im outlook.exe >nul 2>&1
taskkill /f /im powerpnt.exe >nul 2>&1
taskkill /f /im onenote.exe >nul 2>&1
taskkill /f /im mspub.exe >nul 2>&1
taskkill /f /im lync.exe >nul 2>&1
taskkill /f /im teams.exe >nul 2>&1
echo.
:: Desinstalar Office usando el desinstalador oficial
cd /d "%ProgramFiles%\Common Files\Microsoft Shared\ClickToRun" || cd /d "%ProgramFiles(x86)%\Common Files\Microsoft Shared\ClickToRun"
if exist "OfficeC2RClient.exe" (
    echo Iniciando desinstalacion de Office...
    OfficeC2RClient.exe /uninstallpromptuser /updatepromptuser /uninstall
    echo Esperando a que finalice la desinstalacion...
    timeout /t 300 /nobreak >nul
) else (
    echo No se encontro el desinstalador de Office. Asegurate de que Office este instalado.
    pause
    exit /b 1
)
echo ============================================================
echo Limpiando restos de Office...
echo ============================================================


:: Eliminar carpetas residuales
rmdir /s /q "%ProgramFiles%\Microsoft Office" >nul 2>&1
rmdir /s /q "%ProgramFiles(x86)%\Microsoft Office" >nul 2>&1
rmdir /s /q "%ProgramFiles%\Common Files\Microsoft Shared\Office16" >nul 2>&1
rmdir /s /q "%ProgramFiles(x86)%\Common Files\Microsoft Shared\Office16" >nul 2>&1
rmdir /s /q "%ProgramFiles%\Common Files\Microsoft Shared\Office15" >nul 2>&1
rmdir /s /q "%ProgramFiles(x86)%\Common Files\Microsoft Shared\Office15" >nul 2>&1
rmdir /s /q "%ProgramFiles%\Common Files\Microsoft Shared\Office14" >nul 2>&1
rmdir /s /q "%ProgramFiles(x86)%\Common Files\Microsoft Shared\Office14" >nul 2>&1
rmdir /s /q "%AppData%\Microsoft\Office" >nul 2>&1
rmdir /s /q "%LocalAppData%\Microsoft\Office" >nul 2>&1
rmdir /s /q "%ProgramData%\Microsoft\Office" >nul 2>&1
rmdir /s /q "%ProgramData%\Microsoft\OfficeSoftwareProtectionPlatform" >nul 2>&1
rmdir /s /q "%UserProfile%\Documents\Custom Office Templates" >nul 2>&1
:: Eliminar entradas de registro relacionadas con Office
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0" /f >nul 2>&1
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\16.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\15.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Office\14.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\16.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\15.0" /f >nul 2>&1
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Office\14.0" /f >nul 2>&1

echo ============================================================
echo Proceso completado. Es recomendable reiniciar el equipo para aplicar todos los cambios.
echo ============================================================
pause
endlocal
taskkill /f /im explorer.exe & start explorer.exe

