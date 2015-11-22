<?php

require_once 'Dao.php';

class DaoEmpleado extends Dao {

    public function RegistrarEmpleado($DTOEmpleado) {
        try {
            $codigo = $DTOEmpleado->getCodigo();
            $dni = $DTOEmpleado->getDni();
            $sucursal = $DTOEmpleado->getSucursal();
            $tipoEmpleado = $DTOEmpleado->getTipoEmpleado();
            $contraseña = $DTOEmpleado->getContraseña();
            $fIngreso = $DTOEmpleado->getfIngreso();
            $fSalida = null;
            $celular = $DTOEmpleado->getCelular();

            $conexion = $this->conectar();
            $stmt = $conexion->prepare("INSERT INTO Empleado (cod_empleado, dni_cli_empleado,
                cod_sucur_empleado,tipo_empleado,contra_empleado,ingreso_empleado,salida_empleado,
                celular_empleado) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->bind_Param('ssissssi', $codigo, $dni, $sucursal, $tipoEmpleado, $contraseña, $fIngreso, $fSalida, $celular);
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
            $id = $DTOEmpleado->getCodigo();
            $contraseña = $DTOEmpleado->getContraseña();
            $conexion = $this->conectar();
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

    public function buscarEmpleado($DTOEmpleado) {
        try {
            $tipo = $DTOEmpleado->getTipo();
            $informacion = $DTOEmpleado->getInformacion();
            $conexion = $this->conectar();
            if ($tipo == 'Sucursal') {
                $stmt = $conexion->prepare("SELECT * FROM Empleado WHERE cod_sucur_empleado = ?");
            } else if ($tipo == 'Codigo') {
                $stmt = $conexion->prepare("SELECT * FROM Empleado WHERE cod_empleado = ?");
            } else if ($tipo == 'Dni') {
                $stmt = $conexion->prepare("SELECT * FROM Empleado WHERE dni_cli_empleado = ?");
            }
            $stmt->bind_param("s", $informacion);
            $stmt->execute();
            $stmt->store_result();
            $num = $stmt->num_rows;
            if ($num == 0) {
                $stmt->close();
                return false;
            } else {
                //echo '<script language="javascript">alert("' . $num . '");</script>';
                $resultado = array();
                $i = 0;
                $stmt->bind_result($col1, $col2, $col3, $col4, $col5, $col6, $col7, $col8);
                while ($stmt->fetch()) {
                    $result = $col1 . "-" . $col2 . "-" . $col3 . "-" . $col4 . "-" .
                            $col5 . "-" . $col6 . "-" . $col7 . "-" . $col8;
                    $resultado[$i] = array($col1, $col2, $col3, $col4, $col5, $col6, $col7, $col8);
                    $i++;
                    //   echo '<script language="javascript">alert("' . $result . '");</script>';
                }

                $stmt->close();
                return $resultado;
            }
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }

}
