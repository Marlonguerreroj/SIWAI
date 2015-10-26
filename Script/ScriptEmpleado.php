<?php

require '../Controlador/ControlEmpleado.php';
$controlador = new ControlEmpleado();
session_start();

if (!empty($_SESSION)) {
    echo"1";

    if ($_GET) {

        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarEmpleado();
        }

    }
    
}else{
    echo"2";
    return $controlador->Principal();
}

