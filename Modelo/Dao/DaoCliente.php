<?php
require_once 'Dao.php';

class DaoCliente extends Dao {


    public function RegistrarCliente($DTOCliente) {
        try {
            $Dao = new Dao();
            $dni = $DTOCliente->getDni();
            $nombre = $DTOCliente->getNombre();
            $apellido = $DTOCliente->getApellido();
            $direccion = $DTOCliente->getDireccion();
            $telefono = $DTOCliente->getTelefono();
            $email = $DTOCliente->getEmail();

            $conexion = $Dao->conectar();
            $stmt = $conexion->prepare("INSERT INTO Cliente (dni_cliente,nom_cliente,ape_cliente,
                dir_cliente,tel_cliente,email_cliente) 
            VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_Param('ssssis', $dni, $nombre, $apellido, $direccion, $telefono, $email);
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
