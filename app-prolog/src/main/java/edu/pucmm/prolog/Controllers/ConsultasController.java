package edu.pucmm.prolog.Controllers;

import edu.pucmm.prolog.Models.*;
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
    ArrayList<Casino>  Gcasinos = new ArrayList<>();
    ArrayList<Hiking>  Ghiking = new ArrayList<>();
    ArrayList<Actividades> actividades = new ArrayList<>();


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
          
          if(query.hasSolution()){
              Resultado = "modCapital(" + ctx.formParam("capital")+")";
              Query consulta = new Query(Resultado);
          }
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
          if(ctx.formParam("actividad",Integer.class).get() == 6){
                ctx.redirect("/hotel");
            }
          if(ctx.formParam("actividad",Integer.class).get() == 7){

              Resultado = "getAllCasino('" + general.getUbicacion() + "'," + "Response)";

              if(query.hasSolution()){
                  Query consult = new Query(Resultado);
                  Map response = consult.getSolution();

                  String[] res = response.get("Response").toString().split("],");
                  if(!response.get("Response").toString().equalsIgnoreCase("[]")){
                      for (int i = 0; i < res.length; i ++){
                          String[] myRes = res[i].replace("[","").replace("]","").replace("'","").split(",");
                          Casino aux = new Casino(myRes[0],myRes[1]);
                          Gcasinos.add(aux);
                      }
                  }

              }
              ctx.redirect("/casinoResult");
            }
          if(ctx.formParam("actividad",Integer.class).get() == 8){
              Resultado = "getHikingSpots('" + general.getUbicacion() + "'," + "Response)";

              if(query.hasSolution()){
                  Query consult = new Query(Resultado);
                  Map response = consult.getSolution();

                  String[] res = response.get("Response").toString().split("],");
                  if(!response.get("Response").toString().equalsIgnoreCase("[]")){
                      for (int i= 0; i < res.length; i ++){
                          String[] parsedRes = res[i].replace("[","").replace("]","").replace("'","").split(",");
                          Hiking aux = new Hiking(parsedRes[0],parsedRes[1]);
                          Ghiking.add(aux);
                      }
                  }
              }
                ctx.redirect("/hikingResult");
            }

        });


        app.get("/casinoResult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("casinos",Gcasinos);
            ctx.render("/Public/html/casinoResult.html",model);
        });

        app.get("/hikingResult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("hiking",Ghiking);
            ctx.render("/Public/html/HikingResult.html",model);
        });


        app.get("/cine",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/cine");
            ctx.render("/Public/html/Cine.html",model);
        });

        app.get("/precio",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/precio");
            ctx.render("/Public/html/Precio.html",model);
        });

        app.post("/precio",ctx -> {

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


            Resultado = "evaluar([" + ctx.cookie("otras")  + "])," + "getRestaurantesCercanos('"+ general.getUbicacion()
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
            String puntuacion = ctx.formParam("puntuacion");
            Resultado = "getAllBarOrDisco(Site," + puntuacion + ",'" + general.getUbicacion() + "',L)";

            System.out.println(Resultado);

            if(query.hasSolution()){
                Query barAndDisco = new Query(Resultado);
                Map aux = barAndDisco.getSolution();

                GdiscBar = new ArrayList<String>(Arrays.asList(aux.get("L").toString().substring(1, aux.get("L").toString().length()-1).replaceAll("'","").split(",")));
                System.out.println(GdiscBar);
            }

            ctx.redirect("discotecaResult");
        });

        app.get("/discotecaResult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("locales",GdiscBar);
            ctx.render("/Public/html/discotecaResult.html",model);
        });

        app.get("/actividadesResult",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("actividades",actividades);
            ctx.render("/Public/html/actividadesResult.html",model);
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

        app.get("/hotel",ctx -> {
            Map<String, Object> model = new HashMap<>();
            model.put("accion","/hoteles");
            ctx.render("/Public/html/hotel.html",model);
        });

        app.post("/hoteles",ctx -> {
           Map<String,Object> model = new HashMap<>();

           Resultado = "evaluar([" + ctx.cookie("otras")  + "])," + "getHoteles('"+general.getUbicacion() +"',"+ ctx.formParam("puntuacion") + "," +
                        ctx.formParam("estrellas") + "," + ctx.formParam("tcosto") + "," + "[" +
                        ctx.cookie("servicios") + "]" + ",Result)";

            System.out.println(Resultado);

           if(query.hasSolution()){
               Query consulta = new Query(Resultado);
               Map aux = consulta.getSolution();

               String[] res = aux.get("Result").toString().split("],");
               ArrayList<Hotel> hoteles = new ArrayList<>();
               if(!aux.get("Result").toString().equalsIgnoreCase("[]")){
                   for(int i = 0; i <res.length; i ++){
                       String[] myRes = res[i].replace("[","").replace("]","").split(",");
                       String servicios = Arrays.toString(Arrays.copyOfRange(myRes, 5, myRes.length)).replace(" ","");
                       Hotel aux1 = new Hotel(res[0],res[1],res[2],res[3],res[4],servicios);
                       hoteles.add(aux1);
                   }

               model.put("hoteles",hoteles);
           }}
        });

        app.get("/actividadculturales",ctx -> {
            Map<String, Object> model = new HashMap<>();
            ctx.render("/Public/html/ActividadCultural.html",model);
        });

        app.post("/actividadculturales",ctx -> {
            Map<String,Object> model = new HashMap<>();
            Resultado = "getActividades("+ctx.formParam("actividadcultural")+",'"+general.getUbicacion()+"','"+ctx.formParam("precio")+"',Result)";

            System.out.println(Resultado);
            if(query.hasSolution()){
                Query consulta = new Query(Resultado);
                Map aux = consulta.getSolution();

                String[] res = aux.get("Result").toString().split("],");
                if(!aux.get("Result").toString().equalsIgnoreCase("[]")){
                    for(int i = 0; i <res.length; i ++){
                        String[] myRes = res[i].replace("[","").replace("]","").split(",");
                        Actividades aux1 = new Actividades(myRes[0],myRes[1],myRes[2],myRes[3]);
                        actividades.add(aux1);
                    }

                  //  model.put("hoteles",actividades);
                }}

            ctx.redirect("actividadesResult");
        });
    }


}
