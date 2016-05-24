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
    document.getElementById("formOculto").action="mas.jsp";
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

function enviarFormOcultoEmpleadoActualizar(document, i, codigo,apellido, telefono, email, direccion, habilitado, contraseña) {
    sucursal = document.getElementById("tablaE").rows[i + 1].cells[2].innerHTML;
    cargo = document.getElementById("tablaE").rows[i + 1].cells[3].innerHTML;
    dni = document.getElementById("tablaE").rows[i + 1].cells[0].innerHTML;
    nombre = document.getElementById("tablaE").rows[i + 1].cells[1].innerHTML;
    celular = document.getElementById("tablaE").rows[i + 1].cells[6].innerHTML;
    fIngreso = document.getElementById("tablaE").rows[i + 1].cells[4].innerHTML;
    document.getElementById("formOculto").action="actualizar.jsp";
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
    document.getElementById("form-oculto").action="mas.jsp";
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
    document.getElementById("form-oculto").action="actualizar.jsp";
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
var a = 2;
function añadirFila()
{
    var table = document.getElementById("table");
    var codigo = "codigo" + a;
    var nombre = "nombre" + a;
    var cantidad = "cantidad" + a;
    var row = table.insertRow(a);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var campo1 = document.createElement("input");
    campo1.type = "text";
    campo1.required = true;
    campo1.setAttribute("onkeypress", "chequearEnter2(event, document.getElementById('" + nombre + "'), this,document.getElementById('" + cantidad + "'))");
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
    campo3.name = "cantidad[]";
    campo3.setAttribute("onkeypress", "chequearEnter(event)");
    campo3.id = cantidad;
    campo3.className = "form-control";
    cell3.appendChild(campo3);

    var campo4 = document.createElement("button");
    campo4.innerHTML = "Borrar";
    campo4.className = "btn btn-success";
    campo4.onclick = function ()
    {
        myDeleteFunction(table, this.parentNode.parentNode.rowIndex, 1);
    };
    cell4.appendChild(campo4);
    a++;
}
var b = 2;
function añadirFila2()
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
    campo5.onclick = function ()
    {
        myDeleteFunction(table, this.parentNode.parentNode.rowIndex, 2)
    };
    cell5.appendChild(campo5);
    b++;

}

function myDeleteFunction(element, c, num) {
    //element.deleteRow(c);
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
        document.form.informacion.readOnly = true;
        document.form.informacion.required = false;
        document.form.informacion.value = "";
    } else {
        document.form.informacion.readOnly = false;
        document.form.informacion.required = true;
    }
}
