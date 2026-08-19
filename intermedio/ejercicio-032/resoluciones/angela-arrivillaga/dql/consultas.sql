use ranking_battle_royale_db;

-- 1. Consulta con LEFT JOIN para mostrar TODOS los jugadores, incluyendo aquellos que no pertenecen a ningún escuadrón (id_escuadron es null)
select 
    j.id_jugador,
    j.nombre_jugador,
    j.gamertag,
    coalesce(e.nombre_escuadron, 'Sin Escuadrón (Agente Libre)') as escuadron,
    coalesce(e.nivel_rango, 'Sin Rango') as rango_escuadron,
    j.eliminaciones_totales,
    j.partidas_jugadas
from jugadores_br j
left join escuadrones_br e on j.id_escuadron = e.id_escuadron
order by j.eliminaciones_totales desc;

-- 2. Consulta con LEFT JOIN para listar todos los escuadrones registrados y comprobar qué escuadrones tienen jugadores asociados y cuáles están pendientes
select 
    e.id_escuadron,
    e.nombre_escuadron,
    e.servidor_region,
    e.nivel_rango,
    count(j.id_jugador) as total_miembros_activos
from escuadrones_br e
left join jugadores_br j on e.id_escuadron = j.id_escuadron
group by e.id_escuadron, e.nombre_escuadron, e.servidor_region, e.nivel_rango
order by total_miembros_activos desc;

-- 3. Reporte analítico con LEFT JOIN para calcular el promedio de eliminaciones por partida de cada jugador e identificar su respectivo escuadrón
select 
    j.gamertag,
    j.nombre_jugador,
    coalesce(e.nombre_escuadron, 'Agente Independiente') as escuadron,
    j.eliminaciones_totales,
    j.partidas_jugadas,
    round(j.eliminaciones_totales / nullif(j.partidas_jugadas, 0), 2) as ratio_eliminaciones_partida
from jugadores_br j
left join escuadrones_br e on j.id_escuadron = e.id_escuadron
order by ratio_eliminaciones_partida desc;

-- 4. Top 5 de jugadores con mayor número de eliminaciones totales utilizando LEFT JOIN para integrar la información del escuadrón
select 
    j.gamertag,
    j.nombre_jugador,
    coalesce(e.nombre_escuadron, 'Sin Escuadrón') as escuadron,
    j.eliminaciones_totales
from jugadores_br j
left join escuadrones_br e on j.id_escuadron = e.id_escuadron
order by j.eliminaciones_totales desc
limit 5;

-- 5. Consulta para identificar escuadrones que actualmente NO cuentan con jugadores registrados (filtrando resultados nulos del LEFT JOIN)
select 
    e.nombre_escuadron,
    e.servidor_region,
    e.nivel_rango
from escuadrones_br e
left join jugadores_br j on e.id_escuadron = j.id_escuadron
where j.id_jugador is null;