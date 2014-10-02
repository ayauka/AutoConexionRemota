@echo off
:: Conexion remota a los distintos servidores
setlocal

echo Conexion remota
echo ------------------------------------------------------------ 
echo Entorno: [%~dp0]
echo Directorio actual: [%CD%]
echo ------------------------------------------------------------ 
echo Cambiando a directorio origen del script...
cd /d "%~dp0"
cd "ConexionRemota"
echo ------------------------------------------------------------ 

echo Seleccione el servidor a conectar:
echo [1] Servidor Muestra 1 
echo [2] Servidor Muestra 2
echo [3] Servidor Muestra 3

set /p opcion=Opcion Seleccionada: 

goto conexion%opcion%

:conexion1
Conexiones\Conexion_ServidorMuestra1.au3
goto final

:conexion2
Conexiones\Conexion_ServidorMuestra2.au3
goto final

:conexion3
Conexiones\Conexion_ServidorMuestra3.au3
goto final

:final
endlocal


