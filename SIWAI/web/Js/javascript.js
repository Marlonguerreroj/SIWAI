function enviarFormOcultoSucursal(document, i) {
    codigo = document.getElementById("tablaS").rows[i + 1].cells[0].innerHTML;
    nombre = document.getElementById("tablaS").rows[i + 1].cells[1].innerHTML;
    telefono = document.getElementById("tablaS").rows[i + 1].cells[2].innerHTML;
    email = document.getElementById("tablaS").rows[i + 1].cells[3].innerHTML;
    paginaWeb = document.getElementById("tablaS").rows[i + 1].cells[4].innerHTML;
    direccion = document.getElementById("tablaS").rows[i + 1].cells[5].innerHTML;
    ciudad = document.getElementById("tablaS").rows[i + 1].cells[6].innerHTML;
    pais = document.getElementById("tablaS").rows[i + 1].cells[7].innerHTML;
    document.getElementById("codigo").value = codigo;
    document.getElementById("nombre").value = nombre;
    document.getElementById("telefono").value = telefono;
    document.getElementById("email").value = email;
    document.getElementById("paginaWeb").value = paginaWeb;
    document.getElementById("direccion").value = direccion;
    document.getElementById("ciudad").value = ciudad;
    document.getElementById("pais").value = pais;
    document.getElementById("formOculto").submit();
}

function enviarFormOcultoEmpleadoMas(document, i, apellido, telefono, email, direccion, habilitado) {
    sucursal = document.getElementById("tablaE").rows[i + 1].cells[2].innerHTML;
    cargo = document.getElementById("tablaE").rows[i + 1].cells[3].innerHTML;
    dni = document.getElementById("tablaE").rows[i + 1].cells[0].innerHTML;
    nombre = document.getElementById("tablaE").rows[i + 1].cells[1].innerHTML;
    celular = document.getElementById("tablaE").rows[i + 1].cells[6].innerHTML;
    fIngreso = document.getElementById("tablaE").rows[i + 1].cells[4].innerHTML;
    fSalida = document.getElementById("tablaE").rows[i + 1].cells[5].innerHTML;
    document.getElementById("formOculto").action = "mas.jsp";
    document.getElementById("sucursal").value = sucursal;
    document.getElementById("cargo").value = cargo;
    document.getElementById("dni").value = dni;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellido").value = apellido;
    document.getElementById("telefono").value = telefono;
    document.getElementById("celular").value = celular;
    document.getElementById("email").value = email;
    document.getElementById("direccion").value = direccion;
    document.getElementById("fIngreso").value = fIngreso;
    document.getElementById("fSalida").value = fSalida;
    document.getElementById("habilitado").value = habilitado;
    document.getElementById("formOculto").submit();
}

function enviarFormOcultoArticuloExMas(document, i, codigo, sucursal, nombre, cantidad, fEntrada, costo, valor, notas) {
    document.getElementById("formOculto").action = "mas.jsp";
    document.getElementById("codigo").value = codigo;
    document.getElementById("sucursal").value = sucursal;
    document.getElementById("nombre").value = nombre;
    document.getElementById("cantidad").value = cantidad;
    document.getElementById("fEntrada").value = fEntrada;
    document.getElementById("costo").value = costo;
    document.getElementById("valor").value = valor;
    document.getElementById("notas").value = notas;
    document.getElementById("formOculto").submit();
}

function enviarFormOcultoEmpleadoActualizar(document, i, codigo, apellido, telefono, email, direccion, habilitado, contraseña) {
    sucursal = document.getElementById("tablaE").rows[i + 1].cells[2].innerHTML;
    cargo = document.getElementById("tablaE").rows[i + 1].cells[3].innerHTML;
    dni = document.getElementById("tablaE").rows[i + 1].cells[0].innerHTML;
    nombre = document.getElementById("tablaE").rows[i + 1].cells[1].innerHTML;
    celular = document.getElementById("tablaE").rows[i + 1].cells[6].innerHTML;
    fIngreso = document.getElementById("tablaE").rows[i + 1].cells[4].innerHTML;
    document.getElementById("formOculto").action = "actualizar.jsp";
    document.getElementById("sucursal").value = sucursal;
    document.getElementById("cargo").value = cargo;
    document.getElementById("codigo").value = codigo;
    document.getElementById("dni").value = dni;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellido").value = apellido;
    document.getElementById("telefono").value = telefono;
    document.getElementById("celular").value = celular;
    document.getElementById("email").value = email;
    document.getElementById("direccion").value = direccion;
    document.getElementById("fIngreso").value = fIngreso;
    document.getElementById("contraseña").value = contraseña;
    document.getElementById("habilitado").value = habilitado;
    document.getElementById("formOculto").submit();
}

function enviarFormOcultoCliente(dni, nombre, apellido, telefono, email, direccion, pais, ciudad) {
    document.getElementById("dni").value = dni;
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellido").value = apellido;
    document.getElementById("telefono").value = telefono;
    document.getElementById("email").value = email;
    document.getElementById("direccion").value = direccion;
    document.getElementById("form-oculto").submit();
}

function enviarFormOcultoProveedorMas(codigo, nit, nombre, contacto, telefono, email, web, cuenta, tipo, numero) {
    document.getElementById("form-oculto").action = "mas.jsp";
    document.getElementById("codigo").value = codigo;
    document.getElementById("nit").value = nit;
    document.getElementById("nombre").value = nombre;
    document.getElementById("contacto").value = contacto;
    document.getElementById("telefono").value = telefono;
    document.getElementById("email").value = email;
    document.getElementById("web").value = web;
    document.getElementById("cuenta").value = cuenta;
    document.getElementById("tipo").value = tipo;
    document.getElementById("numero").value = numero;
    document.getElementById("form-oculto").submit();
}

function enviarFormOcultoProveedorActualizar(codigo, nit, nombre, contacto, telefono, email, web, cuenta, tipo, numero) {
    document.getElementById("form-oculto").action = "actualizar.jsp";
    document.getElementById("codigo").value = codigo;
    document.getElementById("nit").value = nit;
    document.getElementById("nombre").value = nombre;
    document.getElementById("contacto").value = contacto;
    document.getElementById("telefono").value = telefono;
    document.getElementById("email").value = email;
    document.getElementById("web").value = web;
    document.getElementById("cuenta").value = cuenta;
    document.getElementById("tipo").value = tipo;
    document.getElementById("numero").value = numero;
    document.getElementById("form-oculto").submit();
}

/** Metodo para verificar que se oprimio la tecla enter y invoca al metodo para añadir una fila */
function chequearEnter(event) {
    if (event.keyCode === 13) {
        añadirFila();
    }
}
function chequearEnter2(event) {
    if (event.keyCode === 13) {
        añadirFila2();
    }
}

/** Metodo para añadir una fila en registrar pedido*/
var a = 0;
function añadirFilaPedidos() {
    a++;
    var table = document.getElementById("table");
    var codigo = "codigo" + a;
    var nombre = "nombre" + a;
    var cantidad = "cantidad" + a;
    var fila = "" + a;
    var row = table.insertRow(a);
    row.id = fila;
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var campo1 = document.createElement("input");
    campo1.type = "text";
    campo1.required = true;
    campo1.setAttribute("onchange", "cargarNombreArticuloPedido(this, document.getElementById('" + nombre + "'),document.getElementById('" + cantidad + "'))");
    campo1.id = codigo;
    campo1.name = "codigo[]";
    campo1.className = "form-control";
    cell1.appendChild(campo1);
    var campo2 = document.createElement("input");
    campo2.type = "text";
    campo2.id = nombre;
    campo2.name = "nombre";
    campo2.required = true;
    campo2.readOnly = true;
    campo2.className = "form-control";
    cell2.appendChild(campo2);
    var campo3 = document.createElement("input");
    campo3.type = "number";
    campo3.readOnly = true;
    campo3.required = true;
    campo3.name = "cantidad[]";
    campo3.setAttribute("onchange", "aniadirArticuloPedido(this, document.getElementById('" + codigo + "'))");
    campo3.id = cantidad;
    campo3.className = "form-control";
    cell3.appendChild(campo3);
    var campo4 = document.createElement("button");
    campo4.innerHTML = "Borrar";
    campo4.className = "btn btn-danger";
    if (campo4.addEventListener) {
        campo4.addEventListener('click', function () {
            eliminarArticuloPedido(campo1.value, fila);
        }, false);
    } else {
        campo4.attachEvent('onclick', function () {
            eliminarArticuloPedido(campo1.value, fila);
        });
    }
    cell4.appendChild(campo4);
    return a;
}

var b = 2;
function añadirFilaVentas()
{
    var table = document.getElementById("table");
    var codigo = "codigo" + b;
    var nombre = "nombre" + b;
    var cantidad = "cantidad" + b;
    var total = "total" + b;
    var row = table.insertRow(b);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var campo1 = document.createElement("input");
    campo1.type = "text";
    campo1.required = true;
    campo1.setAttribute("onkeypress", "chequearEnter2(event, document.getElementById('" + nombre + "'), this,document.getElementById('" + cantidad + "'),document.getElementById('" + total + "'))");
    campo1.id = codigo;
    campo1.name = "codigo[]";
    campo1.className = "form-control";
    cell1.appendChild(campo1);
    var campo2 = document.createElement("input");
    campo2.type = "text";
    campo2.id = nombre;
    campo2.name = "nombre";
    campo2.required = true;
    campo2.readOnly = true;
    campo2.className = "form-control";
    cell2.appendChild(campo2);
    var campo3 = document.createElement("input");
    campo3.type = "text";
    campo3.readOnly = true;
    campo3.required = true;
    campo3.name = "cantidad[]"
    campo3.setAttribute("onkeypress", "chequearEnter(event)");
    campo3.id = cantidad;
    campo3.className = "form-control";
    cell3.appendChild(campo3);
    a++;
    var campo4 = document.createElement("input");
    campo4.type = "text";
    campo4.readOnly = true;
    campo4.name = "total[]";
    campo4.id = total;
    campo4.className = "form-control";
    cell4.appendChild(campo4);
    var campo5 = document.createElement("button");
    campo5.innerHTML = "Borrar";
    campo5.className = "btn btn-success";
    campo5.onclick = "";
    {
        myDeleteFunction(table, this.parentNode.parentNode.rowIndex, 2)
    }
    ;
    cell5.appendChild(campo5);
    b++;
}

function myDeleteFunction(fila, num) {
    alert(fila);
    document.getElementById("table").deleteRow(fila);
    if (num === 1) {
        a--;
    } else {
        b--;
    }
}

/**
 * Este metodo deshabilita la casilla informacion de las secciones de consultar
 * @returns {undefined}
 */
function capturar() {
    var posicion = document.getElementById("sel").options.selectedIndex;
    var valor = document.getElementById("sel").options[posicion].text;
    if (valor == "Todos") {
        if ($('#sucursales').length != 0) {
            $('#sucursales').hide();
        }
        document.form.informacion.type = "text";
        document.form.informacion.readOnly = true;
        document.form.informacion.required = false;
        document.form.informacion.value = "";
    } else if (valor.indexOf("Fecha") >= 0) {
        if ($('#sucursales').length != 0) {
            $('#sucursales').hide();
        }
        document.form.informacion.type = "date";
        document.form.informacion.readOnly = false;
        document.form.informacion.required = true;
    } else if (valor.indexOf("Sucursal") >= 0) {
        document.form.informacion.type = "hidden";
        if ($('#sucursales').length == 0) {
            $("<select name='sucursales' id='sucursales' class='tamañoConsultar' required></select>").insertAfter(document.form.informacion);
            cargarSucursales();
        } else {
            $('#sucursales').show();
        }
    } else {
        if ($('#sucursales').length != 0) {
            $('#sucursales').hide();
        }
        document.form.informacion.type = "text";
        document.form.informacion.readOnly = false;
        document.form.informacion.required = true;
    }

}

function anular(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    return (tecla != 13);
}

function cargarArticulosPedido(codigo) {
    $.blockUI();
    $.ajax({
        url: '/SIWAI/ControladorPedido?cargarPedidos=true&codigo=' + codigo,
        type: 'post',
        datatype: 'json',
        success: function (pedidos) {
            var json = eval('(' + pedidos + ')');
            var tabla = document.getElementById("tabla");
            for (var i = 0; i < json.length; i++) {
                var row = tabla.insertRow(i + 1);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                cell1.innerHTML = json[i].nombre;
                cell2.innerHTML = json[i].cantidad;
            }

        }
    });
    $.ajax({
        url: '/SIWAI/ControladorComparacion?consultarComparacion=true&codigo=' + codigo,
        type: 'post',
        datatype: 'json',
        success: function (comparacion) {
            var json = eval('(' + comparacion + ')');
            if (json.fecha == null) {
                $("#comparacion").append("<div class='text-center'><h3>" +
                        "El pedido no tiene una comparación</h3></div>");
            } else {
                $("#comparacion").append("<div class='text-center'><h3>" +
                        "Comparación</h3></div>" +
                        "<div class='row'><div class='col-md-1'></div><div class='col-md-1'>" +
                        "<p>Sucursal:</p></div><div class='col-md-3'><input readOnly value='" +
                        json.sucursal.nombre + "'type='text' class='form-control'></div>" +
                        "<div class='col-md-2'></div><div class='col-md-1'><p>Fecha:</p></div>" +
                        "<div class='col-md-3'><input readOnly value='" + json.fecha + "'" +
                        "type='date' class='form-control'></div><div class='col-md-1'></div></div>'" +
                        "<div class='row'><div class='col-md-1'></div><div class='col-md-1'>" +
                        "<p>Costo Transporte:</p></div><div class='col-md-3'><input readOnly value='" +
                        json.transporte + "'type='text' class='form-control'></div>" +
                        "<div class='col-md-2'></div><div class='col-md-1'><p>Notas:</p></div>" +
                        "<div class='col-md-3'><textarea readOnly " +
                        "type='date' class='form-control'>" + json.notas + "</textarea></div><div class='col-md-1'></div></div>'" +
                        "<div class='row'><div class='col-md-1'></div>" +
                        "<div class='col-md-10'><div class='table-responsive'>" +
                        "<table id='tabla-comparacion' class='table table-hover'><thead><tr>" +
                        "<th>Articulo</th><th>Cantidad</th><th>Costo Unidad</th><th>Precio Venta</th></tr>" +
                        "</thead></table></div></div><div class = 'col-md-1'></div></div>");
                var tabla = document.getElementById("tabla-comparacion");
                for (var i = 0; i < json.articulos.length; i++) {
                    var row = tabla.insertRow(i + 1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    cell1.innerHTML = json.articulos[i].nombre;
                    cell2.innerHTML = json.articulos[i].cantidad;
                    cell3.innerHTML = json.articulos[i].costo;
                    cell4.innerHTML = json.articulos[i].precio;
                }
            }
            $.unblockUI();
        }
    });
    
}

function cargarArticulosComparacion(codigo) {
    $.blockUI();
    $.ajax({
        url: '/SIWAI/ControladorPedido?cargarPedidos=true&codigo=' + codigo,
        type: 'post',
        datatype: 'json',
        success: function (articulos) {
            var json = eval('(' + articulos + ')');
            for (var i = 0; i < json.length; i++) {
                var fila = "<tr id='" + (i + 1) + "'>" +
                        "<td>" +
                        "<input readOnly class='form-control' type='text' id='referencia" + (i + 1) + "' name='referencia[]' required value='" + json[i].referencia + "'></input>" +
                        "</td>" +
                        "<td>" +
                        "<input readOnly class='form-control' type='text' value='" + json[i].nombre + "'></input>" +
                        "</td>" +
                        "<td>" +
                        "<input type='number' class='form-control' id='cantidad" + (i + 1) + "' name='cantidad[]' required value='" + json[i].cantidad + "'></input>" +
                        "</td>" +
                        "<td>" +
                        "<input type='number' class='form-control' id='costo" + (i + 1) + "' name='costo[]' required></input>" +
                        "</td>" +
                        "<td>" +
                        "<input type='number' class='form-control' id='precio" + (i + 1) + "' name='precio[]' required";
                if ((i + 1) == json.length)
                    fila += " onchange='aniadirFilaComparacion(" + (i + 1) + ")'";
                fila += "></input></td><td>" +
                        "<a class='btn btn-danger' onclick='borrarFilaComparacion(" + (i + 1) + ")'>Borrar</a>" +
                        "</td>" +
                        "</tr>";
                $("#cabecera").append(fila);
            }
            $.unblockUI();
        }
    });
}

function borrarFilaComparacion(fila) {
    $("#" + fila).remove();
}

function aniadirFilaComparacion(i) {
    var nombre = "nombre" + (i + 1);
    var cantidad = "cantidad" + (i + 1);
    $("#cabecera").append("<tr id='" + (i + 1) + "'>" +
            "<td>" +
            "<input class='form-control' type='text' id='referencia" + (i + 1) + "' name='referencia[]' onchange=\"cargarNombreArticuloComparacion(this, document.getElementById('" + nombre + "'), document.getElementById('" + cantidad + "'))\" ></input>" +
            "</td>" +
            "<td>" +
            "<input readOnly class='form-control' id='nombre" + (i + 1) + "' type='text'></input>" +
            "</td>" +
            "<td>" +
            "<input type='number' class='form-control' id='cantidad" + (i + 1) + "' name='cantidad[]'></input>" +
            "</td>" +
            "<td>" +
            "<input type='number' class='form-control' id='costo" + (i + 1) + "' name='costo[]'></input>" +
            "</td>" +
            "<td>" +
            "<input type='number' class='form-control' id='precio" + (i + 1) + "' name='precio[]' onchange='aniadirFilaComparacion(" + (i + 1) + ")'></input></td><td>" +
            "<a class='btn btn-danger' onclick='borrarFilaComparacion(" + (i + 1) + ")'>Borrar</a>" +
            "</td>" +
            "</tr>");
    document.getElementById("referencia" + (i + 1)).focus();
}

function enviarFormOcultoMasPedido(document, i) {
    codigo = document.getElementById("tabla").rows[i + 1].cells[0].innerHTML;
    proveedor = document.getElementById("tabla").rows[i + 1].cells[1].innerHTML;
    fecha = document.getElementById("tabla").rows[i + 1].cells[2].innerHTML;
    document.getElementById("codigo").value = codigo;
    document.getElementById("proveedor").value = proveedor;
    document.getElementById("fecha").value = fecha;
    document.getElementById("formOculto").submit();
}

function enviarFormOcultoComparacion(document, codigo) {
    document.getElementById("codigoComparacion").value = codigo;
    document.getElementById("formOcultoComparacion").submit();
}

function cargarSucursales() {
    $.blockUI();
    $.ajax({
        url: '/SIWAI/ControladorSucursal?cargarSucursales=true',
        type: 'post',
        datatype: 'json',
        success: function (sucursales) {
            var json = eval('(' + sucursales + ')');
            var combo = document.getElementById("sucursales");
            combo.options[0] = new Option('Seleccione', '');
            for (var i = 0; i < json.length; i++) {
                combo.options[combo.length] = new Option(json[i].nombre, json[i].codigo);
            }
            $.unblockUI();
        }
    });
}
