:- dynamic precio/2.

precio('elevado',2000).
precio('medio',1500).
precio('economico',500).

local(sbg,restaurante,'santo domingo',excelente).
local(shushi_bali,restaurante,duarte,alta).
local(el_fogon,restaurante,santiago,media).
local(el_cayo,restaurante,santiago,baja).

tipoComida(el_cayo,pescados_y_mariscos,1500).
tipoComida(sbg,gourmet,2500).
tipoComida(shushi_bali,japonesa,1000).
tipoComida(el_fogon,criolla,100).



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


%hotel(nombre, [servicios], ubicacion, valoracion, precio)

hotel('hilton',[wifi,piscina,estacionamiento,spa,restaurante,bar,gym],'bayahibe',8,3,4284).
hotel('casa de campo',[wifi,alberca,spa,restaurante,bar,gym],'la romana',9,5,206).
hotel('hyatt',[piscina,spa,restaurante,bar,gym],'bavaro',9,5,511).
hotel('gran jimenoa',[piscina,spa,estacionamiento,mascotas,restaurante,bar],'jarabacoa','8',2,52).

actCultural(yago_yo_no_soy_el_que_soy,teatro,'santo domingo',500).
actCultural(terapia,teatro,santiago,1000).
actCultural(bony_y_kin,teatro,'santo domingo',2000).

actCultural(casa_juan_ponce,museo,'la altagracia',500).
actCultural(centro_leon,museo,santiago,200).
actCultural(faro_colon,museo,'santo domingo',500).

actCultural(los_montaner,concierto,'santo domingo',5000).
actCultural(hits_tour,concierto,'santo domingo',1000).
actCultural(sunday_brunch,concierto,'la altagracia',0).

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
getCinemaMovieType(Cinema, MovieType,Init,End, Location):-cine(Cinema,Location,InitReal,EndReal,Movies), movieType(Movies,MovieType), (InitReal=<Init;EndReal>=End).
getAllCinemas(Cinema, MovieType,Init,End, Location,L):- findall((Cinema), getCinemaMovieType(Cinema,MovieType,Init,End,Location),L).

% dame los bares o discotecas dado una puntuacion, y ubicacion.
getBarOrDisco(Site,Stars,Location):- local(Site,bar,Location,Stars);local(Site,discoteca,Location,Stars).
getAllBarOrDisco(Site,Stars,Location,L):- findall((Site), getBarOrDisco(Site,Stars,Location),L).

% Busca los sitios cercanos a una ubicacion especificada
lugaresCercanos(Location,Cercanos):- bagof(Location1, cerca(Location,Location1),Cercanos).

% Busca un restaurante dado sus atributos
searchRestaurante(Name,Location,FoodType,BudgetType,Stars):-
    local(Name,restaurante,Location,Stars),tipoComida(Name,FoodType,Price),clasificacionPrecio(Price,Type), Type = BudgetType.

% Busca todos los restaurantes dadas sus caracteristicas

getRestaurantes(Location,FoodType,BudgetType,Stars,Result):-
                                        findall([Name,Location,FoodType,BudgetType,Stars],
                                            searchRestaurante(Name,Location,FoodType,BudgetType,Stars),
                                            Result).

% Busca todos los restaurantes cercanos a una ubicacion y cumpliendo con las demas condiciones
getRestaurantesCercanos(Location,FoodType,BudgetType,Stars,Result):-
                                        lugaresCercanos(Location,Cercanos),
                                        getCercanosAux(FoodType,BudgetType,Stars,Cercanos,Result).

getCercanosAux(_,_,_,[],[]).
getCercanosAux(FoodType,BudgetType,Stars,[Cerca|Cercanos],Result):- getRestaurantes(Cerca,FoodType,BudgetType,Stars,R1),
                                                             getCercanosAux(FoodType,BudgetType,Stars,Cercanos,R2),
                                                             append(R1,R2,Result),!.

getHoteles(Ubicacion,Puntuacion,Estrellas,TipoPrecio,Servicios,Result):- findall([Nombre,Ubicacion, Puntuacion,Estrellas,TipoPrecio,Servicios],
                                                                         checkHoteles(Nombre, Servicios, Ubicacion, Puntuacion,Estrellas,TipoPrecio),
                                                                         Result).
% Busca un hotel a partir de las caracteristicas, revisa que el precio del hotel sea de la categoria que se pasó por parametro y de que el hotel
% cuente con los servicios requeridos
checkHoteles(Nombre, Servicios, Ubicacion, Valoracion,Estrellas,TipoPrecio):-
                                     hotel(Nombre, ServiciosHotel, Ubicacion, Valoracion,Estrellas,PrecioHotel),
                                     clasificacionPrecio(PrecioHotel,TipoPrecio),
                                     subset(Servicios,ServiciosHotel).

getActividades(Tipo,Ubicacion,TPrecio,Result):-findall([Nombre,Tipo,Ubicacion,Precio],
                                               auxActividades(Nombre,Tipo,Ubicacion,TPrecio,Precio),
                                               Result).
auxActividades(Nombre,Tipo,Ubicacion,TPrecio,Precio):- actCultural(Nombre,Tipo,Ubicacion,Precio),clasificacionPrecio(Precio,TPrecio).

modificarPrecio(Precio,'economico'):- retract(precio('economico',_)),asserta(precio('economico',Precio)).
modificarPrecio(Precio,'medio'):- retract(precio('medio',_)),asserta(precio('medio',Precio)).
modificarPrecio(Precio,'elevado'):- retract(precio('elevado',_)),asserta(precio('elevado',Precio)).

clasificacionPrecio(Precio,'economico'):- precio('economico',Cant),Precio =< Cant.
clasificacionPrecio(Precio,'medio'):- precio('economico',Min),precio('medio',Max),Precio > Min,Precio =< Max.
clasificacionPrecio(Precio,'elevado'):- precio('elevado',Cant),Precio > Cant.