<?php
require '../Controlador/ControlCliente.php';
$controlador = new ControlCliente();
session_start();

if (!empty($_SESSION)) {

    if ($_GET) {

        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarCliente();
        }

    }
    
}else{
    return $controlador->Principal();
}

