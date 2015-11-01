<?php

require_once 'Dao.php';

class DaoEmpleado extends Dao {



    public function RegistrarEmpleado($DTOEmpleado) {
        try {
            $Dao = new Dao();
            $codigo = $DTOEmpleado->getCodigo();
            $dni = $DTOEmpleado->getDni();
            $sucursal = 1;
            $tipoEmpleado = $DTOEmpleado->getTipoEmpleado();
            $contraseña = $DTOEmpleado->getContraseña();
            $fIngreso = $DTOEmpleado->getfIngreso();
            $fSalida = null;
            $celular = $DTOEmpleado->getCelular();
            $nSegSocial = $DTOEmpleado->getNSegSocial();

            $conexion = $Dao->conectar();
            $stmt = $conexion->prepare("INSERT INTO Empleado (cod_empleado, dni_cli_empleado,
                cod_sucur_empleado,tipo_empleado,contra_empleado,ingreso_empleado,salida_empleado,
                celular_empleado,seg_social_empleado) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_Param('ssissssis', $codigo, $dni, $sucursal, $tipoEmpleado, $contraseña, $fIngreso, $fSalida, $celular, $nSegSocial);
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

    public function IniciarSesion($DTOEmpleado) {
        try {
            $Dao = new Dao();
            $id = $DTOEmpleado->getCodigo();
            $contraseña = $DTOEmpleado->getContraseña();
            $conexion = $Dao->conectar();
            $stmt = $conexion->prepare("SELECT tipo_empleado FROM Empleado WHERE cod_empleado =? "
                    . "and contra_empleado =?");
            $stmt->bind_param("ss", $id, $contraseña);
            $stmt->execute();
            $stmt->store_result();
            $num = $stmt->num_rows;
            
            if ($num == 0) {
                return false;
                $stmt->close();
            } else {
                echo 1;
                $stmt->bind_result($col1);
                while ($stmt->fetch()) {
                    $result = $col1;
                    
                }$stmt->close();
                return $result;
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

}
