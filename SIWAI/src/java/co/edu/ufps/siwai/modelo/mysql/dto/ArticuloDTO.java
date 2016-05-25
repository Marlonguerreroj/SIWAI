/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.modelo.mysql.dto;

import java.io.Serializable;

/**
 *
 * @author Lenovo
 */
public class ArticuloDTO implements Serializable, Comparable<ArticuloDTO>{
    
    private String referencia, nombre, tipoArticulo;
    private int cantidad;

    public ArticuloDTO() {
    }

    public ArticuloDTO(String referencia, String nombre, String tipoArticulo) {
        this.referencia = referencia;
        this.nombre = nombre;
        this.tipoArticulo = tipoArticulo;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCantidad() {
        return cantidad;
    }

    public String getReferencia() {
        return referencia;
    }

    public void setReferencia(String referencia) {
        this.referencia = referencia;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoArticulo() {
        return tipoArticulo;
    }

    public void setTipoArticulo(String tipoArticulo) {
        this.tipoArticulo = tipoArticulo;
    }

    /**
     * Implementacion de compareTo, compara en base a las referencias de los articulos.
     * @param dto ArticuloDTO a comparar.
     * @return 0 si son iguales, 1 si la cadena uno es mayor que la dos o 2 si la cadena uno es menor que la dos.
     */
    @Override
    public int compareTo(ArticuloDTO dto) {
        return this.getReferencia().compareTo(dto.getReferencia());
    }
    
}