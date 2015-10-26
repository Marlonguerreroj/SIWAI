<?php
require '../Controlador/Control.php';
require '../Modelo/Fachada.php';

class ControlManejoInicioSesion extends Control {


    public function IniciarSesion($id,$contraseña){
        $Fachada = new Fachada();
        $estado = $Fachada->IniciarSesion($id, $contraseña);
        return $estado;
    }
}
