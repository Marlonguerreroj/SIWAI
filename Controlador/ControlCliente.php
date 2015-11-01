<?php
require_once 'Control.php';
require_once '../Modelo/Fachada.php';

class ControlCliente extends Control {

   
    public function  registrarCliente($dni,$nombre,$apellido,$direccion,$telefono,$email){
        $Fachada = new Fachada();
        $valor = $Fachada->registrarCliente($dni,$nombre,$apellido,$direccion,$telefono,$email);
        return $valor;
    }

    public function GuiRegistrarCliente() {

        $pagina = $this->load_template("Registrar Cliente");
        include "../Vista/Seccion/Cliente/RCliente.html";
        $section = ob_get_clean();

        $pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}
