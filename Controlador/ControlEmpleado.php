<?php

require_once 'Control.php';
require_once '../Modelo/Fachada.php';

class ControlEmpleado extends Control {

    public function buscarEmpleado($tipo, $informacion) {
        $fachada = new Fachada();
        $valor = $fachada->buscarEmpleado($tipo, $informacion);
        return $valor;
    }
    
    public function RegistrarEmpleado($codigo, $dni, $celular, $nSegSocial, $fIngreso, $contraseña, $tipoEmpleado) {
        $Fachada = new Fachada();
        $valor = $Fachada->registrarEmpleado($codigo, $dni, $celular, $nSegSocial, $fIngreso, $contraseña, $tipoEmpleado);
        return $valor;
    }

    public function GuiRegistrarEmpleado() {

        $pagina = $this->load_template("Registrar Empleado");
        include "../Vista/Seccion/Empleado/REmpleado.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }
    
    public function GuiConsultarEmpleado($valor){
        $resultados = $valor;
        ob_start();
        $pagina = $this->load_template("Consultar Empleado");
        include "../Vista/Seccion/Empleado/CEmpleado.html";
        $section = ob_get_clean();
        $pagina = $this->replace_content('/\#section\#/ms',$section,$pagina);
        $this->view_page($pagina);
    }

}
