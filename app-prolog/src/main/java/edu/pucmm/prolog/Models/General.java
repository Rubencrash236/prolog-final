package edu.pucmm.prolog.Models;

public class General {
    private float capaital;
    private String fecha;
    private String ubicacion;
    private String actividad;

    public General(float capaital, String fecha, String ubicacion, String actividad) {
        this.capaital = capaital;
        this.fecha = fecha;
        this.ubicacion = ubicacion;
        this.actividad = actividad;
    }

    public General() {
    }

    public float getCapaital() {
        return capaital;
    }

    public void setCapaital(float capaital) {
        this.capaital = capaital;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
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
