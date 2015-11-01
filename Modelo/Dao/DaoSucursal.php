<?php

require_once 'Dao.php';

class DaoSucursal extends Dao {

    public function registrarSucursal($DTOSucursal) {
        try {
            $Dao = new Dao();
            $codigo = $DTOSucursal->getCodigo();
            $nombre = $DTOSucursal->getNombre();
            $telefono = $DTOSucursal->getTelefono();
            $email = $DTOSucursal->getEmail();
            $pagina = $DTOSucursal->getPagina();
            $direccion = $DTOSucursal->getDireccion();
            $ciudad = $DTOSucursal->getCiudad();
            $pais = $DTOSucursal->getPais();

            $conexion = $Dao->conectar();
            $stmt = $conexion->prepare("INSERT INTO Sucursal (cod_sucursal,nom_sucursal,tel_sucursal,
                email_sucursal,web_sucursal,dir_sucursal,ciudad_sucursal,pais_sucursal) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_Param('isisssss', $codigo, $nombre, $telefono, $email, $pagina, $direccion, $ciudad, $pais);
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
