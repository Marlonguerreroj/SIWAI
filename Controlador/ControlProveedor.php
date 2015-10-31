<?php
require 'Control.php';
require '../Modelo/Fachada.php';

class ControlProveedor extends Control {

    var $Fachada;

    function __construct() {
    }

    public function GuiRegistrarProveedor() {
        
        $pagina = $this->load_template("Registrar Proveedor");
        include "../Vista/Seccion/Proveedor/RProveedor.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}

