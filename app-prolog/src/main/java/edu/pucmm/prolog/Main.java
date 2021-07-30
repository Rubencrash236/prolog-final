package edu.pucmm.prolog;

import edu.pucmm.prolog.Controllers.ConsultasController;
import io.javalin.Javalin;
import io.javalin.core.util.RouteOverviewPlugin;
import io.javalin.plugin.rendering.JavalinRenderer;
import io.javalin.plugin.rendering.template.JavalinThymeleaf;

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

    }
}
