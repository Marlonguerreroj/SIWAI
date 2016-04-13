/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
 lo que se puede copiar tal como esta aqui */

function iniciarSesion(campo1, campo2) {
    usuario = campo1.value;
    contra = campo2.value;
    iniciar = true;

    var xhttp = new XMLHttpRequest();
    var text = "/SIWAI/ControladorEmpleado?usuario=" + usuario + "&contra=" + contra + "&iniciarSesion=" + iniciar;
    xhttp.open("POST", text, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf('null') >= 0) {
                campo1.parentNode.className = " form-group has-error has-feedback";
                campo2.parentNode.className = "form-group espaciado has-error has-feedback";
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(campo1);
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(campo2);
            } else {
                window.location.href = 'Seccion/Menu/menu.jsp';

            }
        }
    }
}
