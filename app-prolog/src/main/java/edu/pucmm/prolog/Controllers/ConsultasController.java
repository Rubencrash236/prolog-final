package edu.pucmm.prolog.Controllers;

import edu.pucmm.prolog.Models.General;
import io.javalin.Javalin;
import org.jpl7.Atom;
import org.jpl7.Query;
import org.jpl7.Term;

import java.util.*;

public class ConsultasController {
    private Javalin app;
    private General general = new General();
    String Resultado = null;
    Query query = new Query("consult", new Term[] {new Atom("src/prolog-app.pl")});


    public ConsultasController(Javalin app) {
        this.app = app;
    }

    public void applyRoutes(){

        app.get("/",ctx -> {
            ctx.redirect("consultar");
        });

        app.get("/consultar",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/consultar");
            ctx.render("/Public/html/Consulta.html",model);
        });

        app.post("/consultar",ctx -> {
          general.setUbicacion(ctx.formParam("ubicacion"));
          general.setActividad(ctx.formParam("actividad"));

          if(ctx.formParam("actividad",Integer.class).get() == 1){
              ctx.redirect("/discoteca");
          }
          if(ctx.formParam("actividad",Integer.class).get() == 2){
              ctx.redirect("/discoteca");
            }
          if(ctx.formParam("actividad",Integer.class).get() == 3){
              ctx.redirect("/cine");
            }
          if(ctx.formParam("actividad",Integer.class).get() == 4){
                ctx.redirect("/restaurante");
            }
            if(ctx.formParam("actividad",Integer.class).get() == 5){
                ctx.redirect("/actividadculturales");
            }

        });

        app.get("/cine",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/cine");
            ctx.render("/Public/html/Cine.html",model);
        });

        app.post("/cine",ctx -> {
            Map<String, Object> model = new HashMap<>();
            Resultado = "getAllCinemas(" + "Cinema," + "'" + ctx.formParam("tpelicula") + "'" + "," + "'" +  general.getUbicacion() + "'" + ',' + "L)";
            ctx.redirect("/cineresult");
            ctx.render("/Public/html/Cine.html",model);
        });

        app.get("/cineresult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            String consulta = Resultado;

            if(query.hasSolution()){
                Query cinemas = new Query(consulta);
                Map aux = cinemas.getSolution();

                List<String> myList = new ArrayList<String>(Arrays.asList(aux.get("L").toString().substring(1, aux.get("L").toString().length()-1).replaceAll("'","").split(",")));

                model.put("cines",myList);
            }
            ctx.render("/Public/html/CineResult.html",model);
        });

        app.get("/restaurante",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/Restaurante.html",model);
        });

        app.get("/discoteca",ctx -> {
            Map<String, Object> model = new HashMap<>();
            if(general.getActividad().equals("2")){
                model.put("local","Discoteca");
            }else{
                model.put("local","Bar");
            }
            ctx.render("/Public/html/Discoteca.html",model);
        });

        app.get("/actividadculturales",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/ActividadCultural.html",model);
        });
    }

}
