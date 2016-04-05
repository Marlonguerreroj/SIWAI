/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
 lo que se puede copiar tal como esta aqui */
function nuevoAjax()
{
    var xmlhttp = false;
    try {
        // Creacion del objeto AJAX para navegadores no IE Ejemplo:Mozilla, Safari 
        xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
        try {
            // Creacion del objet AJAX para IE
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (E) {
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined')
                xmlhttp = new XMLHttpRequest();
        }
    }
    return xmlhttp;
}

function iniciarSesion(campo1, campo2) {
    ajax = nuevoAjax();
    usuario = campo1.value;
    contra = campo2.value;
    parametros = "usuario=" + usuario;
    +"&contra=" + contra;
    url = "/SIWAI/ControladorEmpleado";
    ajax.open("POST", url, true);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send(parametros);
    ajax.onreadystatechange = function () {
        if (ajax.readyState == 4) {
            if (ajax.status == 200) {
                var rta = ajax.responseText;
                if (rta == true) {
                    
                }else{
                 campo1   
                }
            }
        }
    }

}
