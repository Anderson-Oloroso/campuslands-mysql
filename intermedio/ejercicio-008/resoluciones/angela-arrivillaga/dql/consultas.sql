use campuslands_mysql;

-- 1. listado general de jugadores mostrando su equipo y posicion mediante uniones relacionales (joins)
select 
    j.nombre_completo as jugador,
    j.numero_camiseta as dorsal,
    e.nombre_equipo as equipo,
    p.nombre_posicion as posicion,
    j.goles_anotados as goles
from jugadores_sala j
join equipos_sala e on j.equipo_id = e.id
join posiciones_sala p on j.posicion_id = p.id
order by j.goles_anotados desc;

-- 2. top 3 goleadores del campeonato de futbol sala
select 
    j.nombre_completo as jugador,
    e.nombre_equipo as equipo,
    j.goles_anotados as total_goles
from jugadores_sala j
join equipos_sala e on j.equipo_id = e.id
order by j.goles_anotados desc
limit 3;

-- 3. total de goles anotados agrupados por cada posicion de juego
select 
    p.nombre_posicion as posicion,
    sum(j.goles_anotados) as goles_totales_posicion,
    count(j.id) as cantidad_jugadores
from posiciones_sala p
left join jugadores_sala j on p.id = j.posicion_id
group by p.id, p.nombre_posicion
order by goles_totales_posicion desc;

-- 4. listado de equipos activos y cantidad de jugadores registrados en cada uno
select 
    e.nombre_equipo as equipo,
    e.ciudad,
    count(j.id) as total_jugadores_registrados
from equipos_sala e
left join jugadores_sala j on e.id = j.equipo_id
where e.estado = 'activo'
group by e.id, e.nombre_equipo, e.ciudad
order by total_jugadores_registrados desc;

-- 5. jugadores que superan los 10 goles anotados en la temporada
select 
    j.nombre_completo as jugador,
    e.nombre_equipo as equipo,
    j.goles_anotados
from jugadores_sala j
join equipos_sala e on j.equipo_id = e.id
where j.goles_anotados > 10
order by j.goles_anotados desc;