use campuslands_mysql;

-- consulta 1: promedio de sets ganados y perdidos agrupados por estado del jugador
select 
    estado_jugador, 
    avg(sets_ganados) as promedio_sets_ganados, 
    avg(sets_perdidos) as promedio_sets_perdidos,
    count(*) as total_jugadores
from jugadores_pingpong
group by estado_jugador;

-- consulta 2: top 3 jugadores con mayor cantidad de sets ganados
select 
    j.nombre_jugador, 
    t.nombre_torneo, 
    j.ranking_mundial, 
    j.sets_ganados, 
    j.estado_jugador
from jugadores_pingpong j
join torneos_pingpong t on j.torneo_id = t.id
order by j.sets_ganados desc
limit 3;

-- consulta 3: listado de jugadores filtrados por un torneo especifico (open mundial tokio)
select 
    j.nombre_jugador, 
    j.ranking_mundial, 
    j.sets_ganados, 
    j.sets_perdidos, 
    j.estado_jugador
from jugadores_pingpong j
join torneos_pingpong t on j.torneo_id = t.id
where t.nombre_torneo = 'open mundial tokio'
order by j.ranking_mundial asc;

-- consulta 4: reporte analitico con el calculo de la diferencia de sets por jugador
select 
    nombre_jugador, 
    ranking_mundial, 
    sets_ganados, 
    sets_perdidos, 
    (sets_ganados - sets_perdidos) as diferencia_sets,
    estado_jugador
from jugadores_pingpong
order by diferencia_sets desc;

-- consulta 5: listado general cruzado de jugadores y torneos con detalles financieros
select 
    j.nombre_jugador, 
    j.ranking_mundial, 
    t.nombre_torneo, 
    t.tipo_superficie, 
    t.premio_mayor, 
    j.estado_jugador
from jugadores_pingpong j
join torneos_pingpong t on j.torneo_id = t.id
order by t.premio_mayor desc, j.ranking_mundial asc;