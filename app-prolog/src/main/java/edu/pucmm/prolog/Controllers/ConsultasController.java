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
    ArrayList<Restaurante> Grestaurantes = new ArrayList<>();
    List<String> GdiscBar;

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
            Resultado = "getAllCinemas(" + "Cinema," + "'" + ctx.formParam("tpelicula") + "',"
                    +  ctx.formParam("hinicio") + ","  + ctx.formParam("hfin")  + "," + "'" +  general.getUbicacion() + "'" + ',' + "L)";

            ctx.redirect("/cineresult");
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



        app.post("/restaurante",ctx -> {
            Map<String,Object> model = new HashMap<>();
            String puntuacion = ctx.formParam("puntuacion");
            String costo = ctx.formParam("tcosto");
            String comida = ctx.formParam("tcomida");


            Resultado = "getRestaurantesCercanos('"+ general.getUbicacion()
                        + "'," + comida + ",'" + costo + "'," + puntuacion + ",Result)";

            System.out.println(Resultado);

            if(query.hasSolution()){
                Query consulta = new Query(Resultado);
                Map result = consulta.getSolution();

                String[] res = result.get("Result").toString().split("],");
                ArrayList<Restaurante> restaurantes = new ArrayList<>();

                System.out.println(result.get("Result").toString());
                if(!result.get("Result").toString().equalsIgnoreCase("[]")){
                  for(int i = 0; i <res.length; i ++){
                    String[] myRes = res[i].replace("[","").replace("]","").split(",");

                        Restaurante aux = new Restaurante(myRes[0],myRes[1],myRes[2],myRes[3],myRes[4]);
                        restaurantes.add(aux);


                }

                }



                Grestaurantes  = restaurantes;
                ctx.redirect("restauranteresult");
            }
        });

        app.get("/restauranteresult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("restaurantes",Grestaurantes);

            ctx.render("/Public/html/restauranteResult.html",model);
        });

        app.get("/restaurante",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/Restaurante.html",model);
        });

        app.post("/discoteca",ctx -> {
            //Map<String,Object> model = new HashMap<>();
            String puntuacion = ctx.formParam("puntuacion");

            Resultado = "getAllBarOrDisco(Site," + puntuacion + "," + general.getUbicacion() + ",L)";

            if(query.hasSolution()){
                Query barAndDisco = new Query(Resultado);
                Map aux = barAndDisco.getSolution();

                GdiscBar = new ArrayList<String>(Arrays.asList(aux.get("L").toString().substring(1, aux.get("L").toString().length()-1).replaceAll("'","").split(",")));
               // model.put("locales", res);
                System.out.println(GdiscBar);
            }

            ctx.redirect("discotecaResult");
        });

        app.get("/discotecaResult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("locales",GdiscBar);
            ctx.render("/Public/html/discotecaResult.html",model);
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
        });

        app.get("/actividadculturales",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/ActividadCultural.html",model);
        });
    }

}
