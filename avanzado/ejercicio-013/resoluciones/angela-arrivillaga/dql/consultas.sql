use peliculas_miedo_db;

-- 1. uso de operador de extraccion json ->> para consultar el nivel de sustos y el director de cada pelicula
select 
    titulo_original,
    director,
    detalles_json->>'$.nivel_sustos' as nivel_de_susto,
    calificacion_imdb
from peliculas_terror
order by calificacion_imdb desc;

-- 2. uso de json_extract y filtro con operador json para extraer plataformas de streaming disponibles
select 
    titulo_original,
    json_extract(detalles_json, '$.streaming') as plataformas_streaming
from peliculas_terror
where json_contains(detalles_json, json_quote('netflix'), '$.streaming');

-- 3. uso de json_extract para consultar la cantidad de premios ganados dentro del objeto json anidado
select 
    titulo_original,
    director,
    json_extract(detalles_json, '$.premios.ganados') as premios_ganados,
    calificacion_imdb
from peliculas_terror
order by cast(json_unquote(json_extract(detalles_json, '$.premios.ganados')) as unsigned) desc;

-- 4. uso de funciones json para listar el elenco principal extrayendo elementos estructurados
select 
    titulo_original,
    json_extract(detalles_json, '$.elenco_principal[0]') as actor_principal_1,
    json_extract(detalles_json, '$.elenco_principal[1]') as actor_principal_2,
    estado_distribucion
from peliculas_terror;

-- 5. consulta analitica combinando datos relacionales y json para filtrar peliculas con nivel de susto alto o psicologico
select 
    p.titulo_original,
    s.nombre_subgenero,
    p.presupuesto_millones,
    p.calificacion_imdb,
    p.detalles_json->>'$.nivel_sustos' as clasificacion_sustos
from peliculas_terror p
join subgeneros_terror s on p.id_subgenero = s.id_subgenero
where p.detalles_json->>'$.nivel_sustos' in ('alto', 'psicologico')
order by p.calificacion_imdb desc;