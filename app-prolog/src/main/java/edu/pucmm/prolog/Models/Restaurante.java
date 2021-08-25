package edu.pucmm.prolog.Models;

public class Restaurante {
    private String nombre;
    private String ubicacion;
    private String tipoComida;
    private String tipoPrecio;
    private String puntuacion;

    public Restaurante(String nombre, String ubicacion, String tipoComida, String tipoPrecio, String puntuacion) {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.tipoComida = tipoComida;
        this.tipoPrecio = tipoPrecio;
        this.puntuacion = puntuacion;
    }

    public String getNombre() {
        return nombre;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public String getTipoComida() {
        return tipoComida;
    }

    public String getTipoPrecio() {
        return tipoPrecio;
    }


    public String getPuntuacion() {
        return puntuacion;
    }
}
