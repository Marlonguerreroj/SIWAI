<?php

require_once '../Controlador/ControlSucursal.php';
$controlador = new ControlSucursal();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['enviar'])) {
        $codigo = $_POST['codigo'];
        $nombre = $_POST['nombre'];
        $telefono = $_POST['telefono'];
        $email = $_POST['email'];
        $pagina = $_POST['pagina'];
        $direccion = $_POST['direccion'];
        $ciudad = $_POST['ciudad'];
        $pais = $_POST['pais'];

        $valor = $controlador->registrarSucursal($codigo, $nombre, $telefono, $email, $pagina, $direccion, $ciudad, $pais);
        if ($valor) {
            echo '<script language="javascript">alert("La sucursal se registro '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos sucursales con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiRegistrarSucursal();
        }
    } else {
        return $controlador->GuiRegistrarSucursal();
    }
    if ($_GET) {
        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarSucursal();
        }
        
        if ($_GET['action'] == 'consultar') {
            return $controlador->GuiConsultarSucursal();
        }
    }
} else {
    return $controlador->Principal();
}



