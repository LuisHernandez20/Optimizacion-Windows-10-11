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


echo Introduce la nueva contraseña
set /p nueva=Contraseña:
net user %USERNAME% %nueva%
if %errorlevel% equ 0 (
  echo Contraseña cambiada correctamente.
) else (
  echo Error al cambiar la contraseña.
)


:: echo Introduce la nueva contraseña (entrada enmascarada)...
:: powershell -NoProfile -Command ^
::   "$u = $env:USERNAME; ^
::    $s = Read-Host 'Nueva contraseña' -AsSecureString; ^
::    $b = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($s); ^
::    $plain = [Runtime.InteropServices.Marshal]::PtrToStringAuto($b); ^
::    try { net user $u $plain } finally { [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($b) }"
:: if %errorlevel% equ 0 (
::   echo Contraseña cambiada correctamente.
:: ) else (
::   echo Error al cambiar la contraseña.
:: )