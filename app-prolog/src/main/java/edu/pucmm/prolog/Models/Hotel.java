package edu.pucmm.prolog.Models;

public class Hotel {
    private String nombre;
    private String ubicacion;
    private String puntuacion;
    private String estrellas;
    private String tPrecio;
    private String servicios;

    public Hotel(String nombre,String ubicacion, String puntuacion, String estrellas, String tPrecio, String servicios) {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.puntuacion = puntuacion;
        this.estrellas = estrellas;
        this.tPrecio = tPrecio;
        this.servicios = servicios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public void setPuntuacion(String puntuacion) {
        this.puntuacion = puntuacion;
    }

    public void setEstrellas(String estrellas) {
        this.estrellas = estrellas;
    }

    public void settPrecio(String tPrecio) {
        this.tPrecio = tPrecio;
    }

    public void setServicios(String servicios) {
        this.servicios = servicios;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public String getPuntuacion() {
        return puntuacion;
    }

    public String getEstrellas() {
        return estrellas;
    }

    public String gettPrecio() {
        return tPrecio;
    }

    public String getServicios() {
        return servicios;
    }
}
