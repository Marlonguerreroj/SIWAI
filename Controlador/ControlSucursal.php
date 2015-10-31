<?php

require 'Control.php';
require '../Modelo/Fachada.php';

class ControlSucursal extends Control {

    var $Fachada;

    function __construct() {
    }

    public function GuiRegistrarSucursal() {
        
        $pagina = $this->load_template("Registrar Sucursal");
        include "../Vista/Seccion/Sucursal/RSucursal.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}


