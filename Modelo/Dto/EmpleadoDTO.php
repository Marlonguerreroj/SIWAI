<?php

class EmpleadoDTO{
    private $id;
    private $contraseña;
    
    
    public function __construct(){
    }
    
    public function getId() {
        return $this->id;
    }

    public function getContraseña() {
        return $this->contraseña;
    }

    public function setId($id) {
        $this->id = $id;
    }

    public function setContraseña($contraseña) {
        $this->contraseña = $contraseña;
    }


}

