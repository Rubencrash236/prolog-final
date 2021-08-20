package edu.pucmm.prolog.Models;

public class General {
    private String ubicacion;
    private String actividad;

    public General( String ubicacion, String actividad) {
        this.ubicacion = ubicacion;
        this.actividad = actividad;
    }

    public General() {
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }
}
