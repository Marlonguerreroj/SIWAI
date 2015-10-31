<?php
require 'Dao/DaoEmpleado.php';

class Fachada{
    var $DaoEmpleado;
    public function __construct() {
        $this->DaoEmpleado = new DaoEmpleado();
    }
    
    public function IniciarSesion($id,$contraseña){
        $DTOEmpleado = new EmpleadoDTO();
        $DTOEmpleado->setCod_Empleado($id);
        $DTOEmpleado->setContra_Empleado($contraseña);
        $valor = $this->DaoEmpleado->IniciarSesion($DTOEmpleado);
        return $valor;
    }
}

