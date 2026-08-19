use biblioteca_gamer_db;

-- 1. uso de explain para analizar la optimizacion y uso de indices en busquedas por titulo de videojuego
explain 
select j.titulo_juego, p.nombre_plataforma, j.desarrollador, j.calificacion_meta, j.estado_jugo
from videojuegos j
join plataformas_gaming p on j.id_plataforma = p.id_plataforma
where j.titulo_juego = 'elden ring';

-- 2. consulta optimizada usando el indice idx_estado_jugo para filtrar videojuegos completados
explain
select j.titulo_juego, p.nombre_plataforma, j.horas_jugadas, j.calificacion_meta
from videojuegos j
join plataformas_gaming p on j.id_plataforma = p.id_plataforma
where j.estado_jugo = 'completado'
order by j.calificacion_meta desc;

-- 3. reporte analitico utilizando indices de calificacion para obtener los mejores juegos (metacritic mayor o igual a 90)
select 
    j.titulo_juego,
    p.nombre_plataforma,
    j.calificacion_meta,
    j.precio_dolares,
    j.horas_jugadas
from videojuegos j
join plataformas_gaming p on j.id_plataforma = p.id_plataforma
where j.calificacion_meta >= 90
order by j.calificacion_meta desc;

-- 4. consulta de rendimiento agrupado por plataforma con sumas de inversión y promedios optimizados
select 
    p.nombre_plataforma,
    count(j.id_juego) as total_juegos,
    sum(j.precio_dolares) as inversion_total_dolares,
    round(avg(j.calificacion_meta), 2) as promedio_metacritic
from plataformas_gaming p
left join videojuegos j on p.id_plataforma = j.id_plataforma
group by p.id_plataforma, p.nombre_plataforma
order by inversion_total_dolares desc;

-- 5. top 5 de juegos con mayor cantidad de horas invertidas utilizando los indices estructurados de la tabla
select 
    j.titulo_juego,
    p.nombre_plataforma,
    j.horas_jugadas,
    j.calificacion_meta,
    j.estado_jugo
from videojuegos j
join plataformas_gaming p on j.id_plataforma = p.id_plataforma
order by j.horas_jugadas desc
limit 5;