local(sbg,restaurante,'santo domingo',excelente).
    tipoComida(sbg,gourmet,'ELEVADO').

local(shushi_bali,restaurante,duarte,alta).
    tipoComida(shushi_bali,japonesa,'MEDIO').

local(el_fogon,restaurante,santiago,media).
    tipoComida(el_fogon,criolla,'ECONOMICO').

local(el_cayo,restaurante,samana,baja).
    tipoComida(el_cayo,pescados_y_mariscos,'ECONOMICO').

local(drink_king,bar,espalliat,media).
local(la_esquina_de_chalo,bar,'puerto plata',alta).
local(boston_cafe,bar,duarte,media).
local(q_tasting,bar,'santo domingo',excelente).

local(roof,discoteca,duarte,alta).
local(gold,discoteca,'hermanas mirabal',media).
local(dubai,discoteca,santiago,alta).
local(clubber,discoteca,'puerto plata',baja).

local(la_cafeteria,cafe,santiago,alta).
local(star_bucks,cafe,'santo domingo',alta).
local(el_polo,cafe,duarte,media).
local(segafredo_zanetti,cafe,'la altagracia',baja).

actCultural(yago_yo_no_soy_el_que_soy,teatro,'santo domingo',Precio).
actCultural(terapia,teatro,santiago,Precio).
actCultural(bony_y_kin,teatro,'santo domingo',Precio).

actCultural(casa_juan_ponce,museo,'la altagracia',Precio).
actCultural(centro_leon,museo,santiago,Precio).
actCultural(faro_colon,museo,'santo domingo',Precio).

actCultural(los_montaner,concierto,'santo domingo',Precio).
actCultural(hits_tour,concierto,'santo domingo',Precio).
actCultural(sunday_brunch,concierto,'la altagracia',Precio).

playa('playa rincon', 'las galeras').
playa('cayo levantado','samana').
playa('isla saona', 'isla saona').
playa('bavaro beach', 'bavaro').
playa('cayo arena', 'punta rucia').
playa('playa fronton', 'las galeras').
playa('playa coson', 'las terrenas').
playa('playa grande', 'rio san juan').
playa('lanza del norte','las galeras').
/*
pelicula(luca,comedia,1.36).
pelicula('black widow', accion,2.14).
pelicula(cruela, comedia, 2.14).
pelicula('raya and the last dragon', aventura, 1.57).
pelicula(after, romance,1.45).
pelicula(emma, melodrama, 2.12).
pelicula('the seventh day', horror,1.27).
pelicula('the conjuring: the devil made me do it',horror, 1.52).
pelicula(oxygen,'sci-fi',1.41).*/

pelicula(luca,comedia,1.36).
pelicula('black widow', accion,2.14).
pelicula(cruela, comedia, 2.14).
pelicula('raya and the last dragon', aventura, 1.57).
pelicula(after, romance,1.45).
pelicula(emma, melodrama, 2.12).
pelicula('the seventh day', horror,1.27).
pelicula('the conjuring: the devil made me do it',horror, 1.52).
pelicula(oxygen,'sci-fi',1.41).

cine('palacio del cine','san francisco',3,10,['luca','black widow','cruela','raya and the last dragon']).
cine('multiplaza la romana','romana',3,9,['luca','black widow','oxygen','raya and the last dragon']).
cine('la marina','romana',3,9,['luca','black widow','emma','the seventh day']).
cine('plaza comercial y cultural','san juan',3,10,['after','black widow','oxygen','raya and the last dragon']).
cine('palacio del cine','san francisco',3,10,['luca','the seventh day','cruela','raya and the last dragon']).
cine('plaza taveras center','higuey',3,10,['luca','oxygen','cruela','emma']).
cine('palacio del cine higuey','higuey',3,10,['luca','black widow','cruela','raya and the last dragon']).
cine('bella terra mall','santiago',3,8,['luca','black widow','emma','raya and the last dragon']).
cine('cinema centro cibao','santiago',3,10,['luca','oxygen','emma','raya and the last dragon']).
cine('las colinas mall','santiago',3,12,['after','black widow','the seventh day','raya and the last dragon']).
cine('hollywood 7','santiago',3,10,['after','oxygen','emma','the conjuring: the devil made me do it']).
cine('acropolis center','santo domingo',3,8,['after','the seventh day','cruela','the conjuring: the devil made me do it']).
cine('bella vista mall','santo domingo',3,8,['luca','black widow','cruela','the conjuring: the devil made me do it']).
cine('blue mall','santo domingo',3,8,['luca','the seventh day','after','raya and the last dragon']).
cine('galeria 360','santo domingo',3,8,['luca','oxygen','the seventh day','raya and the last dragon']).

monumento('obelisco','santo domingo').
monumento('faro a colon','santo domingo').
monumento('heroes de santome','san juan').
monumento('monumento a la restauracion','santiago').
monumento('obelisco macho','santo domingo').
monumento('fortaleza san luis','santiago').
monumento('fortaleza de san felipe','puerto plata').

clasificacionPrecio(Precio,'ECONOMICO'):- Precio =< 500.
clasificacionPrecio(Precio,'MEDIO'):- Precio > 500,Precio =< 1000.
clasificacionPrecio(Precio,'ELEVADO'):- Precio > 1000.

cerca(Location,Location).
cerca('punta cana',higuey).
cerca('punta cana','san rafael').
cerca('punta cana','bavaro').
cerca('bavaro',higuey).
cerca('bavaro','san rafael').
cerca('san francisco',tenares).
cerca(santiago,moca).
cerca(moca,tenares).
cerca(moca,'san francisco').
cerca(samana,'las terrenas').
cerca(samana,'las galeras').

% itera sobre las pelis de un cinema y devuelve el cine si este contiene el tipo de pelicula que se quiere
movieType([]).
movieType([Movie|Movies], Type):- pelicula(Movie,XType,_), XType = Type -> !; movieType(Movies,Type).
getCinemaMovieType(Cinema, MovieType, Location):-cine(Cinema,Location,_,_,Movies), movieType(Movies,MovieType).
getAllCinemas(Cinema, MovieType, Location,L):- findall((Cinema), getCinemaMovieType(Cinema,MovieType,Location),L).

% dame los bares o discotecas dado una puntuacion, y ubicacion.
getBarOrDisco(Site,Stars,Location):- local(Site,bar,Location,Stars);local(Site,discoteca,Location,Stars).
getAllBarOrDisco(Site,Stars,Location,L):- findall((Site), getBarOrDisco(Site,Stars,Location),L).


searchRestaurante(Name,Location,FoodType,BudgetType):-
    local(Name,restaurante,Location,_),tipoComida(Name,FoodType,BudgetType).

getRestaurantes(Location,FoodType,BudgetType,Result):-
                                        findall((Name,Location,FoodType,BudgetType),
                                            searchRestaurante(Name,Location,FoodType,BudgetType),
                                            Result).

getRestaurantesCercanos(Location,FoodType,BudgetType,Result):-
                                        bagof(Location1, cerca(Location,Location1),Cercanos),
                                        getCercanosAux(FoodType,BudgetType,Cercanos,Result).

getCercanosAux(_,_,[],[]).
getCercanosAux(FoodType,BudgetType,[Cerca|Cercanos],Result):- getRestaurantes(Cerca,FoodType,BudgetType,R1),
                                                             getCercanosAux(FoodType,BudgetType,Cercanos,R2),
                                                             append(R1,R2,Result),!.
