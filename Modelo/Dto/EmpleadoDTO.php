<?php

class EmpleadoDTO{
    private $Cod_Empleado;
    private $Contra_Empleado;
    private $Tipo_Empleado;
    
    
    public function __construct(){
    }
    function getTipo_Empleado() {
        return $this->Tipo_Empleado;
    }

    function setTipo_Empleado($Tipo_Empleado) {
        $this->Tipo_Empleado = $Tipo_Empleado;
    }

        function getCod_Empleado() {
        return $this->Cod_Empleado;
    }

    function getContra_Empleado() {
        return $this->Contra_Empleado;
    }

    function setCod_Empleado($Cod_Empleado) {
        $this->Cod_Empleado = $Cod_Empleado;
    }

    function setContra_Empleado($Contra_Empleado) {
        $this->Contra_Empleado = $Contra_Empleado;
    }



}

