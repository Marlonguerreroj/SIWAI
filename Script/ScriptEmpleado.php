<?php

require '../Controlador/ControlEmpleado.php';
$controlador = new ControlEmpleado();
session_start();

if (!empty($_SESSION)) {

    if ($_GET) {
        
        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarEmpleado();
        }

    }
    
}else{
    return $controlador->Principal();
}

