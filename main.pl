local(sbg,restaurante,santo_domingo,excelente).
    tipoComida(sbg,gourmet).

local(shushi_bali,restaurante,duarte,alta).
    tipoComida(shushi_bali,japonesa).

local(el_fogon,restaurante,santiago,media).
    tipoComida(el_fogon,criolla).

local(el_cayo,restaurante,samana,baja).
    tipoComida(el_cayo,pescados_y_mariscos).

local(drink_king,bar,espalliat,media).
local(la_esquina_de_chalo,bar,puerto_plata,alta).
local(boston_cafe,bar,duarte,media).
local(q_tasting,bar,santo_domingo,excelente).

local(roof,discoteca,duarte,alta).
local(gold,discoteca,hermanas_mirabal,media).
local(dubai,discoteca,santiago,alta).
local(clubber,discoteca,puerto_plata,baja).

local(la_cafeteria,cafe,santiago,alta).
local(star_bucks,cafe,santo_domingo,alta).
local(el_polo,cafe,duarte,media).
local(segafredo_zanetti,cafe,la_altagracia,baja).

actCultural(yago_yo_no_soy_el_que_soy,teatro,santo_domingo,Precio).
actCultural(terapia,teatro,santiago,Precio).
actCultural(bony_y_kin,teatro,santo_domingo,Precio).

actCultural(casa_juan_ponce,museo,la_altagracia,Precio).
actCultural(centro_leon,museo,santiago,Precio).
actCultural(faro_colon,museo,santo_domingo,Precio).

actCultural(los_montaner,concierto,santo_domingo,Precio).
actCultural(hits_tour,concierto,santo_domingo,Precio).
actCultural(sunday_brunch,concierto,la_altagracia,Precio).

playa('playa rincon', 'las galeras').
playa('cayo levantado','samana').
playa('isla saona', 'isla saona').
playa('bavaro beach', 'bavaro').
playa('cayo arena', 'punta rucia').
playa('playa fronton', 'las galeras').
playa('playa coson', 'las terrenas').
playa('playa grande', 'rio san juan').
playa('lanza del norte','las galeras').

pelicula(luca,comedia,1.36).
pelicula('black widow', accion,2.14).
pelicula(cruela, comedia, 2.14).
pelicula('raya and the last dragon', aventura, 1.57).
pelicula(after, romance,1.45).
pelicula(emma, melodrama, 2.12).
pelicula('the seventh day', horror,1.27).
pelicula('the conjuring: the devil made me do it',horror, 1.52).
pelicula(oxygen,'sci-fi',1.41).

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
cine('higuey','plaza taveras center',3,10,['luca','oxygen','cruela','emma']).
cine('higuey','palacio del cine higuey',3,10,['luca','black widow','cruela','raya and the last dragon']).
cine('bella terra mall','santiago',3,8,['luca','black widow','emma','raya and the last dragon']).
cine('cinema centro cibao','santiago',3,10,['luca','oxygen','emma','raya and the last dragon']).
cine('las colinas mall','santiago',3,12,['after','black widow','the seventh daya','raya and the last dragon']).
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

    

