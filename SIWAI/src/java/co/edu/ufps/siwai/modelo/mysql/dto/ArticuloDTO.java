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
public class ArticuloDTO implements Serializable{
    private String referencia, nombre, tipoArticulo;

    public ArticuloDTO() {
    }

    public ArticuloDTO(String referencia, String nombre, String tipoArticulo) {
        this.referencia = referencia;
        this.nombre = nombre;
        this.tipoArticulo = tipoArticulo;
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
    
}
