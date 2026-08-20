use liga_futbol_db;

-- tabla general de clasificacion ordenada por puntos de forma descendente y diferencia de goles
select 
    e.nombre_equipo, 
    c.nombre_ciudad, 
    e.puntos, 
    e.goles_a_favor, 
    e.goles_en_contra, 
    (e.goles_a_favor - e.goles_en_contra) as diferencia_goles, 
    e.estado_equipo
from equipos e
join ciudades c on e.id_ciudad = c.id_ciudad
order by e.puntos desc, diferencia_goles desc;

-- listado de equipos ordenados alfabeticamente por el nombre del club para control de registros
select e.nombre_equipo, c.nombre_ciudad, e.anio_fundacion, e.puntos
from equipos e
join ciudades c on e.id_ciudad = c.id_ciudad
order by e.nombre_equipo asc;

-- ranking de equipos con mayor cantidad de goles a favor ordenados de mayor a menor rendimiento ofensivo
select e.nombre_equipo, c.nombre_ciudad, e.goles_a_favor, e.puntos, e.estado_equipo
from equipos e
join ciudades c on e.id_ciudad = c.id_ciudad
order by e.goles_a_favor desc, e.puntos desc;

-- top cinco de los mejores equipos de la liga ordenados estrictamente por puntaje acumulado
select e.nombre_equipo, c.nombre_ciudad, e.puntos, e.goles_a_favor
from equipos e
join ciudades c on e.id_ciudad = c.id_ciudad
order by e.puntos desc
limit 5;

-- reporte analitico filtrando equipos activos y ordenandolos por su antiguedad o año de fundacion ascendente
select e.nombre_equipo, c.nombre_ciudad, e.anio_fundacion, e.puntos, e.estado_equipo
from equipos e
join ciudades c on e.id_ciudad = c.id_ciudad
where e.estado_equipo = 'activo'
order by e.anio_fundacion asc;