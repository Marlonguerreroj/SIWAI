/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.dto;

import java.io.Serializable;
import java.util.Calendar;
import java.util.TreeSet;

/**
 * Clase de transferencia de datos de los pedidos.
 * @author Alejandro Ramírez
 */
public class PedidoDTO implements Serializable {
    
    private Calendar fecha;
    private int codigo;
    private ProveedorDTO proveedor;
    private final TreeSet<ArticuloDTO> articulos;

    /**
     * Constructor, inicializa los atributos proveedor y articulos.
     * @param fecha Calendar con la fecha en la que se realizo el pedido.
     * @param codProveedor Codigo del proveedor al que se le realizo el pedido.
     */
    public PedidoDTO(Calendar fecha, String codProveedor) {
        proveedor = new ProveedorDTO();
        articulos = new TreeSet<>();
        this.fecha = fecha;
        proveedor.setCodigo(codProveedor);
    }

    /**
     * Constructor, inicializa los atributos proveedor y articulos.
     */
    public PedidoDTO() {
        proveedor = new ProveedorDTO();
        articulos = new TreeSet<>();
    }

    public Calendar getFecha() {
        return fecha;
    }

    public void setFecha(Calendar fecha) {
        this.fecha = fecha;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public ProveedorDTO getProveedor() {
        return proveedor;
    }

    public void setProveedor(ProveedorDTO proveedor) {
        this.proveedor = proveedor;
    }

    public TreeSet<ArticuloDTO> getArticulos() {
        return articulos;
    }

    /**
     * Metodo que añade un articulo al TreeSet de ArticuloDTO
     * @param dto ArticuloDTO con los datos del articulo.
     * @return True si se añadio, false si existe otro con la misma referencia.
     */
    public boolean aniadirArticulo(ArticuloDTO dto) {
        return this.articulos.add(dto);
    }
    
    /**
     * Metodo que remueve un articulo del TreeSet de ArticuloDTO
     * @param dto ArticuloDTO con los datos del articulo.
     * @return True si se removio, false si no lo hizo.
     */
    public boolean eliminarArticulo(ArticuloDTO dto) { 
        return this.articulos.remove(dto);
    }
    
    /**
     * Metodo que obtiene la cantidad total que se pide de todos los articulos.
     * @return Integer con la cantidad total de articulos.
     */
    public int obtenerCantidadesArticulos(){
        int total = 0;
        for(ArticuloDTO dto : articulos) {
            total += dto.getCantidad();
        }
        return total;
    }
    
}