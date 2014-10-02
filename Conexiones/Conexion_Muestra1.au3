#include "Funciones.AutoConexionRemota.au3"

Opt("SendKeyDelay", 40) ;5 milliseconds

$servidor = ""
$usuario = ""
$password = ""
$resolucion = ""

AutoConexionRemota($servidor, $usuario, $password, $resolucion)
