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
            $id = $this->DTOEmpleado->getCod_Empleado();
            $contraseña = $this->DTOEmpleado->getContra_Empleado();
            $this->conexion = $this->dao->conectar();
            $stmt = $this->conexion->prepare("SELECT Tipo_Empleado FROM Empleado WHERE Cod_Empleado =? "
                    . "and Contra_Empleado =?");
            $stmt->bind_param("ss", $id, $contraseña);
            $stmt->execute();
            $stmt->store_result();
            $num = $stmt->num_rows;
            if ($num == 0) {
                return false;
            } else {
                $stmt->bind_result($col1);
                while ($stmt->fetch()) {
                    $result = $col1;
                }
                $stmt->close();
                $this->conexion = null;
                return $result;
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

}
