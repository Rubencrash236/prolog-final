package edu.pucmm.prolog.Models;

public class Hiking {
    private String nombre;
    private String sitio;

    public Hiking(String nombre, String sitio) {
        this.nombre = nombre;
        this.sitio = sitio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getSitio() {
        return sitio;
    }

    public void setSitio(String sitio) {
        this.sitio = sitio;
    }
}
