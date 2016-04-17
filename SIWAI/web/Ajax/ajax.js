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


    var xhttp = new XMLHttpRequest();
    var text = "/SIWAI/ControladorEmpleado?usuario=" + usuario + "&contra=" + contra + "&iniciarSesion=true";
    xhttp.open("POST", text, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if ((sub.indexOf('nulo') >= 0)) {
                campo1.parentNode.className = " form-group has-error has-feedback";
                campo2.parentNode.className = "form-group espaciado has-error has-feedback";
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(campo1);
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(campo2);
            } else if (sub.indexOf("Error") >= 0) {
                if ($('#alert').length == 0) {
                    $("body").css("padding-top", "0%");
                    $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
                }
            } else {
                window.location.href = 'Seccion/Menu/menu.jsp';

            }
        }
    }
}

function registrarSucursal(document) {
    codigo = document.elements[0];
    nombre = document.elements[1].value;
    telefono = document.elements[2].value;
    email = document.elements[3].value;
    paginaWeb = document.elements[4].value;
    direccion = document.elements[5].value;
    ciudad = document.elements[6].value;
    pais = document.elements[7].value;
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorSucursal?registrarSucursal=true&codigo=" + codigo.value + "&nombre=" +
            nombre + "&telefono=" + telefono + "&email=" + email + "&paginaWeb=" + paginaWeb +
            "&direccion=" + direccion + "&ciudad=" + ciudad + "&pais=" + pais;
    xhttp.open("POST", url, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>Existe otra sucursal registrada con el codigo ingresado</div>");
                codigo.parentNode.className = " col-md-3 has-error has-feedback";
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(codigo);
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                window.location.reload();
            }
        }
    }
}