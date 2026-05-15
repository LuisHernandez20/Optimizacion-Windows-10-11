@echo off
chcp 65001 >nul
title TECHCODE - Menú de Scripts Windows

:MENU
cls
echo.
echo     ╔═════════════════════════════════════════════════════════════════════╗
echo     ║                                                                     ║
echo     ║  ████████╗███████╗ ██████╗██╗  ██╗ ██████╗ ██████╗ ██████╗ ███████╗ ║
echo     ║     ██╔══╝██╔════╝██╔════╝██║  ██║██╔════╝██╔═══██╗██╔══██╗██╔════╝ ║
echo     ║     ██║   █████╗  ██║     ███████║██║     ██║   ██║██║  ██║█████╗   ║
echo     ║     ██║   ██╔══╝  ██║     ██╔══██║██║     ██║   ██║██║  ██║██╔══╝   ║
echo     ║     ██║   ███████╗╚██████╗██║  ██║╚██████╗╚██████╔╝██████╔╝███████╗ ║
echo     ║     ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚═════╝ ╚══════╝  ║
echo     ║                                                                     ║
echo     ║              W I N D O W S   S C R I P T   M G R                    ║
echo     ║                    Creado por Luis Hernandez                        ║
echo     ║                    Contactanos 56-2064-8883                         ║
echo     ╠═════════════════════════════════════════════════════════════════════╣
echo     ║                                                                     ║
echo     ║       [1]   Asignar contrasena                                      ║
echo     ║       [2]   Crear usuario con permisos de administrador             ║
echo     ║       [3]   Deshabilitar Windows Update                             ║
echo     ║       [4]   Eliminar contrasena                                     ║
echo     ║       [5]   Eliminar OneDrive                                       ║
echo     ║       [6]   Crear punto de restauracion                             ║
echo     ║       [7]   Script de optimizacion del sistema                      ║
echo     ║       [8]   Restaurar visualizador de fotos clasico                 ║
echo     ║       [9]   Restaurar Microsoft Store                               ║
echo     ║                                                                     ║
echo     ╠═════════════════════════════════════════════════════════════════════╣
echo     ║       [0]   Salir                                                   ║
echo     ╚═════════════════════════════════════════════════════════════════════╝
echo.
set /p opcion="     Selecciona una opcion [0-8]: "

if "%opcion%"=="1" goto OPC1
if "%opcion%"=="2" goto OPC2
if "%opcion%"=="3" goto OPC3
if "%opcion%"=="4" goto OPC4
if "%opcion%"=="5" goto OPC5
if "%opcion%"=="6" goto OPC6
if "%opcion%"=="7" goto OPC7
if "%opcion%"=="8" goto OPC8
if "%opcion%"=="9" goto OPC9
if "%opcion%"=="0" goto SALIR

echo.
echo     Opcion no valida. Intenta de nuevo.
timeout /t 2 >nul
goto MENU

:OPC1
cls
echo.
echo     [ TECHCODE ]  Asignar contrasena
echo     ──────────────────────────────────────────────────────────────
call "%~dp0asignar contraseña.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC2
cls
echo.
echo     [ TECHCODE ]  Crear usuario con permisos de administrador
echo     ──────────────────────────────────────────────────────────────
call "%~dp0creacion_usuario_permisos_admin.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC3
cls
echo.
echo     [ TECHCODE ]  Deshabilitar Windows Update
echo     ──────────────────────────────────────────────────────────────
echo.
echo     ADVERTENCIA: Se deshabilitaran las actualizaciones de Windows.
echo     Usar solo en entornos controlados.
echo.
set /p confirm="     Confirmar? [S/N]: "
if /i "%confirm%"=="S" (
    call "%~dp0deshabilitar windows update.bat"
    echo.
    echo     Script finalizado.
) else (
    echo     Operacion cancelada.
)
pause >nul
goto MENU

:OPC4
cls
echo.
echo     [ TECHCODE ]  Eliminar contrasena
echo     ──────────────────────────────────────────────────────────────
call "%~dp0eliminar contraseña.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC5
cls
echo.
echo     [ TECHCODE ]  Eliminar OneDrive
echo     ──────────────────────────────────────────────────────────────
call "%~dp0eliminar onedrive.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC6
cls
echo.
echo     [ TECHCODE ]  Crear punto de restauracion
echo     ──────────────────────────────────────────────────────────────
call "%~dp0punto de restauracion.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC7
cls
echo.
echo     [ TECHCODE ]  Optimizacion del sistema
echo     ──────────────────────────────────────────────────────────────
call "%~dp0scrip optimizacion.bat"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:OPC8
cls
echo.
echo     [ TECHCODE ]  Visualizador de fotos clasico
echo     ──────────────────────────────────────────────────────────────
echo.
echo     ADVERTENCIA: Esto modificara el Registro de Windows.
echo     Se recomienda tener un punto de restauracion activo.
echo.
set /p confirm="     Confirmar? [S/N]: "
if /i "%confirm%"=="S" (
    regedit /s "%~dp0Visualizador de fotos clásico en Windows 10.reg"
    echo.
    echo     Registro aplicado correctamente.
) else (
    echo     Operacion cancelada.
)
pause >nul
goto MENU

:OPC9
cls
echo.
echo     [ TECHCODE ]  Restaurar Microsoft Store
echo     ──────────────────────────────────────────────────────────────
echo.
echo     Se ejecutara Add-Store.cmd desde la carpeta restaurar microsoft store.
echo.
call "%~dp0restaurar microsoft store\Add-Store.cmd"
echo.
echo     Script finalizado. Presiona cualquier tecla para volver...
pause >nul
goto MENU

:SALIR
cls
echo.
echo     ╔══════════════════════════════════════════════════════════════════════════════════════════╗
echo     ║              TECHCODE — Gracias por tu preferencia  —  Hasta luego                       ║
echo     ╚══════════════════════════════════════════════════════════════════════════════════════════╝
echo.
timeout /t 2 >nul
exit