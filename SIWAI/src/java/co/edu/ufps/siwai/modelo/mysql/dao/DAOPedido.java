/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.mysql.dao;

import co.edu.ufps.siwai.modelo.mysql.dto.ArticuloDTO;
import co.edu.ufps.siwai.modelo.mysql.dto.PedidoDTO;
import co.edu.ufps.siwai.modelo.utilidades.fabrica.Conexion;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

/**
 * Clase de acceso a los datos de la tabla pedido y articulo_pedido
 * @author Alejandro Ramírez
 */
public class DAOPedido {
    
    private Connection conn;
    
    /**
     * Metodo que registra un pedido junto con los articulos del pedido.
     * @param dto PedidoDTO con los datos del pedido y los articulos del pedido.
     * @return True si se registro todo, false si algo no se registro.
     * @throws Exception Excepcion al conectarse a la base de datos.
     */
    public boolean registrarPedido(PedidoDTO dto) throws Exception {
        boolean exito;
        conn = Conexion.generarConexion();
        PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_pedido "
                + "cod_proveedor, fecha_pedido, cant_art_pedido, cant_unidades_pedido "
                + "values (?, ?, ?, ?)");
        stmt.setString(1, dto.getProveedor().getCodigo());
        stmt.setDate(2, new Date(dto.getFecha().getTimeInMillis()));
        stmt.setInt(3, dto.getArticulos().size());
        stmt.setInt(4, dto.obtenerCantidadesArticulos());
        exito = stmt.executeUpdate() > 0;
        stmt = conn.prepareStatement("SELECT @@identity FROM tbl_pedido");
        int codigo = stmt.executeQuery().getInt(1);
        stmt = conn.prepareStatement("INSERT INTO tbl_articulo_pedido "
                + "cod_pedido, refe_articulo, cantidad_articulo_pedido"
                + "values (?, ?, ?)");
        for (ArticuloDTO articulo : dto.getArticulos()) {
            stmt.setInt(1, codigo);
            stmt.setString(2, articulo.getReferencia());
            stmt.setInt(3, articulo.getCantidad());
            exito = stmt.executeUpdate() > 0;
        }
        stmt.close();
        conn.close();
        return exito;
    }
}
