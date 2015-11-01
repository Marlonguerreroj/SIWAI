<?php

require_once '../Controlador/ControlCliente.php';
$controlador = new ControlCliente();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['enviar'])) {
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $dni = $_POST['dni'];
        $telefono = $_POST['telefono'];
        $direccion = $_POST['direccion'];
        $email = $_POST['email'];

        $valor = $controlador->registrarCliente($dni, $nombre, $apellido, $direccion, $telefono, $email);
        if ($valor) {
            echo '<script language="javascript">alert("El cliente se registro '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos clientes con el mismo'
            . ' dni");</script>';
            return $controlador->GuiRegistrarCliente();
        }
    } else {
        return $controlador->GuiRegistrarCliente();
    }

    if ($_GET) {
        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarCliente();
        }
    }
} else {
    return $controlador->Principal();
}

