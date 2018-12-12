#pragma compile(ExecLevel, requireAdministrator)
#RequireAdmin
#include <MsgBoxConstants.au3>

Opt("SendKeyDelay", 40) ;5 milliseconds

func AutoConexionRemota($equipo, $usuario, $password, $resolucion)
    if @OSVersion = "WIN_10" and @OSBuild >= 14393 then
        ;;MsgBox($IDOK, "Windows 10", "")
        AutoConexionRemotaWin10($equipo, $usuario, $password, $resolucion)
    else
        ;;MsgBox($IDOK, "Windows", "")
        AutoConexionRemotaWin($equipo, $usuario, $password, $resolucion)
    endif
endfunc

func AutoConexionRemotaWin($equipo, $usuario, $password, $resolucion)
    $tituloDeVentana = "(Conexión a Escritorio remoto)|(Remote Desktop Connection)"
    $claseDeVentana = "#32770"
    $tituloDeVentanaSeguridad = "(Seguridad de Windows)|(Windows Security)"
    $claseDeVentanaSeguridad = $claseDeVentana

    $ventanaPrincipal = "[REGEXPTITLE:" & $tituloDeVentana & ";CLASS:" & $claseDeVentana & "]"
    $ventanaSeguridad = "[REGEXPTITLE:" & $tituloDeVentanaSeguridad & ";CLASS:" & $claseDeVentanaSeguridad & "]"

    $controlEquipo = "[CLASS:Edit; INSTANCE:1]"
    $teclasParaMostrarOpciones = "!o"
    $rutaDelPrograma = ENVGET("windir") & "\system32\mstsc.exe"
    $teclasParaBorrarContenido = "{DEL 50}"
    $teclasParaMoverseHastaTabs = "{TAB 8}"
    $teclasParaMoverseAlUsuario = "{TAB}"
    $teclasParaMoverseAPantalla = "{RIGHT}"
    $teclasParaMoverseAResolucion = "{TAB}"
    $teclasParaLaMayorResolucion = "{RIGHT 12}"
    $teclasParaConectarES = "!c"
	$teclasParaConectarEN = "!n"
    $teclasParaValidarConexion = "{ENTER}"

    ShellExecute($rutaDelPrograma)

    WinWaitActive($ventanaPrincipal, "", 120)
    Sleep(500)
    WinActivate($ventanaPrincipal)

    Send($teclasParaMostrarOpciones)

    Sleep(500)

    Send($teclasParaBorrarContenido)

    Send($equipo)

    Send($teclasParaMoverseAlUsuario)

    Send($teclasParaBorrarContenido)

    Send($usuario)

    Send($teclasParaMoverseHastaTabs)

    Send($teclasParaMoverseAPantalla)

    Send($teclasParaMoverseAResolucion)

    Send($teclasParaLaMayorResolucion)

    Send($teclasParaConectarES)
	Send($teclasParaConectarEN)

    WinWaitActive($ventanaSeguridad, "", 180)
    $dimensionesVentanaSeguridad = WinGetClientSize($ventanaSeguridad, "")
    $altoDeVentanaSeguridad = $dimensionesVentanaSeguridad[1]
    $alturaMinimaParaProceder = 300
    $repeticionesMaximas = 120
    $repeticionesDeRevision = 0

    while ($altoDeVentanaSeguridad < $alturaMinimaParaProceder) and ($repeticionesDeRevision < $repeticionesMaximas)
        $dimensionesVentanaSeguridad = WinGetClientSize($ventanaSeguridad, "")
        $altoDeVentanaSeguridad = $dimensionesVentanaSeguridad[1]
        Sleep(500)

    wend

    Sleep(500)
    WinActivate($ventanaSeguridad)

    Send($password)

    Send($teclasParaValidarConexion)

    Sleep(3000)

endfunc

func AutoConexionRemotaWin10($equipo, $usuario, $password, $resolucion)
    $tituloDeVentana = "(Conexión a Escritorio remoto)|(Remote Desktop Connection)"
    $claseDeVentana = "#32770"
    $tituloDeVentanaSeguridad = "(Seguridad de Windows)|(Windows Security)"
    $claseDeVentanaSeguridad = "Credential Dialog Xaml Host"

    $ventanaPrincipal = "[REGEXPTITLE:" & $tituloDeVentana & ";CLASS:" & $claseDeVentana & "]"
    $ventanaSeguridad = "[REGEXPTITLE:" & $tituloDeVentanaSeguridad & ";CLASS:" & $claseDeVentanaSeguridad & "]"

    $controlEquipo = "[CLASS:Edit; INSTANCE:1]"
    $teclasParaMostrarOpciones = "!o"
    $rutaDelPrograma = ENVGET("windir") & "\system32\mstsc.exe"
    $teclasParaBorrarContenido = "{DEL 50}"
    $teclasParaMoverseHastaTabs = "{TAB 8}"
    $teclasParaMoverseAlUsuario = "{TAB}"
    $teclasParaMoverseAPantalla = "{RIGHT}"
    $teclasParaMoverseAResolucion = "{TAB}"
    $teclasParaLaMayorResolucion = "{RIGHT 12}"
    $teclasParaConectarES = "!c"
	$teclasParaConectarEN = "!n"
    $teclasParaValidarConexion = "{ENTER}"

    ShellExecute($rutaDelPrograma)

    WinWaitActive($ventanaPrincipal, "", 120)
    Sleep(500)
    WinActivate($ventanaPrincipal)

    Send($teclasParaMostrarOpciones)

    Sleep(500)

    Send($teclasParaBorrarContenido)

    Send($equipo)

    Send($teclasParaMoverseAlUsuario)

    Send($teclasParaBorrarContenido)

    Send($usuario)

    Send($teclasParaMoverseHastaTabs)

    Send($teclasParaMoverseAPantalla)

    Send($teclasParaMoverseAResolucion)

    Send($teclasParaLaMayorResolucion)

    Send($teclasParaConectarES)
	Send($teclasParaConectarEN)

    WinWaitActive($ventanaSeguridad, "", 180)
    $dimensionesVentanaSeguridad = WinGetClientSize($ventanaSeguridad, "")
    $altoDeVentanaSeguridad = $dimensionesVentanaSeguridad[1]
    $alturaMinimaParaProceder = 300
    $repeticionesMaximas = 120
    $repeticionesDeRevision = 0

    while ($altoDeVentanaSeguridad < $alturaMinimaParaProceder) and ($repeticionesDeRevision < $repeticionesMaximas)
        $dimensionesVentanaSeguridad = WinGetClientSize($ventanaSeguridad, "")
        $altoDeVentanaSeguridad = $dimensionesVentanaSeguridad[1]
        Sleep(500)
        ;; Mensaje
        ;;MsgBox($IDOK, "No se encontro ventana", "Favor de verificar")
    wend

    Sleep(500)
    WinActivate($ventanaSeguridad)
    Send($password)
    Send($teclasParaValidarConexion)

    Sleep(3000)
endfunc
