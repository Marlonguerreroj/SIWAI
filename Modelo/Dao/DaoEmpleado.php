<?php

require '../Modelo/Dao/dao.php';
require '../Modelo/Dto/EmpleadoDTO.php';

class DaoEmpleado extends Dao {

    var $DTOEmpleado;
    var $dao;
    var $conexion;

    public function __construct() {
        $this->dao = new Dao();
        $this->conexion = null;
        $this->DTOEmpleado = null;
    }

    public function RegistrarEmpleado($DTOEmpleado) {
        try {
            $this->DTOEmpleado = $DTOEmpleado;
            $id = $this->DTOEmpleado->getId();
            $contraseña = $this->DTOEmpleado->getContraseña;
            $this->conexion = $this->dao->conectar();
            $stmt = $this->conexion->prepare("INSERT INTO Empleado (id, contra) 
            VALUES (?, ?)");
            $stmt->bind_Param('ss', $id, $contraseña);
            $stmt->execute();
            $this->conexion = null;
            $this->DTOEmpleado = null;
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
            echo "aa";
        }
    }

    public function IniciarSesion($DTOEmpleado) {
        try {
            $this->DTOEmpleado = $DTOEmpleado;
            $id = $this->DTOEmpleado->getId();
            $contraseña = $this->DTOEmpleado->getContraseña();
            $this->conexion = $this->dao->conectar();
            $stmt = $this->conexion->prepare("SELECT * FROM Empleado WHERE id=? and contra=?");
            $stmt->bind_param("ss", $id, $contraseña);
            $stmt->execute();
            $stmt->store_result();
            $num_of_rows = $stmt->num_rows;
            if ($num_of_rows > 0) {
                return true;
            } else {
                return false;
            }
            $this->conexion = null;
            return true;
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

}
