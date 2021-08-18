package edu.pucmm.prolog.Controllers;

import edu.pucmm.prolog.Models.General;
import edu.pucmm.prolog.Models.Hotel;
import edu.pucmm.prolog.Models.Restaurante;
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
          general.setCapaital(ctx.formParam("capital",Float.class).get());
          general.setUbicacion(ctx.formParam("ubicacion"));
          general.setFecha(ctx.formParam("fecha"));
          general.setActividad(ctx.formParam("actividad"));
          ctx.redirect("/cine");
        });

        app.get("/cine",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/cine");
            ctx.render("/Public/html/Cine.html",model);
        });

        app.post("/cine",ctx -> {
            Map<String, Object> model = new HashMap<>();

            String n1 = null;
            String n2 = null;

            if(Integer.parseInt(ctx.formParam("tpelicula"))==5){
                n1 = "horror";
            }
            if(Integer.parseInt(general.getUbicacion()) == 1){
                n2 = "santiago";
            }

            Resultado = "getAllCinemas(" + "Cinema," + "'" + n1 + "'" + "," + "'" +  n2 + "'" + ',' + "L)";

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

                System.out.println(aux.get("L"));
                model.put("cines",myList);
            }
            ctx.render("/Public/html/CineResult.html",model);
        });

        app.post("/restaurante",ctx -> {
            Map<String,Object> model = new HashMap<>();
            String puntuacion = ctx.formParam("puntuacion");
            String costo = ctx.formParam("tcosto");
            String comida = ctx.formParam("tcomida");

            //No se como lo vayas a poner realmente
            if(ctx.formParam("cercano").equalsIgnoreCase("Si")){
                Resultado = "getRestaurantesCercanos('"+ general.getUbicacion()
                        + "'," + comida + ",'" + costo + "'," + puntuacion + ",Result)";
            }else{
                Resultado = "getRestaurantes('"+ general.getUbicacion()
                        + "'," + comida + ",'" + costo + "'," + puntuacion + ",Result)";
            }

            if(query.hasSolution()){
                Query consulta = new Query(Resultado);
                Map result = consulta.getSolution();

                String[] res = result.get("Result").toString().split("\\),");
                ArrayList<Restaurante> restaurantes = new ArrayList<>();

                for(int i = 0; i <res.length; i ++){
                    String[] myRes = res[i].split(",");
                    Restaurante aux = new Restaurante(res[0],res[1],res[2],res[3],res[4],res[5]);
                    restaurantes.add(aux);
                }
                model.put("restaurantes",restaurantes);
                // ctx.render("/Public/");
            }
        });
        app.get("/restaurante",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/Restaurante.html",model);
        });

        app.post("/discoteca",ctx -> {
            Map<String,Object> model = new HashMap<>();
            String puntuacion = ctx.formParam("puntuacion");

            Resultado = "getAllBarOrDisco(Site," + puntuacion + "," + general.getUbicacion() + ",L)";

            if(query.hasSolution()){
                Query barAndDisco = new Query(Resultado);
                Map aux = barAndDisco.getSolution();

                List<String> res = new ArrayList<String>(Arrays.asList(aux.get("L").toString().substring(1, aux.get("L").toString().length()-1).replaceAll("'","").split(",")));
                model.put("locales", res);
            }
            //ctx.render
        });
        app.get("/discoteca",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/Discoteca.html",model);
        });
        app.post("/hoteles",ctx -> {
           Map<String,Object> model = new HashMap<>();
           Resultado = "getHoteles("+general.getUbicacion() +","+ ctx.formParam("puntuacion") + "," +
                        ctx.formParam("estrellas") + "," + ctx.formParam("tPrecio") + "," +
                        ctx.formParam("servicios") + ",Result)";

           if(query.hasSolution()){
               Query consulta = new Query(Resultado);
               Map aux = consulta.getSolution();

               String[] res = aux.get("Result").toString().split("\\),");
               ArrayList<Hotel> hoteles = new ArrayList<>();

               for(int i = 0; i <res.length; i ++){
                   String[] myRes = res[i].split(",");
                   Hotel aux1 = new Hotel(res[0],res[1],res[2],res[3],res[4]);
                   hoteles.add(aux1);
               }

               model.put("hoteles",hoteles);
           }
           //ctx.render();
        });
        app.get("/actividadculturales",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/ActividadCultural.html",model);
        });
    }
}
