@echo off
color 1F
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
echo ADVERTENCIA: Recuerda que la eliminacion de OneDrive puede afectar la sincronizacion de archivos y datos asociados a tu cuenta en caso de exista una sincronizacion previa.
echo Esto puede generar perdida de datos si no se realiza una copia de seguridad adecuada
echo El uso de este script es bajo tu propia responsabilidad.
echo.
choice /M "Deseas continuar el proceso S=SI, N=NO"
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

echo.
echo ============================================================
echo  Desinstalando OneDrive y restaurando carpetas por defecto
echo ============================================================
echo.
taskkill /f /im OneDrive.exe
if exist "%SystemRoot%\System32\OneDriveSetup.exe" (
    echo -- Uninstalling OneDrive through the installers
    "%SystemRoot%\System32\OneDriveSetup.exe" /uninstall
)
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    "%SystemRoot%\SysWOW64\OneDriveSetup.exe" /uninstall
)
echo.
echo ============================================================
echo copiando archivos de onedrive a carpeta usuario
echo ============================================================
echo.
robocopy "%USERPROFILE%\OneDrive" "%USERPROFILE%" /mov /e /xj /ndl /nfl /njh /njs /nc /ns /np
echo.
echo ============================================================
echo Removiendo OneDrive del explorador de archivos
echo ============================================================
echo.
reg delete "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f
echo.
echo ============================================================
echo Removiendo acceso directo de OneDrive del menu inicio
echo ============================================================
echo.
del "%appdata%\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
echo.
echo ============================================================
echo Removiendo tareas programadas de OneDrive
echo ============================================================
echo.
powershell -Command "Get-ScheduledTask -TaskPath '\' -TaskName 'OneDrive*' -ErrorAction SilentlyContinue | Unregister-ScheduledTask -Confirm:$false"
echo.
echo ============================================================
echo Removiendo carpetas de registro de OneDrive
echo ============================================================
echo.
rd "%UserProfile%\OneDrive" /Q /S
rd "%LocalAppData%\OneDrive" /Q /S
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S
rd "%ProgramData%\Microsoft OneDrive" /Q /S
rd "C:\OneDriveTemp" /Q /S
reg delete "HKEY_CURRENT_USER\Software\Microsoft\OneDrive" /f
echo.
echo ============================================================
echo restaurando carpetas por defecto
echo ============================================================
echo.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cache" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Cookies" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCookies" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Favorites" /t REG_EXPAND_SZ /d "%USERPROFILE%\Favorites" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "History" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local\Microsoft\Windows\History" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Local AppData" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Local" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%USERPROFILE%\Music" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%USERPROFILE%\Videos" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "NetHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Network Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "PrintHood" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Printer Shortcuts" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Programs" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Recent" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "SendTo" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\SendTo" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Start Menu" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Startup" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Templates" /t REG_EXPAND_SZ /d "%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Templates" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{374DE290-123F-4565-9164-39C4925E467B}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Downloads" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%USERPROFILE%\Desktop" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{F42EE2D3-909F-4907-8871-4C22FC0BF756}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "{0DDD015D-B06C-45D5-8C4C-F59713854639}" /t REG_EXPAND_SZ /d "%USERPROFILE%\Pictures" /f
echo.

echo ============================================================
echo Proceso completado. Es recomendable reiniciar el equipo para aplicar todos los cambios.
echo ============================================================
pause
endlocal
taskkill /f /im explorer.exe & start explorer.exe

