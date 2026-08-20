use campuslands_mysql;

-- 1. listado de partidos jugados mostrando los nombres reales de los equipos locales y visitantes mediante joins
select 
    p.jornada, 
    el.nombre_equipo as local, 
    p.goles_local, 
    p.goles_visitante, 
    ev.nombre_equipo as visitante, 
    es.nombre_estadio as estadio
from partidos_liga p
join equipos_liga el on p.equipo_local_id = el.id
join equipos_liga ev on p.equipo_visitante_id = ev.id
join estadios es on p.estadio_id = es.id
order by p.jornada asc;

-- 2. total de goles anotados por cada equipo jugando como local
select 
    el.nombre_equipo as equipo, 
    sum(p.goles_local) as total_goles_local,
    count(p.id) as partidos_como_local
from equipos_liga el
left join partidos_liga p on el.id = p.equipo_local_id
group by el.id, el.nombre_equipo
order by total_goles_local desc;

-- 3. top 3 estadios con mayor capacidad registrados en el sistema
select nombre_estadio, capacidad
from estadios
order by capacidad desc
limit 3;

-- 4. consulta de equipos activos que participan en la liga ordenados alfabeticamente
select nombre_equipo, ciudad_origen, estado
from equipos_liga
where estado = 'activo'
order by nombre_equipo asc;

-- 5. reporte general de partidos donde hubo mas de dos goles en total
select 
    p.jornada, 
    el.nombre_equipo as local, 
    ev.nombre_equipo as visitante, 
    (p.goles_local + p.goles_visitante) as total_goles
from partidos_liga p
join equipos_liga el on p.equipo_local_id = el.id
join equipos_liga ev on p.equipo_visitante_id = ev.id
where (p.goles_local + p.goles_visitante) > 2
order by total_goles desc;