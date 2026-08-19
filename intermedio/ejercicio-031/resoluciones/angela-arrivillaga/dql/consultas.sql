use torneos_moba_db;

-- 1. Consulta con INNER JOIN para listar cada jugador junto con el nombre, tag y región de su equipo correspondiente
select 
    j.id_jugador,
    j.nombre_jugador,
    j.nickname,
    j.rol_principal,
    j.kda_promedio,
    e.nombre_equipo,
    e.tag_equipo,
    e.region
from jugadores_moba j
inner join equipos_moba e on j.id_equipo = e.id_equipo
order by j.kda_promedio desc;

-- 2. Consulta con múltiples INNER JOIN para ver el detalle completo de las partidas (equipo azul, equipo rojo y equipo ganador)
select 
    p.id_partida,
    ea.nombre_equipo as equipo_azul,
    er.nombre_equipo as equipo_rojo,
    eg.nombre_equipo as equipo_ganador,
    p.duracion_minutos,
    p.fase_torneo,
    p.fecha_partida
from partidas_moba p
inner join equipos_moba ea on p.id_equipo_azul = ea.id_equipo
inner join equipos_moba er on p.id_equipo_rojo = er.id_equipo
inner join equipos_moba eg on p.id_ganador = eg.id_equipo
order by p.fecha_partida asc;

-- 3. Reporte estadístico agrupado por región usando INNER JOIN para calcular el KDA promedio de los jugadores por región competitiva
select 
    e.region,
    count(j.id_jugador) as total_jugadores,
    round(avg(j.kda_promedio), 2) as kda_promedio_region
from jugadores_moba j
inner join equipos_moba e on j.id_equipo = e.id_equipo
group by e.region
order by kda_promedio_region desc;

-- 4. Top 5 de jugadores con mayor KDA promedio en el torneo utilizando INNER JOIN para traer los datos del equipo
select 
    j.nickname,
    j.nombre_jugador,
    j.rol_principal,
    j.kda_promedio,
    e.nombre_equipo as equipo
from jugadores_moba j
inner join equipos_moba e on j.id_equipo = e.id_equipo
order by j.kda_promedio desc
limit 5;

-- 5. Consulta analítica para verificar el total de victorias de cada equipo en las partidas oficiales utilizando INNER JOIN con la tabla de ganadores
select 
    e.nombre_equipo,
    e.tag_equipo,
    e.estado_equipo,
    count(p.id_partida) as total_victorias
from equipos_moba e
inner join partidas_moba p on e.id_equipo = p.id_ganador
group by e.id_equipo, e.nombre_equipo, e.tag_equipo, e.estado_equipo
order by total_victorias desc;