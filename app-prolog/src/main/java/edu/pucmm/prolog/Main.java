package edu.pucmm.prolog;

import edu.pucmm.prolog.Controllers.ConsultasController;
import io.javalin.Javalin;
import io.javalin.core.util.RouteOverviewPlugin;
import io.javalin.plugin.rendering.JavalinRenderer;
import io.javalin.plugin.rendering.template.JavalinThymeleaf;
import org.jpl7.*;


import java.util.Map;

public class Main {
    public static void main(String[] args) {

        Javalin app = Javalin.create(
                config ->{
                    config.addStaticFiles("/Public");
                    config.registerPlugin(new RouteOverviewPlugin("/rutas"));
                    config.enableCorsForAllOrigins();
                    JavalinRenderer.register(JavalinThymeleaf.INSTANCE, ".html");
                }
        ).start(7000);

        new ConsultasController(app).applyRoutes();
        //esto es para cargar el main.pl
        Query query = new Query("consult", new Term[] {new Atom("app-prolog/src/prolog-app.pl")});

        //la consulta se pone de la misma forma que en la consola de prolog
        String consulta = "getAllCinemas(Cinema, 'horror','santiago',L)";

        //if para verificar que el archivo existe
        if(query.hasSolution()){
            Query cinemas = new Query(consulta);
            Map aux = cinemas.getSolution();
            System.out.println(aux.get("L"));
        }

    }
}