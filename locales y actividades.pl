/*Locales
Estructura del hecho: local(nombre, tipo, provincia, calidad).
Tipo hace referencia a si es un restaurante, discoteca, bar, etc
Calidad hace referencia a la puntuacion tenga el local. Ejemplo: baja, media, alta o excelente*/

/*tipoComida(nombre,tipo_comida)*/
%Restaurantes
local(sbg,restaurante,santo_domingo,excelente).
    tipoComida(sbg,gourmet).

local(shushi_bali,restaurante,duarte,alta).
    tipoComida(shushi_bali,japonesa).

local(el_fogon,restaurante,santiago,media).
    tipoComida(el_fogon,criolla).

local(el_cayo,restaurante,samana,baja).
    tipoComida(el_cayo,pescados_y_mariscos).
%Bares
    local(drink_king,bar,espalliat,media).
    local(la_esquina_de_chalo,bar,puerto_plata,alta).
    local(boston_cafe,bar,duarte,media).
    local(q_tasting,bar,santo_domingo,excelente).
%Discotecas
    local(roof,discoteca,duarte,alta).
    local(gold,discoteca,hermanas_mirabal,media)
    local(dubai,discoteca,santiago,alta)
    local(clubber,discoteca,puerto_plata,baja)
%Cafes
    local(la_cafeteria,cafe,santiago,alta)
    local(star_bucks,cafe,santo_domingo,alta)
    local(el_polo,cafe,duarte,media)
    local(segafredo_zanetti,cafe,la_altagracia,baja)
/*Actividades culturales como museos, obras de teatro y conciertos
Estructura del hecho: actCultural(nombre,tipo,provincia,Precio)

obrasTeatrales(nombre,fecha)

concierto(nombre,fecha,[artistas]])*/

%Teatros
    actCultural(yago_yo_no_soy_el_que_soy,teatro,santo_domingo,Precio)
    actCultural(terapia,teatro,santiago,Precio).
    actCultural(bony_y_kin,teatro,santo_domingo,Precio).

%Museos
    actCultural(casa_juan_ponce,museo,la_altagracia,Precio)
    actCultural(centro_leon,museo,santiago,Precio)
    actCultural(faro_colon,museo,santo_domingo,Precio)

%Conciertos
    actCultural(los_montaner,concierto,santo_domingo,Precio)
    actCultural(hits_tour,concierto,santo_domingo,Precio)
    actCultural(sunday_brunch,concierto,la_altagracia,Precio)

    

    

