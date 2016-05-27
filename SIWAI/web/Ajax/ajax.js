/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function iniciarSesion(campo1, campo2) {
    usuario = campo1.value;
    contra = campo2.value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var text = "/SIWAI/ControladorEmpleado?usuario=" + usuario + "&contra=" + contra + "&iniciarSesion=true";
    xhttp.open("POST", text, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
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
                window.location = 'Seccion/Menu/menu.jsp';
            }
        }
    };
}

function cambiarContraseña(document) {
    contraActual = document.elements[0];
    contraNueva = document.elements[1];
    contraNueva2 = document.elements[2];
    var xhttp = new XMLHttpRequest();
    $.blockUI();
    var url = "/SIWAI/ControladorEmpleado?cambiarContra=true&contraActual=" + contraActual.value + "&contraNueva=" +
            contraNueva.value + "&contraNueva2=" + contraNueva2.value;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("incorrecta") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" + sub + "</div>");
                contraActual.parentNode.className = "col-md-4 has-error has-feedback";
                contraNueva.parentNode.className = "col-md-4";
                contraNueva2.parentNode.className = "col-md-4";
            } else if (sub.indexOf("coincide") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" + sub + "</div>");
                contraActual.parentNode.className = "col-md-4";
                contraNueva.parentNode.className = "col-md-4 has-error has-feedback";
                contraNueva2.parentNode.className = "col-md-4 has-error has-feedback";
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-success centrarDiv'>" +
                        "Se realizaron los cambios satisfactoriamente" + "</div>");
                contraNueva.parentNode.className = "col-md-4";
                contraNueva2.parentNode.className = "col-md-4";
                contraActual.parentNode.className = "col-md-4";
                $("#form")[0].reset();
            } else if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "No se pudo realizar la modificación" + "</div>");
            }
        }
    };
}

function registrarSucursal(document) {
    codigo = document.elements[0];
    nombre = document.elements[1].value;
    telefono = document.elements[2].value;
    email = document.elements[3].value;
    paginaWeb = document.elements[4].value;
    direccion = document.elements[5].value;
    pais = document.elements[6].value;
    ciudad = document.elements[7].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorSucursal?registrarSucursal=true&codigo=" + codigo.value + "&nombre=" +
            nombre + "&telefono=" + telefono + "&email=" + email + "&paginaWeb=" + paginaWeb +
            "&direccion=" + direccion + "&ciudad=" + ciudad + "&pais=" + pais;
    xhttp.open("POST", url, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>Existe otra sucursal registrada con el codigo ingresado</div>");
                codigo.parentNode.className = " col-md-3 has-error has-feedback";
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(codigo);
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-success centrarDiv'>Sucursal registrada exitosamente</div>");
                $("#form")[0].reset();
            } else if (sub.indexOf("Por favor") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" + sub + "</div>");
            }
        }
    };
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
    email = document.elements[8].value;
    direccion = document.elements[9].value;
    fIngreso = document.elements[10].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorEmpleado?registrarEmpleado=true&sucursal=" + sucursal + "&cargo=" + cargo +
            "&codigo=" + codigo + "&dni=" + dni + "&nombre=" + nombre + "&apellido=" + apellido + "&telefono=" + telefono +
            "&celular=" + celular + "&email=" + email + "&direccion=" + direccion +
            "&fIngreso=" + fIngreso;
    xhttp.open("POST", url, true);
    xhttp.send();

    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>Existe otro empleado registrado con el DNI ingresado</div>");
                codigo.parentNode.className = " col-md-3 has-error has-feedback";
                $("<span class='glyphicon glyphicon-remove form-control-feedback'></span>").insertAfter(codigo);
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-success centrarDiv'>Empleado registrado exitosamente</div>");
                $("#form")[0].reset();
            }
        }
    };
}

/**
 * Metodo que recibe la peticion de registro de un cliente y la envia a ControladorCliente.
 * @param {type} document Formulario con los datosdel cliente.
 * @returns {undefined}
 */
function registrarCliente(document) {
    dni = document.elements[0].value;
    nombres = document.elements[1].value;
    apellidos = document.elements[2].value;
    ciudad = document.elements[4].value;
    direccion = document.elements[5].value;
    telefono = document.elements[6].value;
    email = document.elements[7].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorCliente?registrarCliente=true&dni=" + dni + "&nombre=" +
            nombres + "&apellido=" + apellidos + "&telefono=" + telefono +
            "&email=" + email + "&direccion=" + direccion + "&ciudad=" + ciudad;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Fallo") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Existe otro cliente registrado con el DNI: " + dni + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.indexOf("Exito") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Cliente registrado exitosamente</div>");
                $("#form")[0].reset();
            } else {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + sub + "</div>");
            }
        }
    };
}

/**
 * Metodo que se encarga de registrar articulo
 * @param {type} document
 * @returns {undefined}
 */
function registrarArticulo(document) {
    ref = document.elements[0].value;
    nombre = document.elements[1].value;
    tipo = document.elements[2].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorArticulo?registrarArticulo=true&referencia=" + ref + "&nombre=" +
            nombre + "&tipo=" + tipo;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Fallo") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Existe otro artículo registrado con la misma referencia: " + ref + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.indexOf("Exito") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Articulo registrado exitosamente</div>");
                $("#form")[0].reset();
            } else {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + sub + "</div>");
            }
        }
    };
}
/**
 * Metodo que recibe la peticion de registro de un proveedor y la envia a ControladorPrveedor.
 * @param {type} document Formulario con los datos del proveedor.
 * @returns {undefined}
 */
function registrarProveedor(document) {
    codigo = document.elements[0].value;
    nit = document.elements[1].value;
    nombre = document.elements[2].value;
    web = document.elements[3].value;
    tipoCuentaBancaria = document.elements[4].value;
    nCuentaBancaria = document.elements[5].value;
    cuentaBancaria = document.elements[6].value;
    nombreContacto = document.elements[7].value;
    telefono = document.elements[8].value;
    email = document.elements[9].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorProveedor?registrarProveedor=true&codigo=" + codigo + "&nit=" +
            nit + "&nombre=" + nombre + "&web=" + web + "&telefono=" + telefono +
            "&email=" + email + "&tipoCuentaBancaria=" + tipoCuentaBancaria + "&nCuentaBancaria=" + nCuentaBancaria
            + "&cuentaBancaria=" + cuentaBancaria + "&nombreContacto=" + nombreContacto;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Fallo") >= 0) {
                mensaje = "Existe otro proveedor con el ";
                if (sub.indexOf("codigo") >= 0)
                    mensaje += " codigo: " + codigo;
                else if (sub.indexOf("nit") >= 0)
                    mensaje += "NIT: " + nit;
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + mensaje + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.indexOf("Exito") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-success centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Proveedor registrado exitosamente</div>");
                $("#form")[0].reset();
            } else {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + sub + "</div>");
            }
        }
    };
}

function actualizarSucursal(documento) {
    codigo = documento.elements[0].value;
    nombre = documento.elements[1].value;
    telefono = documento.elements[2].value;
    email = documento.elements[3].value;
    paginaWeb = documento.elements[4].value;
    direccion = documento.elements[5].value;
    pais = documento.elements[6].value;
    ciudad = documento.elements[7].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorSucursal?actualizarSucursal=true&codigo=" + codigo + "&nombre=" + nombre +
            "&telefono=" + telefono + "&email=" + email + "&paginaWeb=" + paginaWeb + "&direccion=" + direccion + "&ciudad=" + ciudad +
            "&pais=" + pais;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("Por favor") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                window.location = 'consultar.jsp';
            }
        }
    };
}

/**
 * Metodo que recibe la peticion de actualizacion de un cliente y la envia a ControladorCliente.
 * @param {type} document Formulario con los datos del cliente.
 * @returns {undefined}
 */
function actualizarCliente(document) {
    dni = document.elements[0].value;
    nombres = document.elements[1].value;
    apellidos = document.elements[2].value;
    ciudad = document.elements[4].value;
    direccion = document.elements[5].value;
    telefono = document.elements[6].value;
    email = document.elements[7].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorCliente?actualizarCliente=true&dni=" + dni + "&nombre=" +
            nombres + "&apellido=" + apellidos + "&telefono=" + telefono +
            "&email=" + email + "&direccion=" + direccion + "&ciudad=" + ciudad;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Fallo") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "No se encontro el cliente registrado con el DNI: " + dni + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.length == 0) {
                window.location = 'consultar.jsp';
            } else {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + sub + "</div>");
            }
        }
    };
}

/**
 * Metodo que recibe la peticion de actualizacion de un proveedor y la envia a ControladorPrveedor.
 * @param {type} document Formulario con los datos del proveedor.
 * @returns {undefined}
 */
function actualizarProveedor(document) {
    codigo = document.elements[0].value;
    nit = document.elements[1].value;
    nombre = document.elements[2].value;
    web = document.elements[3].value;
    telefono = document.elements[4].value;
    email = document.elements[5].value;
    tipoCuentaBancaria = document.elements[6].value;
    nCuentaBancaria = document.elements[7].value;
    cuentaBancaria = document.elements[8].value;
    nombreContacto = document.elements[9].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorProveedor?actualizarProveedor=true&codigo=" + codigo + "&nit=" +
            nit + "&nombre=" + nombre + "&web=" + web + "&telefono=" + telefono +
            "&email=" + email + "&tipoCuentaBancaria=" + tipoCuentaBancaria + "&nCuentaBancaria=" + nCuentaBancaria
            + "&cuentaBancaria=" + cuentaBancaria + "&nombreContacto=" + nombreContacto;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Fallo") >= 0) {
                mensaje = "Existe otro proveedor con el ";
                if (sub.indexOf("codigo") >= 0)
                    mensaje += " codigo: " + codigo;
                else if (sub.indexOf("nit") >= 0)
                    mensaje += "NIT: " + nit;
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + mensaje + "</div>");
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else if (sub.length == 0) {
                window.location = 'consultar.jsp';
            } else {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>"
                        + sub + "</div>");
            }
        }
    };
}
function actualizarEmpleado(document) {
    sucursal = document.getElementById("sel1").value;
    cargo = document.getElementById("sel2").value;
    dni = document.getElementById("dni").value;
    nombre = document.getElementById("nombre").value;
    apellido = document.getElementById("apellido").value;
    codigo = document.getElementById("codigo").value;
    celular = document.getElementById("celular").value;
    telefono = document.getElementById("telefono").value;
    email = document.getElementById("email").value;
    direccion = document.getElementById("direccion").value;
    fIngreso = document.getElementById("fIngreso").value;
    if (document.getElementById('r1').checked == true) {
        habilitado = document.getElementById("r1").value;
    } else {
        habilitado = document.getElementById("r2").value;
    }
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorEmpleado?actualizarEmpleado=true&sucursal=" + sucursal + "&cargo=" + cargo +
            "&dni=" + dni + "&nombre=" + nombre + "&apellido=" + apellido + "&codigo=" + codigo + "&celular=" + celular +
            "&telefono=" + telefono + "&email=" + email + "&direccion=" + direccion + "&fIngreso=" + fIngreso +
            "&habilitado=" + habilitado;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                window.location = 'consultar.jsp';
            }
        }
    };
}

function registrarArticuloExtra(document) {
    codigo = document.elements[0];
    sucursal = document.elements[1].value;
    nombre = document.elements[2].value;
    cantidad = document.elements[3].value;
    fEntrada = document.elements[4].value;
    costo = document.elements[5].value;
    valor = document.elements[6].value;
    notas = document.elements[7].value;
    alert("a");
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorArticuloExtra?registrarArticuloExtra=true&codigo=" + codigo.value + "&sucursal=" +
            sucursal + "&nombre=" + nombre + "&cantidad=" + cantidad + "&fEntrada=" + fEntrada +
            "&costo=" + costo + "&valor=" + valor + "&notas=" + notas;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            alert(sub);
            if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>Existe otro articulo extra registrado con el codigo ingresado</div>");
                codigo.parentNode.className = " col-md-3 has-error has-feedback";
            } else if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" + sub + "</div>");
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-success centrarDiv'>Articulo extra registrado exitosamente</div>");
                $("#form")[0].reset();
            } else if (sub.indexOf("Por favor") >= 0) {
                $("div").remove("#alert");
                $("body").prepend("<div id='alert' class='alert alert-warning centrarDiv'>" + sub + "</div>");
            }
        }
    };
}

/**
 * Metodo que recibe la peticion para crear un pedido.
 * @param {type} document Datos del pedido.
 * @returns {undefined}
 */
function crearPedido(documento) {
    proveedor = documento.elements[0].value;
    fecha = documento.elements[1].value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorPedido?crearPedido=true&codProveedor=" +
            proveedor + "&fecha=" + fecha;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("section").prepend("<div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div>");
            } else {
                $("#nuevo-formulario").prepend("<h2 class='text-center'>Articulos</h2>"+
                        "<div class='container'>" +
                        "<div class='row'>" +
                        "<div class='col-md-1'></div>" +
                        "<div class='col-md-10'>" +
                        "<br>" +
                        "<div class='table-responsive'>" +
                        "<table class='table' id='table'>" +
                        "<thead>" +
                        "<tr>" +
                        "<th class='text-center'>Referencia</th>" +
                        "<th class='text-center'>Nombre</th>" +
                        "<th class='text-center'>Cantidad</th>" +
                        "<th></th>" +
                        "</tr>" +
                        "</thead>" +
                        "</table>" +
                        "</div>" +
                        "</div>" +
                        "<div class='col-md-1'></div>" +
                        "</div>" +
                        "<br>" +
                        "<br>" +
                        "<div class='row centrar-texto'>" +
                        "<div class='col-md-4'></div>" +
                        "<div class='col-md-2'>" +
                        "<button  name='enviarPedido' type='submit' class='btn btn-success btn-lg letra'>Registrar" +
                        "</button>" +
                        "</div>" +
                        "<div class='col-md-2'>" +
                        "<a href='../Menu/menu.jsp' class='btn btn-danger btn-lg letra'>Cancelar" +
                        "</a>" +
                        "</div>" +
                        "<div class='col-md-4'></div>" +
                        "</div>" +
                        "</div>" +
                        "<br>" +
                        "<br>");
                documento.elements[0].disabled = true;
                documento.elements[1].readOnly = true;
                $("#crear").remove();
                a = añadirFilaPedidos();
                alert(a);
                document.getElementById("codigo"+a).focus();
            }
        }
    };
}

/**
 * Metodo que carga el nombre de un articulo en el pedido.
 * @param {type} referencia Referencia del articulo.
 * @returns {undefined}
 */
function cargarNombreArticuloPedido(campo, nombre, cantidad) {
    $.blockUI();
    referencia = campo.value;
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorArticulo?cargarNombreArticuloPedido=true&referencia=" + referencia;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error en la conexion a la base de datos</div></div></div></div>");
            } else if (sub.indexOf("ArticuloNombre") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El artículo con referencia: " + referencia + " ya esta en el pedido</div></div></div></div>");
                nombre.value = "";
            } else {
                $("div").remove("#alert");
                nombre.value = sub;
                campo.readOnly = true;
                cantidad.readOnly = false;
                cantidad.focus();
            }
        }
    };
}

/**
 * Metodo que carga el nombre de un articulo en el pedido.
 * @param {type} referencia Referencia del articulo.
 * @returns {undefined}
 */
function aniadirArticuloPedido(campo1, campo2) {
    referencia = campo2.value;
    cantidad = campo1.value;
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorPedido?aniadirArticulo=true&referencia=" + referencia + 
            "&cantidad=" + cantidad;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error, intente de nuevo por favor</div></div></div></div>");
            } else if (sub.indexOf("Numero") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "El campo cantidad solo recibe un numero entero mayor que 0</div></div></div></div>");
                nombre.value = "";
            } else if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Existe otro articulo con esa referencia en el pedido</div></div></div></div>");
                nombre.value = "";
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                campo1.readOnly = true;
                a = añadirFilaPedidos();
                document.getElementById("codigo"+a).focus();
            }
        }
    };
}

/**
 * Metodo que elimina un articulo del pedido
 * @param {type} referencia Referencia del articulo.
 * @returns {undefined}
 */
function eliminarArticuloPedido(referencia, fila) {
    $.blockUI();
    var xhttp = new XMLHttpRequest();
    var url = "/SIWAI/ControladorPedido?eliminarArticulo=true&referencia=" + referencia;
    xhttp.open("POST", url, true);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var sub = xhttp.responseText;
            $.unblockUI();
            if (sub.indexOf("Error") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-danger centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "Error, intente de nuevo por favor</div></div></div></div>");
            } else if (sub.indexOf("false") >= 0) {
                $("div").remove("#alert");
                $("#nuevo-formulario").prepend("<div class='container'><div class='row'><div class='col-md-10 col-md-offset-1'><div id='alert' class='alert alert-warning centrarDiv'>" +
                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a>" +
                        "No se pudo eliminar el articulo</div></div></div></div>");
                nombre.value = "";
            } else if (sub.indexOf("true") >= 0) {
                $("div").remove("#alert");
                myDeleteFunction(fila, 1);
            }
        }
    };
}