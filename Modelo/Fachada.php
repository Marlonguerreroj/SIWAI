<?php
require 'Dao/DaoEmpleado.php';

class Fachada{
    var $DaoEmpleado;
    public function __construct() {
        $this->DaoEmpleado = new DaoEmpleado();
    }
    
    public function IniciarSesion($id,$contraseña){
        $DTOEmpleado = new EmpleadoDTO();
        $DTOEmpleado->setId($id);
        $DTOEmpleado->setContraseña($contraseña);
        $valor = $this->DaoEmpleado->IniciarSesion($DTOEmpleado);
        return $valor;
    }
}

