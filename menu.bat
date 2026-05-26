@echo off
chcp 65001 >nul
mode con: cols=80 lines=40
pushd "%~dp0"
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
echo     ║       [A]   Optimizacion All in One  -  AULA                        ║
echo     ║       [B]   Optimizacion All in One  -  PC NUEVO                    ║
echo     ║       [C]   Herramientas  -  Bloatware / Servicios                  ║
echo     ║       [D]   Desinstalar Office                                      ║
echo     ╠═════════════════════════════════════════════════════════════════════╣
echo     ║       [0]   Salir                                                   ║
echo     ║       [R]   Restablecer Explorador de Archivos                      ║
echo     ╚═════════════════════════════════════════════════════════════════════╝
echo.
set /p opcion="     Selecciona una opcion [0-9 / A / B / C / D / R]: "

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
if /i "%opcion%"=="A" goto OPCA
if /i "%opcion%"=="B" goto OPCB
if /i "%opcion%"=="C" goto OPCC
if /i "%opcion%"=="D" goto OPCD
if /i "%opcion%"=="R" goto OPCR

echo.
echo     Opcion no valida. Intenta de nuevo.
timeout /t 2 >nul
goto MENU

:: ─────────────────────────────────────────
:OPC1
cls
echo.
echo     [ TECHCODE ]  Asignar contrasena
echo     ──────────────────────────────────────────────────────────────
start "" "asignar contraseña.bat"
goto MENU

:OPC2
cls
echo.
echo     [ TECHCODE ]  Crear usuario con permisos de administrador
echo     ──────────────────────────────────────────────────────────────
start "" "creacion_usuario_permisos_admin.bat"
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
    start "" "deshabilitar windows update.bat"
) else (
    echo     Operacion cancelada.
    timeout /t 2 >nul
)
goto MENU

:OPC4
cls
echo.
echo     [ TECHCODE ]  Eliminar contrasena
echo     ──────────────────────────────────────────────────────────────
start "" "eliminar contraseña.bat"
goto MENU

:OPC5
cls
echo.
echo     [ TECHCODE ]  Eliminar OneDrive
echo     ──────────────────────────────────────────────────────────────
start "" "eliminar onedrive.bat"
goto MENU

:OPC6
cls
echo.
echo     [ TECHCODE ]  Crear punto de restauracion
echo     ──────────────────────────────────────────────────────────────
start "" "punto de restauracion.bat"
goto MENU

:OPC7
cls
echo.
echo     [ TECHCODE ]  Optimizacion del sistema
echo     ──────────────────────────────────────────────────────────────
start "" "scrip optimizacion.bat"
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
     start "" regedit /s "%~dp0Visualizador_de fotos_clasico_W10.reg"
    echo     Registro aplicado correctamente.
    timeout /t 2 >nul
) else (
    echo     Operacion cancelada.
    timeout /t 2 >nul
)
goto MENU

:OPC9
cls
echo.
echo     [ TECHCODE ]  Restaurar Microsoft Store
echo     ──────────────────────────────────────────────────────────────
echo.
start "" "restaurar microsoft store\Add-Store.cmd"
goto MENU

:: ─────────────────────────────────────────
:OPCA
cls
echo.
echo     [ TECHCODE ]  Optimizacion All in One - AULA
echo     ══════════════════════════════════════════════════════════════
echo.
echo     [1/4]  Aplicando visualizador de fotos clasico...
start "" regedit /s "%~dp0Visualizador_de fotos_clasico_W10.reg"
timeout /t 2 >nul
echo     [2/4]  Eliminando OneDrive...
start "" "eliminar onedrive.bat"
timeout /t 4 >nul
echo     [3/4]  Ejecutando optimizacion del sistema...
start "" "scrip optimizacion.bat"
timeout /t 4 >nul
echo     [4/4]  Creando usuario alumno...
start "" "crear usuario alumno.bat"
echo.
echo     ──────────────────────────────────────────────────────────────
echo     All in One AULA completado. Presiona cualquier tecla...
pause >nul
goto MENU

:OPCB
cls
echo.
echo     [ TECHCODE ]  Optimizacion All in One - PC NUEVO
echo     ══════════════════════════════════════════════════════════════
echo.
echo     [1/3]  Aplicando visualizador de fotos clasico...
start "" regedit /s "%~dp0Visualizador_de fotos_clasico_W10.reg"
timeout /t 4 >nul
echo     [2/3]  Eliminando OneDrive...
start "" "eliminar onedrive.bat"
timeout /t 4 >nul
echo     [3/3]  Ejecutando optimizacion del sistema...
start "" "scrip optimizacion.bat"

echo.
echo     ──────────────────────────────────────────────────────────────
echo     All in One PC NUEVO completado. Presiona cualquier tecla...
pause >nul
goto MENU

:: ─────────────────────────────────────────
:OPCC
cls
echo.
echo     [ TECHCODE ]  Herramientas
echo     ══════════════════════════════════════════════════════════════
echo.
echo       [1]   Eliminar Bloatware Windows 10  (10AppsManager)
echo       [2]   Deshabilitar Servicios         (OOSU10 X64)
echo.
echo     ──────────────────────────────────────────────────────────────
echo       [0]   Volver al menu principal
echo     ──────────────────────────────────────────────────────────────
echo.
set /p sub="     Selecciona una herramienta [0-2]: "

if "%sub%"=="1" goto OPCC1
if "%sub%"=="2" goto OPCC3
if "%sub%"=="0" goto MENU

echo.
echo     Opcion no valida.
timeout /t 2 >nul
goto OPCC

:OPCC1
cls
echo.
echo     [ TECHCODE ]  Eliminar Bloatware Windows 10
echo     ──────────────────────────────────────────────────────────────
echo     Iniciando 10AppsManager como Administrador...
start "" /d "%~dp0" "%~dp010AppsManager.exe"
timeout /t 2 >nul
goto OPCC

:OPCC2
cls
echo.
echo     [ TECHCODE ]  Desinstalar Office
echo     ──────────────────────────────────────────────────────────────
echo     Iniciando o15-ctrremove como Administrador...
start "" "o15-ctrremove.diagcab"
timeout /t 2 >nul
goto OPCC

:OPCC3
cls
echo.
echo     [ TECHCODE ]  Deshabilitar Servicios
echo     ──────────────────────────────────────────────────────────────
echo     Iniciando OOSU10 X64 como Administrador...
start "" /d "%~dp0" "%~dp0OOSU10_X64.exe"
timeout /t 2 >nul
goto OPCC

::  ─────────────────────────────────────────
:OPCD
cls
echo.
echo     [ TECHCODE ]  Desinstalar Office
echo     ──────────────────────────────────────────────────────────────
echo     Iniciando o15-ctrremove como Administrador...
start "" "o15-ctrremove.diagcab"
timeout /t 2 >nul
goto MENU

:: ─────────────────────────────────────────
:OPCR
cls
echo.
echo     [ TECHCODE ]  Restablecer Explorador de Archivos
echo     ──────────────────────────────────────────────────────────────
echo.
echo     Cerrando explorer.exe...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 >nul
echo     Reiniciando explorer.exe...
start explorer.exe
echo.
echo     Explorador restablecido correctamente.
timeout /t 2 >nul
goto MENU

:: ─────────────────────────────────────────
:SALIR
cls
echo.
echo     ╔═════════════════════════════════════════════════════════════════════╗
echo     ║        TECHCODE  —  Gracias por tu preferencia  —  Hasta luego     ║
echo     ╚═════════════════════════════════════════════════════════════════════╝
echo.
timeout /t 2 >nul
exit