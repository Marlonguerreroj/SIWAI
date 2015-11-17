<?php

require_once '../Controlador/ControlEmpleado.php';
require_once '../Controlador/ControlCliente.php';
$controlador = new ControlEmpleado();
$controlador2 = new ControlCliente();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['buscar'])) {
        if (!empty($_POST['informacion'])) {
            $tipo = $_POST['sel'];
            $informacion = $_POST['informacion'];
            $valor = $controlador->buscarEmpleado($tipo, $informacion);
            if ($valor) {
                return $controlador->GuiConsultarEmpleado($valor);
            } else {
                echo '<script language="javascript">alert("No encontro datos");</script>';
            }
        } else {
            echo '<script language="javascript">alert("Llene los campos");</script>';
        }
    }

    if (isset($_POST['enviar'])) {
        $codigo = $_POST['codigo'];
        $dni = $_POST['dni'];
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $telefono = $_POST['telefono'];
        $celular = $_POST['celular'];
        $nSegSocial = $_POST['nSeguridad'];
        $fIngreso = $_POST['fIngreso'];
        $direccion = $_POST['direccion'];
        $email = $_POST['email'];
        $contraseña = $_POST['contraseña'];
        $tipoEmpleado = $_POST['sel2'];

        $valor1 = $controlador2->registrarCliente($dni, $nombre, $apellido, $direccion, $telefono, $email);
        $valor = $controlador->registrarEmpleado($codigo, $dni, $celular, $nSegSocial, $fIngreso, $contraseña, $tipoEmpleado);
        if ($valor) {
            echo '<script language="javascript">alert("El empleado se registro '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos empleados con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiRegistrarEmpleado();
        }
    }

    if ($_GET) {
        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarEmpleado();
        }
        if ($_GET['action'] == 'consultar') {
            return $controlador->GuiConsultarEmpleado(null);
        }
    }
    return $controlador->Home();
} else {
    return $controlador->Principal();
}

