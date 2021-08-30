:- dynamic precio/2.
:- dynamic total/1.
:- dynamic capital/1.

precio('elevado',2000).
precio('medio',1500).
precio('economico',500).

total(0).
capital(0).

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

hiking('Amber Route', 'puerto plata', 'https://www.godominicanrepublic.com/poi/family/puerto-plata/amber-route/').
hiking('Armando Bermúdez National Park', 'jarabacoa','https://www.godominicanrepublic.com/poi/family/jarabacoa/armando-bermudez-national-park/').
hiking('Cachote', 'barahona', 'https://www.godominicanrepublic.com/poi/family/barahona/cachote/').
hiking('Charcos de los militares', 'puerto plata', 'https://www.godominicanrepublic.com/poi/canyoning-rappelling/puerto-plata/charcos-de-los-militares/').
hiking('Ciguapa Falls', 'puerto plata','https://www.godominicanrepublic.com/poi/canyoning-rappelling/puerto-plata/ciguapa-falls/').
hiking('Cueva de la virgen', 'barahona','https://www.godominicanrepublic.com/poi/caving/barahona/cueva-de-la-virgen/').
hiking('Cuevas de cabarete', 'puerto plata', 'https://www.godominicanrepublic.com/poi/caving/puerto-plata/cuevas-de-cabarete/').
hiking('El Choco national park', 'puerto plata', 'https://www.godominicanrepublic.com/poi/caving/puerto-plata/el-choco-national-park/').
hiking('El mogote', 'jarabacoa','https://www.godominicanrepublic.com/poi/family/jarabacoa/el-mogote/').
hiking('Hoyo azul', 'punta cana','https://www.godominicanrepublic.com/poi/caving/punta-cana/hoyo-azul/').
hiking('La ciénaga','barahona', 'https://www.godominicanrepublic.com/poi/family/barahona/la-cienega/').
hiking('La confluencia', 'jarabacoa', 'https://www.godominicanrepublic.com/poi/family/jarabacoa/la-confluencia/').
hiking('Laguna de bávaro', 'punta cana', 'https://www.godominicanrepublic.com/poi/adventure/punta-cana/laguna-de-bavaro/').
hiking('Las ondas', 'punta cana', 'https://www.godominicanrepublic.com/poi/caving/punta-cana/las-ondas/').
hiking('Los haitises national park', 'samaná', 'https://www.godominicanrepublic.com/poi/bird-watching/samana/los-haitises-national-park-2/').
hiking('Mount isabel de Torres', 'puerto plata', 'https://www.godominicanrepublic.com/poi/adventure/puerto-plata/mount-isabel-de-torres/').
hiking('Padre nuestro ecological trail','la romana', 'https://www.godominicanrepublic.com/poi/adventure/bayahibe/padre-nuestro-ecological-trail/').
hiking('Parque ecológico ojos indígenas','punta cana', 'https://www.godominicanrepublic.com/poi/cenotes-springs/punta-cana/parque-ecologico-ojos-indigenas/').
hiking('Paseo de los flamencos', 'pedernales', 'https://www.godominicanrepublic.com/poi/family/pedernales/paseo-de-los-flamencos/').
hiking('Pico Duarte', 'jarabacoa', 'https://www.godominicanrepublic.com/poi/adventure/jarabacoa/pico-duarte/').
hiking('Sendero de los helechos', 'constanza', 'https://www.godominicanrepublic.com/poi/family/constanza/sendero-de-los-helechos/').
hiking('Sendero del cangrejo','montecristi', 'https://www.godominicanrepublic.com/poi/hiking/montecristi/sendero-del-cangrejo/').
hiking('Valle del tetero', 'constanza', 'https://www.godominicanrepublic.com/poi/cenotes-springs/constanza/valle-del-tetero/').
hiking('Valle nuevo national park', 'constanza', 'https://www.godominicanrepublic.com/poi/adventure/constanza/valle-nuevo-national-park/').

casino('Be Live Hamaca', 'santo domingo', 'http://www.belivehotels.com/hotel/EN/ficha_hotel/hamaca/casinos.jsp').
casino('Coral Costa Caribe’s Dream Casino', 'san pedro de macorís', 'https://www.godominicanrepublic.com/poi/dining-nightlife/casinos-gaming/juan-dolio/juan-dolio-casinos/').
casino('La Romana Casinos', 'la romana', 'https://www.godominicanrepublic.com/poi/dining-nightlife/casinos-gaming/la-romana/la-romana-casinos/').
casino('Puerto Plata Casinos', 'puerto plata', 'https://www.godominicanrepublic.com/poi/dining-nightlife/casinos-gaming/puerto-plata/puerto-plata-casinos/').
casino('Punta Cana Casinos','punta cana', 'https://www.godominicanrepublic.com/poi/dining-nightlife/casinos-gaming/punta-cana/punta-cana-casinos/').
casino('Samaná Casinos', 'samana', 'https://www.godominicanrepublic.com/poi/dining-nightlife/casinos-gaming/samana/samana-casinos/').
casino('Hodelpa Gran Almirante', 'santiago', 'http://www.hodelpa.com/en/content/casino.html').
casino('Hodelpa Centro Plaza', 'santiago','http://www.hodelpa.com/en/content/casino.html').
casino('Hotel Ambar', 'santiago',  'http://www.hotelambar.com.do/').
casino('Hotel Matum', 'santiago', 'http://hotelmatum.com/').
casino('Hotel Platino', 'santiago', 'http://www.hotelplatinord.com/').

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

% dame todos los lugares para hacer hiking dada una provincia
hikingSpot(HikingSpot, Location, Link):- hiking(HikingSpot, Location, Link).
getHikingSpots(Location, Response):- findall([HikingSpot, Link], hikingSpot(HikingSpot,Location,Link), Response).

% dame los casinos de una provincia
getCasino(Name, Location, Link):- casino(Name,Location,Link).
getAllCasino(Location, Response):- findall([Name, Link], getCasino(Name,Location,Link), Response).

% dame los bares o discotecas dado una puntuacion, y ubicacion.
getBarOrDisco(Site,Stars,Location):- local(Site,bar,Location,Stars);local(Site,discoteca,Location,Stars).
getAllBarOrDisco(Site,Stars,Location,L):- findall((Site), getBarOrDisco(Site,Stars,Location),L).

% Busca los sitios cercanos a una ubicacion especificada
lugaresCercanos(Location,Cercanos):- bagof(Location1, cerca(Location,Location1),Cercanos).

% Busca un restaurante dado sus atributos
searchRestaurante(Name,Location,FoodType,BudgetType,Stars):-
    local(Name,restaurante,Location,Stars),tipoComida(Name,FoodType,Price),clasificacionPrecio(Price,Type), Type = BudgetType,total(X),capital(Y),Y =< x + Price.

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
                                     subset(Servicios,ServiciosHotel),total(X),capital(Y),Y =< X+PrecioHotel.

getActividades(Tipo,Ubicacion,TPrecio,Result):-findall([Nombre,Tipo,Ubicacion,Precio],
                                               auxActividades(Nombre,Tipo,Ubicacion,TPrecio,Precio),
                                               Result).
auxActividades(Nombre,Tipo,Ubicacion,TPrecio,Precio):- actCultural(Nombre,Tipo,Ubicacion,Precio),clasificacionPrecio(Precio,TPrecio),total(X),capital(Y),Y=< X + Precio.

modificarPrecio(Precio,'economico'):- retract(precio('economico',_)),asserta(precio('economico',Precio)).
modificarPrecio(Precio,'medio'):- retract(precio('medio',_)),asserta(precio('medio',Precio)).
modificarPrecio(Precio,'elevado'):- retract(precio('elevado',_)),asserta(precio('elevado',Precio)).

clasificacionPrecio(Precio,'economico'):- precio('economico',Cant),Precio =< Cant.
clasificacionPrecio(Precio,'medio'):- precio('economico',Min),precio('medio',Max),Precio > Min,Precio =< Max.
clasificacionPrecio(Precio,'elevado'):- precio('elevado',Cant),Precio > Cant.


evaluar([]).
evaluar([Head|Tail]):- min(Head),evaluar(Tail).

min(restaurante):-findall(Precio,tipoComida(_,_,Precio),R),list_min(Min,R), min_aux(Min).
min(hotel):-findall(Precio,hotel(_,_,_,_,Precio),R),list_min(Min,R),min_aux(Min).
min(actCultural):- findall(Precio,actCultural(_,_,_,Precio),R),list_min(Min,R),   min_aux(Min).
min_aux(Min):- total(Aux),Total is Aux + Min,retractall(total(_)) ,asserta(total(Total)).

list_min(M, [X|Xs]):- list_min2(M, X, Xs).
list_min2(M, M, []):- !.
list_min2(X, Y, [Z|Zs]):-Z =< Y,!,list_min2(X, Z, Zs).
list_min2(X, Y, [Z|Zs]):- Z >= Y, list_min2(X, Y, Zs).

modCapital(Capital):- retractall(capital(_)),asserta(capital(Capital)).