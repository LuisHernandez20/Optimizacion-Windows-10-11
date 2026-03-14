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

color 3
cls
echo.
echo ====================================
echo    CREACION DE USUARIO ADMIN
echo ====================================
echo.

:: Ask user for username
set /p username="Ingrese el nombre de la cuenta: "

:: Validate that username is not empty
if "!username!"=="" (
    color 4
    echo Error: Debe ingrese un nombre de usuario.
    pause
    exit /b 1
)

:: Ask user for password
echo.
set /p password="Ingrese la contraseña para la cuenta: "

@REM :: Validate that password is not empty
@REM if "!password!"=="" (
@REM     color 4
@REM     echo Error: Debe ingresar una contraseña.
@REM     pause
@REM     exit /b 1
@REM )

echo.
echo Creando usuario: !username!...
net user !username! !password! /add
if %errorlevel% equ 0 (
    color 2
    echo Usuario creado exitosamente.
) else (
    color 4
    echo Error al crear el usuario.
    echo Es posible que el usuario ya exista.
    pause
    exit /b 1
)

echo.
echo Agregando privilegios de administrador...
net localgroup Administradores !username! /add
if %errorlevel% equ 0 (
    color 2
    echo Privilegios de administrador asignados exitosamente.
) else (
    color 4
    echo Error al asignar privilegios.
    pause
    exit /b 1
)

echo.
echo ====================================
echo    USUARIO CREADO EXITOSAMENTE
echo ====================================
echo Nombre de usuario: !username!
echo.
echo El usuario ha sido creado con privilegios de administrador.
echo Contraseña: !password!
echo Privilegios: Administrador
echo ====================================
echo    Gracias por usar este script, Creado por Luis Hernandez (TechCode, 5620648883, estamos para servirte)
echo ====================================
echo.
pause
