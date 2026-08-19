use ranking_battle_royale_db;

-- reporte general de jugadores ordenados de mayor a menor puntaje en el ranking
select j.gamertag, r.nombre_liga, j.puntos_ranking, j.partidas_jugadas, j.victorias_obtenidas, j.precision_disparo
from jugadores_battle_royale j
join rangos_liga r on j.id_rango = r.id_rango
order by j.puntos_ranking desc;

-- listado de jugadores con alta precision de disparo superior a sesenta por ciento
select j.gamertag, r.nombre_liga, j.precision_disparo, j.victorias_obtenidas
from jugadores_battle_royale j
join rangos_liga r on j.id_rango = r.id_rango
where j.precision_disparo > 60.00
order by j.precision_disparo desc;

-- resumen estadistico de puntaje promedio y total de victorias agrupadas por liga competitiva
select 
    r.nombre_liga,
    count(j.id_jugador) as total_jugadores,
    round(avg(j.puntos_ranking), 2) as puntaje_promedio,
    sum(j.victorias_obtenidas) as victorias_totales
from rangos_liga r
left join jugadores_battle_royale j on r.id_rango = j.id_rango
group by r.id_rango, r.nombre_liga
order by puntaje_promedio desc;

-- top cinco de jugadores con mayor cantidad de victorias obtenidas en partidas
select j.gamertag, r.nombre_liga, j.victorias_obtenidas, j.partidas_jugadas
from jugadores_battle_royale j
join rangos_liga r on j.id_rango = r.id_rango
order by j.victorias_obtenidas desc
limit 5;

-- reporte analitico de cuentas activas en el ranking filtradas por estado operativo
select j.gamertag, r.nombre_liga, j.puntos_ranking, j.fecha_registro, j.estado_cuenta
from jugadores_battle_royale j
join rangos_liga r on j.id_rango = r.id_rango
where j.estado_cuenta = 'activo'
order by j.fecha_registro asc;