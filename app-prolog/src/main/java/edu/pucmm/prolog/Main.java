package edu.pucmm.prolog;

import com.google.gson.Gson;
import edu.pucmm.prolog.Controllers.ConsultasController;
import io.javalin.Javalin;
import io.javalin.core.util.RouteOverviewPlugin;
import io.javalin.plugin.rendering.JavalinRenderer;
import io.javalin.plugin.rendering.template.JavalinThymeleaf;
import org.jpl7.*;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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

        // Esto retorna el nombre del sitio en la posicion 0 de parsedRes
        // en la posicion 1 esta un link que lleva a una descripcion a la pagina
        // de turismo que habla sobre ese sitio en especifico

        String result = "getHikingSpots('puerto plata', Response)";
        Query query = new Query("consult", new Term[] {new Atom("app-prolog/src/prolog-app.pl")});

        if(query.hasSolution()){
            Query consult = new Query(result);
            Map response = consult.getSolution();

            String[] res = response.get("Response").toString().split("],");
            if(!response.get("Response").toString().equalsIgnoreCase("[]")){
                for (int i= 0; i < res.length; i ++){
                    String[] parsedRes = res[i].replace("[","").replace("'","").split(",");
                    System.out.println(parsedRes[0]);
                    System.out.println(parsedRes[1]);
                }
            }
        }

        // Lo mismo que lo otro pero con el casino xD

        result = "getAllCasinos('santiago',Response)";
        if(query.hasSolution()){
            Query consult = new Query(result);
            Map response = consult.getSolution();

            String[] res = response.get("Response").toString().split("],");
            if(!response.get("Response").toString().equalsIgnoreCase("[]")){
                for (int i = 0; i < res.length; i ++){
                    String[] parsedRes = res[i].replace("[","").replace("'","").split(",");
                }
            }
        }
    }
}