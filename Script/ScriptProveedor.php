<?php

require_once '../Controlador/ControlProveedor.php';
$controlador = new ControlProveedor();
session_start();

if (!empty($_SESSION)) {
    if (isset($_POST['buscar'])) {
        if (!empty($_POST['informacion'])) {
            $tipo = $_POST['sel'];
            $informacion = $_POST['informacion'];
            $valor = $controlador->buscarProveedor($tipo, $informacion);
            if ($valor) {
               return $controlador->GuiConsultarProveedor($valor);
            } else {
                echo '<script language="javascript">alert("No encontro datos");</script>';
            }
        } else {
            echo '<script language="javascript">alert("Llene los campos");</script>';
        }
    }
    
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
        $tipoCuenta = $_POST['tipoCuentaBancaria'];

        $valor = $controlador->registrarProveedor($codigo, $nit, $nombre, $pagina, $telefono, $cuentaBancaria, $nCuentaBancaria, $nombreContacto, $email,$tipoCuenta);
        if ($valor) {
            echo '<script language="javascript">alert("El proveedor se registro '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos proveedores con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiRegistrarProveedor();
        }
    }
    if (isset($_POST['enviar2'])) {
        $codigo = $_POST['codigo'];
        $nit = $_POST['nit'];
        $nombre = $_POST['nombre'];
        $pagina = $_POST['pagina'];
        $telefono = $_POST['telefono'];
        $cuentaBancaria = $_POST['cuentaBancaria'];
        $nCuentaBancaria = $_POST['nCuentaBancaria'];
        $nombreContacto = $_POST['nombreContacto'];
        $email = $_POST['email'];
        $tipoCuenta = $_POST['tipoCuentaBancaria'];

        $valor = $controlador->actualizarProveedor($codigo, $nit, $nombre, $pagina, $telefono, $cuentaBancaria, $nCuentaBancaria, $nombreContacto, $email,$tipoCuenta);
        if ($valor) {
            echo '<script language="javascript">alert("El proveedor se actualizo '
            . 'satisfactoriamente");</script>';
            return $controlador->Home();
        } else {
            echo '<script language="javascript">alert("No puede haber dos proveedores con el mismo'
            . ' codigo");</script>';
            return $controlador->GuiRegistrarProveedor();
        }
    }
    if ($_GET) {
        if (isset($_GET['codigo'])) {
            $tipo = "Codigo";
            $codigo = $_GET['codigo'];
            $valor = $controlador->buscarProveedor($tipo, $codigo);
            if ($valor) {
                return $controlador->GuiActualizarProveedor($valor);
            } else {
                echo '<script language="javascript">alert("No pudo realizar la accion");</script>';
            }
        }else 
        if ($_GET['action'] == 'registrar') {
            return $controlador->GuiRegistrarProveedor();
        }else
        if ($_GET['action'] == 'consultar') {
            return $controlador->GuiConsultarProveedor(null);
        }
    }
    return $controlador->Home();
} else {
    return $controlador->Principal();
}

