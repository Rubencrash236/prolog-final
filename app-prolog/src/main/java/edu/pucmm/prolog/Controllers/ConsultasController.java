package edu.pucmm.prolog.Controllers;

import io.javalin.Javalin;

import java.util.HashMap;
import java.util.Map;
import org.jpl7.*;

public class ConsultasController {
    private Javalin app;

    public ConsultasController(Javalin app) {
        this.app = app;
    }

    public void applyRoutes(){

        app.get("/",ctx -> {
            ctx.redirect("consultar");
        });

        app.get("/consultar",ctx -> {
            Map<String, Object> model = new HashMap<>();

            ctx.render("/Public/html/Consulta.html",model);
        });
    }
}
