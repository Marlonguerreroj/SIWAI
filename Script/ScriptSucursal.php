<?php

require '../Controlador/ControlSucursal.php';
$controlador = new ControlSucursal();
session_start();

if (!empty($_SESSION)) {

    if ($_GET) {

        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarSucursal();
        }

    }
    
}else{
    echo"2";
    return $controlador->Principal();
}



