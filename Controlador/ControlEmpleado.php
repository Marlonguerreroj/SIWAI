<?php

require 'Control.php';
require '../Modelo/Fachada.php';

class ControlEmpleado extends Control {

    var $Fachada;

    function __construct() {
    }

    public function GuiRegistrarEmpleado() {
        
        $pagina = $this->load_template("Registrar Empleado");
        include "../Vista/Seccion/Empleado/REmpleado.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}
