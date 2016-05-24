/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.mysql.dao;

import co.edu.ufps.siwai.modelo.mysql.dto.ArticuloExtraDTO;
import co.edu.ufps.siwai.modelo.utilidades.fabrica.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author MarlonGuerrero
 */
public class DAOArticuloExtra {
    private Connection conn;

    public boolean registrarArticuloExtra(ArticuloExtraDTO dto) throws Exception {
        boolean exito = false;
        conn = Conexion.generarConexion();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_articuloExtra "
                    + "(cod_articulo_extra,cod_sucu_articulo_extra,	nombre_articulo_extra,valor_articulo_extra, "
                    + "cantidad_articulo_extra, notas_articulo_extra, fEntrada_articulo_extra,costo_articulo_extra)"
                    + " values (?, ?, ?, ?, ?, ?, ?)");
            stmt.setString(1, dto.getCodigo());
            stmt.setString(2, dto.getSucursal().getCodigo());
            stmt.setString(3, dto.getNombre());
            stmt.setInt(4, dto.getValor());
            stmt.setInt(5, dto.getCantidad());
            stmt.setString(6, dto.getNotas());
            stmt.setString(7, dto.getfEntrada());
            stmt.setInt(8, dto.getCosto());

            try {
                exito = stmt.executeUpdate() > 0;
            } catch (SQLException ex) {

            } finally {
                conn.close();
                stmt.close();
            }
        }
        return exito;
    }

    public ArrayList<ArticuloExtraDTO> consultarArticuloExtra(String sucursal,String buscarPor, String informacion) throws Exception {
        conn = Conexion.generarConexion();
        ArrayList<ArticuloExtraDTO> lista = null;
        PreparedStatement stmt = null;
        if (conn != null) {
            String sentencia = "WHERE";
            String sql = "SELECT * FROM tbl_articuloExtra ";
            if(!sucursal.equalsIgnoreCase("Todas")){
              sql += " WHERE cod_sucu_articulo_extra = ? ";
              sentencia = "AND";
            }
            if (buscarPor.equalsIgnoreCase("Codigo")) {
                sql += sentencia+" cod_sucu_articulo_extra = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, informacion);
            } else if (buscarPor.equalsIgnoreCase("Nombre")) {
                sql += sentencia+" nombre_articulo_extra = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, informacion);
            } else if (buscarPor.equalsIgnoreCase("Todos")) {
                stmt = conn.prepareStatement(sql);
            }

            try {
                ResultSet rs = stmt.executeQuery();
                lista = new ArrayList<>();
                while (rs.next()) {
                    ArticuloExtraDTO dto = new ArticuloExtraDTO();
                    dto.setCodigo(rs.getString(1));
                    dto.getSucursal().setCodigo(rs.getString(2));
                    dto.setNombre(rs.getString(3));
                    dto.setValor(rs.getInt(4));
                    dto.setCantidad(rs.getInt(5));
                    dto.setNotas(rs.getString(6));
                    dto.setfEntrada(rs.getString(7));
                    dto.setCosto(rs.getInt(8));                    
                    lista.add(dto);

                }
                stmt.close();

            } catch (SQLException ex) {
                ex.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException ex) {

                }
            }
        }
        return lista;
    }
}
