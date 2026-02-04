@echo off
REM Script para intentar eliminar (hacer vacía) la contraseña del usuario activo.
REM Requiere ejecutar este .bat como Administrador y puede fallar en cuentas Microsoft o con políticas de seguridad.

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
echo ADVERTENCIA: Esto intentara establecer la contrasena de la cuenta actual a vacia (sin contrasena).
echo Esto puede dejar la cuenta menos segura. Si es una cuenta Microsoft o la politica de seguridad lo impide, fallara.
echo.
choice /M "Deseas continuar y establecer la contrasena vacia para %USER%? S=SI, N=NO"
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
    pause
    exit /b 0
)

echo Intentando eliminar la contrasena (establecer vacia)...
REM Intento principal: net user "username" ""
net user "%USER%" "" >nul 2>&1
if %errorlevel% equ 0 (
    echo Exito: la contrasena se ha establecido a vacia para %USER%.
    echo Comprueba que puedes iniciar sesion sin contrasena (puede requerir reiniciar o cerrar sesion).
    pause
    exit /b 0
)

echo Error: no se pudo establecer contraseña vacia para %USER%.
echo Posibles causas:
echo - La cuenta es una cuenta Microsoft asociada a un correo (no se puede quitar asi).
echo - La politica de contrasenas del sistema no permite contrasenas vacias.
echo - La cuenta no tiene privilegios o hay restricciones administrativas.
echo.
echo Sugerencias:
echo - Si es cuenta Microsoft, convierte el equipo a una cuenta local antes de cambiar la contrasena.
echo - Revisa la politica local: "Panel de control > Cuentas de usuario" o "net accounts" y ajustes de seguridad.
echo - Crea un punto de restauracion o respalda datos importantes antes de cambiar cuentas.
echo.
echo Si quieres forzar un cambio de contrasena a un valor concreto en vez de vaciarla, ejecuta:
echo    net user "%USER%" "NuevaContrasenaAqui"
echo (Sustituye "NuevaContrasenaAqui" por la nueva clave.)
pause
exit /b 1
: