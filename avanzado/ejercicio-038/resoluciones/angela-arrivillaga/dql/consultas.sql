use campuslands_mysql;

-- consulta 1: promedio de puntos y goles a favor agrupados por estado del equipo
select estado, avg(puntos) as promedio_puntos, avg(goles_favor) as promedio_goles
from equipos_sala
group by estado;

-- consulta 2: top 3 equipos con mayor puntuacion en la liga de futbol sala
select nombre, entrenador, puntos, (goles_favor - goles_contra) as diferencia_goles, estado
from equipos_sala
order by puntos desc, diferencia_goles desc
limit 3;

-- consulta 3: listado de equipos activos ordenados por diferencia de goles
select nombre, puntos, goles_favor, goles_contra, (goles_favor - goles_contra) as diferencia
from equipos_sala
where estado = 'activo'
order by diferencia desc;

-- consulta 4: reporte analitico con el total de jugadores y acumulación de tarjetas por equipo
select e.nombre as equipo, count(j.id) as total_jugadores, sum(j.tarjetas_amarillas) as total_amarillas, sum(j.tarjetas_rojas) as total_rojas
from equipos_sala e
left join jugadores_sala j on e.id = j.equipo_id
group by e.id, e.nombre;

-- consulta 5: ranking de los 5 goleadores principales del campeonato de sala
select j.nombre as jugador, e.nombre as equipo, j.dorsal, j.goles_anotados
from jugadores_sala j
join equipos_sala e on j.equipo_id = e.id
order by j.goles_anotados desc
limit 5;