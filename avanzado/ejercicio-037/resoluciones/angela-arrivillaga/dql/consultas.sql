use campuslands_mysql;

-- vista para consolidar resultados de partidos con nombres
create or replace view vw_detalle_partidos as
select 
    p.id,
    l.nombre as equipo_local,
    v.nombre as equipo_visitante,
    p.goles_local,
    p.goles_visitante,
    p.fecha_partido
from partidos p
join equipos l on p.equipo_local_id = l.id
join equipos v on p.equipo_visitante_id = v.id;

-- consulta 1: reporte de partidos mediante la vista
select * from vw_detalle_partidos;

-- consulta 2: total de goles anotados por cada equipo como local
select equipo_local, sum(goles_local) as total_goles_local
from vw_detalle_partidos
group by equipo_local;

-- consulta 3: partidos con mas de dos goles totales
select * from vw_detalle_partidos
where (goles_local + goles_visitante) > 2;

-- consulta 4: promedio de goles por partido
select avg(goles_local + goles_visitante) as promedio_goles_por_partido
from vw_detalle_partidos;

-- consulta 5: equipos que no han perdido como local
select equipo_local
from vw_detalle_partidos
where goles_local >= goles_visitante
group by equipo_local;