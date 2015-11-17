<?php

require_once 'Control.php';
require_once '../Modelo/Fachada.php';

class ControlSucursal extends Control {

    public function registrarSucursal($codigo,$nombre,$telefono,$email,$pagina,$direccion,$ciudad,$pais){
        $fachada = new Fachada();
        $valor = $fachada->registrarSucursal($codigo,$nombre,$telefono,$email,$pagina,$direccion,$ciudad,$pais);
        return $valor;
    }
    public function actualizarSucursal($codigo,$nombre,$telefono,$email,$pagina,$direccion,$ciudad,$pais){
        $fachada = new Fachada();
        $valor = $fachada->actualizarSucursal($codigo,$nombre,$telefono,$email,$pagina,$direccion,$ciudad,$pais);
        return $valor;
    }
    
    public function buscarSucursal($tipo,$informacion){
        $fachada = new Fachada();
        $valor = $fachada->buscarSucursal($tipo,$informacion);
        return $valor;
    }
    public function GuiRegistrarSucursal() {
        $pagina = $this->load_template("Registrar Sucursal");
        include "../Vista/Seccion/Sucursal/RSucursal.html";
        $section = ob_get_clean();
        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }
    
    public function GuiConsultarSucursal($valor){
        $resultados = $valor;
        ob_start();
        $pagina = $this->load_template("Consultar Sucursal");
        include "../Vista/Seccion/Sucursal/CSucursal.html";
        $section = ob_get_clean();
        $pagina = $this->replace_content('/\#section\#/ms',$section,$pagina);
        $this->view_page($pagina);
    }
    public function GuiActualizarSucursal($valor){
        $resultados = $valor;
        ob_start();
        $pagina = $this->load_template("Actualizar Sucursal");
        include "../Vista/Seccion/Sucursal/ASucursal.html";
        $section = ob_get_clean();
        $pagina = $this->replace_content('/\#section\#/ms',$section,$pagina);
        $this->view_page($pagina);
    }

}


