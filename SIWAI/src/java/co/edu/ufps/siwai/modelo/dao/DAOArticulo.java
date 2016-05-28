/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.dao;

import co.edu.ufps.siwai.modelo.dto.ArticuloDTO;
import co.edu.ufps.siwai.modelo.dao.fabrica.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Lenovo
 */
public class DAOArticulo {

    private Connection conn;

    /**
     * Este metodo se conecta con la base de datos para registrar los articulos
     *
     * @param dto DTO del articulo
     * @return true si pudo registrar el articulo ó false sino se pudo registrar
     * @throws Exception Conexión con la base de datos no pudo realizarse.
     */
    public boolean registrarArticulo(ArticuloDTO dto) throws Exception {
        boolean exito = false;
        conn = Conexion.generarConexion();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_articulo"
                    + " (refe_articulo, nom_articulo, tipo_articulo) values (?,?,?)");
            stmt.setString(1, dto.getReferencia());
            stmt.setString(2, dto.getNombre());
            stmt.setString(3, dto.getTipoArticulo());
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

    /**
     * Metodo que obtiene el nombre de un articulo.
     *
     * @param referencia String con la referencia del articulo.
     * @return String con el nombre del articulo.
     * @throws Exception Si existe un error en la conexion.
     */
    public String obtenerNombreArticulo(String referencia) throws Exception {
        conn = Conexion.generarConexion();
        String nombre = "";
        PreparedStatement stmt = conn.prepareStatement("SELECT nom_articulo"
                + " FROM tbl_articulo WHERE refe_articulo COLLATE utf8_bin=?");
        stmt.setString(1, referencia);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            nombre = rs.getString(1);
        }
        return nombre;
    }

    /**
     * Se encarga de buscar todos los articulos de la sucursal elejida y
     * referencia
     *
     * @param sucursal
     * @param buscarPor
     * @param informacion
     * @return
     */
    public ArrayList<ArticuloDTO> consultarArticulo(String sucursal, String buscarPor, String informacion) throws Exception {
        conn = Conexion.generarConexion();
        ArrayList<ArticuloDTO> lista = null;
        PreparedStatement stmt = null;
        if (conn != null) {
            String sql = "SELECT  tbl_sucursal.nom_sucursal, tbl_articulo.refe_articulo,tbl_articulo.nom_articulo, tbl_articulo.tipo_articulo, tbl_ArticuloSucursal.cant_artsuc,tbl_ArticuloSucursal.valor_artsuc"
                    + " FROM  tbl_articulo"
                    + " INNER JOIN  tbl_ArticuloSucursal ON  tbl_articulo.refe_articulo =  tbl_ArticuloSucursal.refe_artic_artsuc "
                    + "INNER JOIN  tbl_sucursal ON  tbl_sucursal.cod_sucursal =  tbl_ArticuloSucursal.cod_sucur_artsuc";
            String where = "Where";
            //Si selecciono todas las sucursales
            if (!sucursal.equalsIgnoreCase("todas")) {
                sql += " WHERE  '1' = '1' ";
                sucursal = "1";
            } else {
                sql += " WHERE  tbl_sucursal.nom_sucursal = '"+sucursal+"'";
                
            }
            //Si seleccinó todos en buscar por
            if (buscarPor.equalsIgnoreCase("todos")) {
                sql += "AND '1' = ?";
                informacion="1";
            }else if(buscarPor.equalsIgnoreCase("tipo")){
                sql+=" AND tbl_articulo.tipo_articulo = '"+informacion+"'";
            }
            else if(buscarPor.equalsIgnoreCase("referencia")){
                sql+=" AND tbl_articulo.refe_articulo = '"+informacion+"'";
            }
            else if(buscarPor.equalsIgnoreCase("nombre")){
                sql+=" AND tbl_articulo.nom_articulo = '"+informacion+"'";
            }
            sql+=" ;";
            System.out.println(sql);
            
            stmt = conn.prepareStatement(sql);
            
            //stmt.setString(1, sucursal);
            //stmt.setString(2, informacion);
            
            try{
                ResultSet rs=stmt.executeQuery();
                lista=new ArrayList<>();
                while(rs.next()){
                    ArticuloDTO art=new ArticuloDTO();
                    art.setReferencia(rs.getString(2));
                    art.setNombre(rs.getString(3));
                    art.setTipoArticulo(rs.getString(4));
                    lista.add(art);
                }
            }
            catch (SQLException ex) {
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
