<?php
require '../Controlador/ControlManejoInicioSesion.php';

$controlador = new ControlManejoInicioSesion();

//inicia Sesion
session_start();

//Verdadero si no hay sesion iniciada

if (empty($_SESSION)) {
    if (isset($_POST['enviar'])) {
        $user = $_POST['usuario'];
        $contraseña = $_POST['contraseña'];
        $valor = $controlador->IniciarSesion($user, $contraseña);

        if ($valor == true) {
            return $controlador->Home();
        } else {
            $controlador->Principal();
        }
    } else {
        return $controlador->Principal();
    }
} else {
    if ($_GET) {
        if ($_GET['action'] == 'cerrar') {

            unset($_SESSION['usuario']);
            unset($_SESSION['contraseña']);
            session_destroy();
            //return $controlador->Principal();
        }
        if ($_GET['action'] == 'home') {

            echo"a";
            //  return $controlador->Home();
        }
    }
    echo"b";
       return $controlador->Home();
}
?>