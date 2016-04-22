<?php

abstract class Control {

    public function Principal() {
        $pagina = $this->load_page('../Vista/Principal.html');
        $this->view_page($pagina);
    }
    
    function load_template($title = 'Sin Titulo') {
        $pagina = $this->load_page('../Vista/Home.html');
        $header = $this->load_page('../Vista/Header.html');
        $pagina = $this->replace_content('/\#header\#/ms', $header, $pagina);
        $pagina = $this->replace_content('/\#title\#/ms', $title, $pagina);
        

        return $pagina;
    }
    
    function load_page($page) {
        return file_get_contents($page);
    }

    /* METODO QUE ESCRIBE EL CODIGO PARA QUE SEA VISTO POR EL USUARIO

     */

    function view_page($html) {
        echo $html;
    }

    function replace_content($in = '/\#CONTENIDO\#/ms', $out, $pagina) {
        return preg_replace($in, $out, $pagina);
    }

    public function Home() {

        $pagina = $this->load_template("HOME");
       // $section = $this->load_page('Vista/seccion/seccionHome.html');
        //$pagina = $this->replace_content('/\#section\#/ms', $section, $pagina);
        $this->view_page($pagina);
    }

}
