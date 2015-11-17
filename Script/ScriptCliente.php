<?php

require_once '../Controlador/ControlCliente.php';
$controlador = new ControlCliente();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['buscar'])) {
        if (!empty($_POST['informacion'])) {
            $tipo = $_POST['sel'];
            $informacion = $_POST['informacion'];
            $valor = $controlador->buscarCliente($tipo, $informacion);
            if ($valor) {
               return $controlador->GuiConsultarCliente($valor);
            } else {
                echo '<script language="javascript">alert("No encontro datos");</script>';
            }
        } else {
            echo '<script language="javascript">alert("Llene los campos");</script>';
        }
    }
    if (isset($_POST['buscar2'])) {
        if (!empty($_POST['informacion'])) {
            $tipo = $_POST['sel'];
            $informacion = $_POST['informacion'];
            $valor = $controlador->buscarCliente($tipo, $informacion);
            if ($valor) {
               return $controlador->GuiActualizarCliente($valor);
            } else {
                echo '<script language="javascript">alert("No encontro datos");</script>';
            }
        } else {
            echo '<script language="javascript">alert("Llene los campos");</script>';
        }
    }
    
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
    }

    if ($_GET) {
        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarCliente();
        }
        if ($_GET['action'] == 'consultar') {
            return $controlador->GuiConsultarCliente(null);
        }
        if ($_GET['action'] == 'actualizar') {
            return $controlador->GuiActualizarCliente(null);
        }
    }
    return $controlador->Home();
} else {
    return $controlador->Principal();
}

