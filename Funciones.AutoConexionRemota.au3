Opt("SendKeyDelay", 40) ;5 milliseconds

func AutoConexionRemota($equipo, $usuario, $password, $resolucion)

    $tituloDeVentana = "Conexión a Escritorio remoto"
    $claseDeVentana = "#32770"
    $tituloDeVentanaSeguridad = "Seguridad de Windows"
    $claseDeVentanaSeguridad = $claseDeVentana

    $ventanaPrincipal = "[TITLE:" & $tituloDeVentana & ";CLASS:" & $claseDeVentana & "]"
    $ventanaSeguridad = "[TITLE:" & $tituloDeVentanaSeguridad & ";CLASS:" & $claseDeVentanaSeguridad & "]"

    $controlEquipo = "[CLASS:Edit; INSTANCE:1]"
    $teclasParaMostrarOpciones = "!o"
    $rutaDelPrograma = ENVGET("windir") & "\system32\mstsc.exe"
    $teclasParaBorrarContenido = "{DEL 50}"
    $teclasParaMoverseHastaTabs = "{TAB 8}"
    $teclasParaMoverseAlUsuario = "{TAB}"
    $teclasParaMoverseAPantalla = "{RIGHT}"
    $teclasParaMoverseAResolucion = "{TAB}"
    $teclasParaLaMayorResolucion = "{RIGHT 12}"
    $teclasParaConectar = "!c"
    $teclasParaValidarConexion = "{ENTER}"

    ShellExecute($rutaDelPrograma)

    WinWaitActive($ventanaPrincipal, "", 30)
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

    Send($teclasParaConectar)

    WinWaitActive($ventanaSeguridad, "", 120)
    Sleep(500)
    WinActivate($ventanaSeguridad)

    Send($password)

    Send($teclasParaValidarConexion)

endfunc
