/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.dao;

import co.edu.ufps.siwai.modelo.dao.fabrica.Conexion;
import co.edu.ufps.siwai.modelo.dto.ArticuloDTO;
import co.edu.ufps.siwai.modelo.dto.VentaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author MarlonGuerrero
 */
public class DAOVenta {

    private Connection conn;

    public boolean registrarVenta(VentaDTO dto) throws Exception {
        boolean exito = false;
        conn = Conexion.generarConexion();
        if (conn != null) {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO tbl_factura "
                    + "(cod_sucu_factura, DNI_cliente_factura, cod_cajero_factura,cod_vendedor_factura,	fecha_factura,sub_total_factura,	IVA_factura,valor_total_factura) "
                    + " values (?, ?, ?, ? , ?, ?, ?, ?)");
            stmt.setString(1, dto.getSucursal().getCodigo());
            stmt.setString(2, dto.getCliente().getDni());
            stmt.setString(3, dto.getCajero().getCodigo());
            stmt.setString(4, dto.getVendedor().getCodigo());
            stmt.setDate(5, new java.sql.Date(dto.getFecha().getTimeInMillis()));
            stmt.setInt(6, dto.getSubTotal());
            stmt.setDouble(7, dto.getIva());
            stmt.setDouble(8, dto.getTotal());
            exito = stmt.executeUpdate() > 0;
            stmt = conn.prepareStatement("SELECT LAST_INSERT_ID()");
            ResultSet rs = stmt.executeQuery();
            int codigo = 0;
            while (rs.next()) {
                codigo = rs.getInt(1);
            }
            for (ArticuloDTO articulo : dto.getArticulos()) {
                stmt = conn.prepareStatement("INSERT INTO tbl_articulo_factura "
                        + "(cod_fac_artfac, refe_art_artfac, 	cant_artfac,valor_unitario_artfac)"
                        + "values (?, ?, ?, ?)");
                stmt.setInt(1, codigo);
                stmt.setString(2, articulo.getReferencia());
                stmt.setInt(3, articulo.getCantidad());
                stmt.setInt(4, articulo.getValor());
                exito = stmt.executeUpdate() > 0;
                stmt = conn.prepareStatement("UPDATE tbl_ArticuloSucursal SET cant_artsuc=cant_artsuc- ? "+
                "WHERE refe_artic_artsuc = ? AND cod_sucur_artsuc = ?");
                stmt.setInt(1,articulo.getCantidad());
                stmt.setString(2, articulo.getReferencia());
                stmt.setString(3,dto.getSucursal().getCodigo());
                stmt.executeUpdate();
            }

            stmt.close();
            conn.close();
            return exito;
        }
        return exito;
    }

}
