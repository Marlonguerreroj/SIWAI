<?php

require_once 'Dao.php';

class DaoProveedor extends Dao {

    public function registrarProveedor($DTOProveedor) {
        try {
            $Dao = new Dao();
            $codigo = $DTOProveedor->getCodigo();
            $nit = $DTOProveedor->getNit();
            $nombre = $DTOProveedor->getNombre();
            $nCuentaBancaria = $DTOProveedor->getNCuentaBancaria();
            $cuentaBancaria = $DTOProveedor->getCuentaBancaria();
            $pagina = $DTOProveedor->getPagina();
            $nombreContacto = $DTOProveedor->getNombreContacto();
            $telefono = $DTOProveedor->getTelefono();
            $email = $DTOProveedor->getEmail();

            $conexion = $Dao->conectar();
            $stmt = $conexion->prepare("INSERT INTO Proveedor (cod_proveedor,nit_proveedor,nom_proveedor,
                num_cuenta_proveedor,cuenta_proveedor,sitio_web_proveedor,nom_contacto_proveedor,
                tel_contacto_proveedor,email_contacto_proveedor) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_Param('sssisssis', $codigo, $nit, $nombre, $nCuentaBancaria, $cuentaBancaria, $pagina, $nombreContacto, $telefono, $email);
            $stmt->execute();
            $num = $stmt->affected_rows;
            $stmt->close();
            if ($num < 0) {
                return false;
            } else {
                return true;
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

}
