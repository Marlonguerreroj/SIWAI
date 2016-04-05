/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.fachada;

import co.edu.ufps.siwai.modelo.mysql.dto.ClienteDTO;
import co.edu.ufps.siwai.modelo.mysql.dao.DAOCliente;
import co.edu.ufps.siwai.modelo.mysql.dao.DAOEmpleado;
import co.edu.ufps.siwai.modelo.mysql.dao.DAOProveedor;
import co.edu.ufps.siwai.modelo.mysql.dao.DAOSucursal;
import co.edu.ufps.siwai.modelo.mysql.dto.EmpleadoDTO;
import co.edu.ufps.siwai.modelo.mysql.dto.ProveedorDTO;
import co.edu.ufps.siwai.modelo.mysql.dto.SucursalDTO;
import java.util.ArrayList;

/**
 * Clase que sirve como fachada del negocio.
 *
 * @author Alejandro Ramírez
 */
public class Fachada {

    /**
     * Metodo que envia los datos del cliente a DAOCliente para que sean registrados
     * en la base de datos.
     * @param dni Documento nacional de identificación del cliente.
     * @param nombre Nombres del cliente.
     * @param apellido Apellidos del cliente.
     * @param direccion Direccion de residencia del cliente.
     * @param email Correo electronico del cliente.
     * @param telefono Telefono o celular del cliente.
     * @return True si el cliente fue registrado, false si no se registro.
     * @throws java.lang.Exception Excepcion en la conexion a la base de datos.
     */
    public boolean registrarCliente(String dni, String nombre, String apellido,
            String direccion, String email, int telefono) throws Exception {
        ClienteDTO dto = new ClienteDTO(dni, nombre, apellido, direccion, email, telefono);
        DAOCliente dao = new DAOCliente();
        return dao.registrarCliente(dto);
    }

    /**
     * Metodo que solicita a DAOCliente la consulta de los datos de los clientes.
     * @param columna Nombre de la columna de la tabla de clientes.
     * @param informacion Contenido que debe cumplir la columna por la que se
     * busca a los clientes (nom, dni o Todos).
     * @return ArrayList de ClienteDTO.
     * @throws Exception Exception originada por fallo en la conexion
     * o error al consultar los clientes.
     */
    public ArrayList<ClienteDTO> consultarClientes(String columna, String informacion) throws Exception{
        DAOCliente dao = new DAOCliente();
        return dao.consultarClientes(columna, informacion);
    }
    
    public boolean registrarSucursal(String codigo, String nombre, int telefono, String email,
            String paginaWeb, String direccion, String ciudad, String pais) throws Exception{
        SucursalDTO dto = new SucursalDTO(codigo, nombre, email, paginaWeb, direccion, ciudad,
                pais, telefono);
        DAOSucursal dao = new DAOSucursal();
        return dao.registrarSucursal(dto);
    }

    public ArrayList<SucursalDTO> consultarSucursal(String buscarPor, String informacion) throws Exception {
        DAOSucursal dao = new DAOSucursal();
        return dao.consultarSucursal(buscarPor, informacion);
    }

    public boolean actualizarSucursal(String codigo, String nombre, int telefono, String email,
            String paginaWeb, String direccion, String ciudad, String pais) {
        boolean exito = false;
        SucursalDTO dto = new SucursalDTO(codigo, nombre, email, paginaWeb, direccion,
                ciudad, pais, telefono);
        DAOSucursal dao = new DAOSucursal();
        try {
            if (dao.actualizarSucursal(dto)) {
                exito = true;
            }
        } catch (Exception ex) {
        }
        return exito;
    }

    public boolean registrarEmpleado(String codigo, String dni, String nombre, String apellido,
            String telefono, String celular, String contraseña, String email, String direccion,
            String fIngreso, String cargo, String sucursal)throws Exception {
        EmpleadoDTO dto = new EmpleadoDTO(codigo, dni, nombre, apellido, contraseña, email,
                direccion, cargo, sucursal, telefono, celular, fIngreso);
        DAOEmpleado dao = new DAOEmpleado();
        return dao.registrarEmpleado(dto);
    }
    
    public ArrayList<EmpleadoDTO> consultarEmpleado(String buscarPor, String informacion)throws Exception {
        DAOEmpleado dao = new DAOEmpleado();
        return dao.consultarEmpleado(buscarPor, informacion);
    }
    
    public boolean iniciarSesion(String usuario,String contraseña){
        boolean ingreso = false;
        DAOEmpleado dao = new DAOEmpleado();
        int resultado = dao.iniciarSesion(usuario, contraseña);
            if(resultado == 1){
                ingreso = true;
            }
        return ingreso;
    }
    
    /**
     * Metodo que envia la peticion a DAOProveedor para registrar un proveedor.
     * @param codigo Codigo del proveedor.
     * @param nit Nit del proveedor.
     * @param nombre Nombre del proveedor.
     * @param cuenta Cuenta del proveedor.
     * @param tipoCuenta Tipo de cuenta del proveedor.
     * @param sitioWeb URL del Sito Web del proveedor.
     * @param nombreContacto Nombre de la persona que sirve de intermediario con el proveedor.
     * @param emailContacto Email del contacto.
     * @param numCuenta Numero de cuenta del proveedor.
     * @param telContacto Telefono del contacto.
     * @return True si se registro exitosamente, False si existe otro proveedor con el mismo codigo.
     * @throws java.lang.Exception Si existe error en la conexion a la base de datos.
     */
    public boolean registrarProveedor(String codigo, String nit, String nombre, 
            String cuenta, String tipoCuenta, String sitioWeb, String nombreContacto, 
            String emailContacto, int numCuenta, int telContacto) throws Exception {
        ProveedorDTO dto = new ProveedorDTO(codigo, nit, nombre, cuenta, 
                tipoCuenta, sitioWeb, nombreContacto, emailContacto, numCuenta, telContacto);
        DAOProveedor dao = new DAOProveedor();
        return dao.registrarProveedor(dto);
    }
    
    /**
     * Metodo que envia la peticion a DAOProveedor para consultar proveedores.
     * @param columna String que contiene la columna por la que se va a filtrar.
     * @param info Strinf con la informacion que debe cumplir la columna.
     * @return ArrayList de ProveedorDTO.
     * @throws Exception Si existe un error en la conexion a la base de datos.
     */
    public ArrayList<ProveedorDTO> consultarProveedores (String columna, String info) throws Exception{
        DAOProveedor dao = new DAOProveedor();
        return dao.consultarProveedores(columna, info);
    }
}

