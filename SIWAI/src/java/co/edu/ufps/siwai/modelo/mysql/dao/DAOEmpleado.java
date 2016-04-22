/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.mysql.dao;

import co.edu.ufps.siwai.modelo.utilidades.fabrica.Conexion;
import co.edu.ufps.siwai.modelo.mysql.dto.EmpleadoDTO;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author MarlonGuerrero
 */
public class DAOEmpleado {

    private Connection conn;

    /**
     * Metodo que se conecta a la base de datos y registra los datos de un
     * empleado.
     *
     * @param dto EmpleadoDTO con los datos de un empleado.
     * @return true si se registro, false si no lo hizo.
     * @throws java.lang.Exception Exception originada por fallo en la conexion
     * o error al insertar la sucursal.
     */
    public boolean registrarEmpleado(EmpleadoDTO dto) throws Exception {
        boolean exito = false;
        conn = Conexion.generarConexion();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_empleado"
                    + "(cod_empleado, dni_empleado, nom_empleado, ape_empleado, tel_empleado,"
                    + "cel_empleado, cont_empleado, email_empleado, dir_empleado, fIngreso_empleado,"
                    + "suc_empleado, cargo_empleado)"
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            stmt.setString(1, dto.getCodigo());
            stmt.setString(2, dto.getDni());
            stmt.setString(3, dto.getNombre());
            stmt.setString(4, dto.getApellido());
            stmt.setString(5, dto.getTelefono());
            stmt.setString(6, dto.getCelular());
            stmt.setString(7, dto.getContraseña());
            stmt.setString(8, dto.getEmail());
            stmt.setString(9, dto.getDireccion());
            stmt.setString(10, dto.getfIngreso());
            stmt.setString(11, dto.getSucursal());
            stmt.setString(12, dto.getCargo());

            try {
                exito = stmt.executeUpdate() > 0;
            } catch (SQLException ex) {
                return false;
            } finally {
                conn.close();
                stmt.close();
            }
        }
        return exito;
    }

    public ArrayList<EmpleadoDTO> consultarEmpleado(String buscarPor, String informacion) throws Exception {
        conn = Conexion.generarConexion();
        ArrayList<EmpleadoDTO> lista = null;
        PreparedStatement stmt = null;
        if (conn != null) {

            if (buscarPor.equalsIgnoreCase("Codigo")) {
                stmt = conn.prepareStatement("SELECT * FROM tbl_empleado "
                        + "WHERE cod_empleado = ?");
                stmt.setString(1, informacion);
            } else if (buscarPor.equalsIgnoreCase("Sucursal")) {
                stmt = conn.prepareStatement("SELECT * FROM tbl_empleado "
                        + "WHERE suc_empleado = ?");
                stmt.setString(1, informacion);
            } else if (buscarPor.equalsIgnoreCase("Todos")) {
                stmt = conn.prepareStatement("SELECT * FROM tbl_empleado");
            } else if (buscarPor.equalsIgnoreCase("Nombre")) {
                stmt = conn.prepareStatement("SELECT * FROM tbl_empleado "
                        + "WHERE nom_empleado = ?");
                stmt.setString(1, informacion);
            } else if (buscarPor.equalsIgnoreCase("Dni")) {
                stmt = conn.prepareStatement("SELECT * FROM tbl_empleado "
                        + "WHERE dni_empleado = ?");
                stmt.setString(1, informacion);
            }

            try {
                ResultSet rs = stmt.executeQuery();
                lista = new ArrayList<>();
                while (rs.next()) {
                    EmpleadoDTO dto = new EmpleadoDTO();
                    dto.setCodigo(rs.getString(1));
                    dto.setDni(rs.getString(2));
                    dto.setNombre(rs.getString(3));
                    dto.setApellido(rs.getString(4));
                    dto.setTelefono(rs.getString(5));
                    dto.setCelular(rs.getString(6));
                    dto.setContraseña(rs.getString(7));
                    dto.setEmail(rs.getString(8));
                    dto.setDireccion(rs.getString(9));
                    dto.setfIngreso(rs.getString(10));
                    dto.setSucursal(rs.getString(11));
                    dto.setCargo(rs.getString(12));
                    dto.setfSalida(rs.getString(13));
                    dto.setHabilitado(rs.getShort(14));
                    lista.add(dto);
                }
                stmt.close();

            } catch (SQLException ex) {

            } finally {
                try {
                    conn.close();
                } catch (SQLException ex) {

                }
            }
        }
        return lista;
    }

    public String iniciarSesion(String usuario, String contraseña) throws Exception {
        String resultado = "nulo";
        try {
            conn = Conexion.generarConexion();
            CallableStatement stmt = conn.prepareCall("{?=call iniciarSesion(?, ?)}");
            stmt.registerOutParameter(1, Types.VARCHAR);
            stmt.setString(2, usuario);
            stmt.setString(3, contraseña);
            stmt.execute();
            resultado = stmt.getString(1);
            stmt.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.toString());
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
        return resultado;
    }
}
