<?php

require 'Control.php';
require '../Modelo/Fachada.php';

class ControlCliente extends Control {

    var $Fachada;

    function __construct() {
    }

    public function GuiRegistrarCliente() {
        
        $pagina = $this->load_template("Registrar Cliente");
        include "../Vista/Seccion/Cliente/RCliente.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}

