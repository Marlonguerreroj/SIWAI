<?php

require_once 'Dao/DaoEmpleado.php';
require_once 'Dao/DaoCliente.php';
require_once 'Dao/DaoSucursal.php';
require_once 'Dao/DaoProveedor.php';
require_once 'Dto/EmpleadoDTO.php';
require_once 'Dto/ClienteDTO.php';
require_once 'Dto/SucursalDTO.php';
require_once 'Dto/ProveedorDTO.php';

class Fachada {

    public function IniciarSesion($id, $contraseña) {
        $DaoEmpleado = new DaoEmpleado();
        $DTOEmpleado = new EmpleadoDTO();
        $DTOEmpleado->setCodigo($id);
        $DTOEmpleado->setContraseña($contraseña);
        $valor = $DaoEmpleado->IniciarSesion($DTOEmpleado);
        return $valor;
    }

    public function registrarEmpleado($codigo, $dni, $celular, $nSegSocial, $fIngreso, $contraseña, $tipoEmpleado) {
        $DaoEmpleado = new DaoEmpleado();
        $DTOEmpleado = new EmpleadoDTO();
        $DTOEmpleado->setCodigo($codigo);
        $DTOEmpleado->setDni($dni);
        $DTOEmpleado->setCelular($celular);
        $DTOEmpleado->setNSegSocial($nSegSocial);
        $DTOEmpleado->setFIngreso($fIngreso);
        $DTOEmpleado->setContraseña($contraseña);
        $DTOEmpleado->setTipoEmpleado($tipoEmpleado);
        $valor = $DaoEmpleado->RegistrarEmpleado($DTOEmpleado);
        return $valor;
    }

    public function registrarCliente($dni, $nombre, $apellido, $direccion, $telefono, $email) {
        $DaoCliente = new DaoCliente();
        $DTOCliente = new ClienteDTO();
        $DTOCliente->setDni($dni);
        $DTOCliente->setNombre($nombre);
        $DTOCliente->setApellido($apellido);
        $DTOCliente->setDireccion($direccion);
        $DTOCliente->setTelefono($telefono);
        $DTOCliente->setEmail($email);
        $valor = $DaoCliente->RegistrarCliente($DTOCliente);
        return $valor;
    }

    public function registrarSucursal($codigo, $nombre, $telefono, $email, $pagina, $direccion, $ciudad, $pais) {
        $DaoSucursal = new DaoSucursal();
        $DTOSucursal = new SucursalDTO();
        $DTOSucursal->setCodigo($codigo);
        $DTOSucursal->setNombre($nombre);
        $DTOSucursal->setTelefono($telefono);
        $DTOSucursal->setEmail($email);
        $DTOSucursal->setPagina($pagina);
        $DTOSucursal->setDireccion($direccion);
        $DTOSucursal->setCiudad($ciudad);
        $DTOSucursal->setPais($pais);
        $valor = $DaoSucursal->registrarSucursal($DTOSucursal);
        return $valor;
    }

    public function registrarProveedor($codigo, $nit, $nombre, $pagina, $telefono, $cuentaBancaria, $nCuentaBancaria, $nombreContacto, $email) {
        $DaoProveedor = new DaoProveedor();
        $DTOProveedor = new ProveedorDTO();
        $DTOProveedor->setCodigo($codigo);
        $DTOProveedor->setNit($nit);
        $DTOProveedor->setNombre($nombre);
        $DTOProveedor->setPagina($pagina);
        $DTOProveedor->setTelefono($telefono);
        $DTOProveedor->setCuentaBancaria($cuentaBancaria);
        $DTOProveedor->setNCuentaBancaria($nCuentaBancaria);
        $DTOProveedor->setNombreContacto($nombreContacto);
        $DTOProveedor->setEmail($email);
        $valor = $DaoProveedor->registrarProveedor($DTOProveedor);
        return $valor;
    }
    
    public function buscarSucursal($tipo,$informacion){
        $DaoSucursal = new DaoSucursal();
        $DTOSucursal = new SucursalDTO();
        $DTOSucursal->setTipo($tipo);
        $DTOSucursal->setInformacion($informacion);
        $valor = $DaoSucursal->buscarSucursal($DTOSucursal);
        return $valor;
    }
    public function buscarCliente($tipo,$informacion){
        $DaoCliente = new DaoCliente();
        $DTOCliente = new ClienteDTO();
        $DTOCliente->setTipo($tipo);
        $DTOCliente->setInformacion($informacion);
        $valor = $DaoCliente->buscarCliente($DTOCliente);
        return $valor;
    }
    public function buscarProveedor($tipo,$informacion){
        $DaoProveedor = new DaoProveedor();
        $DTOProveedor = new ProveedorDTO();
        $DTOProveedor->setTipo($tipo);
        $DTOProveedor->setInformacion($informacion);
        $valor = $DaoProveedor->buscarProveedor($DTOProveedor);
        return $valor;
    }
    public function buscarEmpleado($tipo,$informacion){
        $DaoEmpleado = new DaoEmpleado();
        $DTOEmpleado = new EmpleadoDTO();
        $DTOEmpleado->setTipo($tipo);
        $DTOEmpleado->setInformacion($informacion);
        $valor = $DaoEmpleado->buscarEmpleado($DTOEmpleado);
        return $valor;
    }
    
    public function actualizarSucursal($codigo,$nombre,$telefono,$email,$pagina,$direccion,$ciudad,$pais){
        $DaoSucursal = new DaoSucursal();
        $DTOSucursal = new SucursalDTO();
        $DTOSucursal->setCodigo($codigo);
        $DTOSucursal->setNombre($nombre);
        $DTOSucursal->setTelefono($telefono);
        $DTOSucursal->setEmail($email);
        $DTOSucursal->setPagina($pagina);
        $DTOSucursal->setDireccion($direccion);
        $DTOSucursal->setCiudad($ciudad);
        $DTOSucursal->setPais($pais);
        $valor = $DaoSucursal->actualizarSucursal($DTOSucursal);
        return $valor;
    }
    
}
