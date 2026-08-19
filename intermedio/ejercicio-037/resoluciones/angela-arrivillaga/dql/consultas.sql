use liga_futbol_2fn_db;

-- 1. Tabla de posiciones oficial del torneo aplicando JOINs entre equipos, participaciones y torneos (cumpliendo 2FN)
select 
    t.nombre_torneo,
    e.nombre_equipo,
    e.ciudad,
    p.partidos_jugados,
    p.puntos_obtenidos,
    p.goles_a_favor,
    p.goles_en_contra,
    (p.goles_a_favor - p.goles_en_contra) as diferencia_goles
from participaciones_torneo p
join equipos e on p.id_equipo = e.id_equipo
join torneos t on p.id_torneo = t.id_torneo
where t.id_torneo = 1
order by p.puntos_obtenidos desc, diferencia_goles desc;

-- 2. Consulta para listar los equipos y su respectivo promedio de puntos por partido en el torneo Apertura 2026
select 
    e.nombre_equipo,
    p.partidos_jugados,
    p.puntos_obtenidos,
    round(p.puntos_obtenidos / nullif(p.partidos_jugados, 0), 2) as promedio_puntos_partido
from participaciones_torneo p
join equipos e on p.id_equipo = e.id_equipo
where p.id_torneo = 1
order by promedio_puntos_partido desc;

-- 3. Goleadores de la liga agrupados e integrados con su respectivo equipo (aprovechando la normalización 2FN de jugadores)
select 
    j.nombre_jugador,
    j.posicion,
    j.dorsal,
    e.nombre_equipo,
    j.goles_anotados
from jugadores_futbol j
join equipos e on j.id_equipo = e.id_equipo
order by j.goles_anotados desc;

-- 4. Consulta para obtener equipos que hayan conseguido más de 30 puntos en el torneo Apertura 2026
select 
    t.nombre_torneo,
    e.nombre_equipo,
    p.puntos_obtenidos,
    p.goles_a_favor
from participaciones_torneo p
join equipos e on p.id_equipo = e.id_equipo
join torneos t on p.id_torneo = t.id_torneo
where t.id_torneo = 1 
  and p.puntos_obtenidos > 30
order by p.puntos_obtenidos desc;

-- 5. Reporte analítico de rendimiento defensivo por equipo en el torneo activo
select 
    e.nombre_equipo,
    t.nombre_torneo,
    p.partidos_jugados,
    p.goles_en_contra,
    round(p.goles_en_contra / nullif(p.partidos_jugados, 0), 2) as promedio_goles_recibidos
from participaciones_torneo p
join equipos e on p.id_equipo = e.id_equipo
join torneos t on p.id_torneo = t.id_torneo
order by promedio_goles_recibidos asc;