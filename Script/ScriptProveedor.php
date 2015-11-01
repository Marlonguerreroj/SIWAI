<?php

require_once '../Controlador/ControlProveedor.php';
$controlador = new ControlProveedor();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['enviar'])) {
        $codigo = $_POST['codigo'];
        $nit = $_POST['nit'];
        $nombre = $_POST['nombre'];
        $pagina = $_POST['pagina'];
        $telefono = $_POST['telefono'];
        $cuentaBancaria = $_POST['cuentaBancaria'];
        $nCuentaBancaria = $_POST['nCuentaBancaria'];
        $nombreContacto = $_POST['nombreContacto'];
        $email = $_POST['email'];

        $valor = $controlador->registrarProveedor($codigo, $nit, $nombre, $pagina, $telefono, $cuentaBancaria, $nCuentaBancaria, $nombreContacto, $email);
        if ($valor) {
            echo '<script language="javascript">alert("El proveedor se registro '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos proveedores con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiRegistrarProveedor();
        }
    } else {
     return $controlador->GuiRegistrarProveedor();   
    }
    if ($_GET) {

        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarProveedor();
        }
    }
} else {
    return $controlador->Principal();
}

