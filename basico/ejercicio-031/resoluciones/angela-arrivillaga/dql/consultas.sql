use torneo_moba_db;

-- lista detallada de jugadores con su respectivo equipo y rol principal
juguetear: select j.alias_jugador, j.nombre_real, e.nombre_equipo, j.rol_principal, j.nivel_kda
from jugadores_moba j
join equipos_esports e on j.id_equipo = e.id_equipo
order by j.nivel_kda desc;

-- reporte de jugadores con alto rendimiento con kda superior a cinco
select j.alias_jugador, e.nombre_equipo, j.rol_principal, j.nivel_kda
from jugadores_moba j
join equipos_esports e on j.id_equipo = e.id_equipo
where j.nivel_kda > 5.00
order by j.nivel_kda desc;

-- estadisticas de promedio de kda y cantidad de jugadores agrupados por rol principal
select 
    j.rol_principal,
    count(j.id_jugador) as total_jugadores,
    round(avg(j.nivel_kda), 2) as kda_promedio
from jugadores_moba j
group by j.rol_principal
order by total_jugadores desc;

-- listado de equipos esports participantes ordenados por año de fundacion
select e.codigo_equipo, e.nombre_equipo, e.region_origen, e.fundacion_anio
from equipos_esports e
order by e.fundacion_anio asc;

-- reporte analitico de kda maximo y promedio agrupados por cada equipo de esports
select 
    e.nombre_equipo,
    count(j.id_jugador) as total_integrantes,
    round(max(j.nivel_kda), 2) as kda_maximo_equipo,
    round(avg(j.nivel_kda), 2) as kda_promedio_equipo
from equipos_esports e
left join jugadores_moba j on e.id_equipo = j.id_equipo
group by e.id_equipo, e.nombre_equipo
order by kda_promedio_equipo desc;