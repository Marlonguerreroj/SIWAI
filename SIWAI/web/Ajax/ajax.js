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

function registrarEmpleado(document) {
    sucursal = document.elements[0].value;
    cargo = document.elements[1].value;
    codigo = document.elements[2].value;
    dni = document.elements[3].value;
    nombre = document.elements[4].value;
    apellido = document.elements[5].value;
    telefono = document.elements[6].value;
    celular = document.elements[7].value;
    contrasena = document.elements[8].value;
    email = document.elements[9].value;
    direccion = document.elements[10].value;
    fIngreso = document.elements[11].value;
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorEmpleado?registrarEmpleado=true&sucursal=" + sucursal + "&cargo=" + cargo +
            "&codigo=" + codigo + "&dni=" + dni + "&nombre=" + nombre + "&apellido=" + apellido + "&telefono=" + telefono +
            "&celular=" + celular + "&contrasena=" + contrasena + "&email=" + email + "&direccion=" + direccion +
            "&fIngreso=" + fIngreso;
    xhttp.open("POST", url, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>Existe otro empleado registrado con el DNI ingresado</div>");
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

/**
 * Metodo que recibe la peticion de registro de un cliente y la envia a ControladorCliente.
 * @param {type} document Formulario con los datosdel cliente.
 * @returns {undefined}
 */
function registrarCliente(document){
    nombres = document.elements[0].value;
    apellidos = document.elements[1].value;
    dni = document.elements[2].value;
    telefono = document.elements[3].value;
    direccion = document.elements[4].value;
    email = document.elements[5].value;
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorCliente?registrarCliente=true&dni=" + dni + "&nombre=" +
            nombres + "&apellido=" + apellidos + "&telefono=" + telefono + 
            "&email=" + email + "&direccion=" + direccion;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            if (sub.indexOf("Fallo") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Existe otro cliente registrado con el DNI: " + dni + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.indexOf("Exito") >= 0) {
                window.location.reload();
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success centrarDiv'>"+
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"+
                        "Cliente registrado exitosamente</div>");
            }
        }
    }
}