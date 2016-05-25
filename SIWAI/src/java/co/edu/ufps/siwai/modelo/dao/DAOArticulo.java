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
import java.sql.SQLException;

/**
 *
 * @author Lenovo
 */
public class DAOArticulo {
    private Connection conn;
    
    /**
     * Este metodo se conecta con la ase de datos para registrar los 
     * articulos
     * @param dto DTO del articulo
     * @return true si pudo registrar el articulo ó false sino se pudo registrar
     * @throws Exception Conexión con la base de datos no pudo realizarse.
     */
    public boolean registrarArticulo(ArticuloDTO dto) throws  Exception{
        boolean exito=false;
        conn=Conexion.generarConexion();
        if(conn!=null)
        {
            PreparedStatement stmt=conn.prepareStatement("INSERT INTO tbl_articulo"
                        + " (refe_articulo, nom_articulo, tipo_articulo) values (?,?,?)");
            stmt.setString(1, dto.getReferencia());
            stmt.setString(2, dto.getNombre());
            stmt.setString(3, dto.getTipoArticulo());
            try{
                exito=stmt.executeUpdate()>0;
            }catch(SQLException ex)
            {
            }finally{
                conn.close();
                stmt.close();
            }
        }
        return exito;
    }
}
