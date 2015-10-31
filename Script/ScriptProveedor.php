<?php
require '../Controlador/ControlProveedor.php';
$controlador = new ControlProveedor();
session_start();

if (!empty($_SESSION)) {

    if ($_GET) {

        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarProveedor();
        }

    }
    
}else{
    return $controlador->Principal();
}

