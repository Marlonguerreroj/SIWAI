<?php

require_once '../Controlador/ControlSucursal.php';
$controlador = new ControlSucursal();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['buscar'])) {
        $tipo = $_POST['sel'];
        $informacion = $_POST['informacion'];
        $valor = $controlador->buscarSucursal($tipo, $informacion);
        if ($valor) {
            return $controlador->GuiConsultarSucursal($valor);
        } else {
            echo '<script language="javascript">alert("No encontro datos");</script>';
        }
    }

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
    }
    if (isset($_POST['enviar2'])) {
        $codigo = $_POST['codigo'];
        $nombre = $_POST['nombre'];
        $telefono = $_POST['telefono'];
        $email = $_POST['email'];
        $pagina = $_POST['pagina'];
        $direccion = $_POST['direccion'];
        $ciudad = $_POST['ciudad'];
        $pais = $_POST['pais'];

        $valor = $controlador->actualizarSucursal($codigo, $nombre, $telefono, $email, $pagina, $direccion, $ciudad, $pais);
        if ($valor) {
            echo '<script language="javascript">alert("La sucursal se actualizo '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos sucursales con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiActualizarSucursal(NULL);
        }
    }
    if ($_GET) {
        if (isset($_GET['codigo'])) {
            $tipo = "Codigo";
            $codigo = $_GET['codigo'];
            $valor = $controlador->buscarSucursal($tipo, $codigo);
            if ($valor) {
                return $controlador->GuiActualizarSucursal($valor);
            } else {
                echo '<script language="javascript">alert("No pudo realizar la accion");</script>';
            }
        } else
        if ($_GET['action'] == 'registrar') {
            return $controlador->guiRegistrarSucursal();
        } else
        if ($_GET['action'] == 'consultar') {
            return $controlador->GuiConsultarSucursal(null);
        } else
        if ($_GET['action'] == 'actualizar') {
            return $controlador->GuiActualizarSucursal(null);
        }
    }
    return $controlador->Home();
} else {
    return $controlador->Principal();
}


