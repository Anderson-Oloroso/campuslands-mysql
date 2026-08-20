use campuslands_mysql;

-- consulta 1: promedio de bolsa de pelea y peleas ganadas agrupadas por categoria de peso
select categoria_peso, avg(bolsa_pelea) as promedio_bolsa, avg(peleas_ganadas) as promedio_ganadas
from combatientes
where estado != 'retirado'
group by categoria_peso;

-- consulta 2: top 3 combatientes con mayor cantidad de peleas ganadas
select nombre, categoria_peso, peleas_ganadas, peleas_perdidas, bolsa_pelea, estado
from combatientes
order by peleas_ganadas desc
limit 3;

-- consulta 3: listado detallado de combatientes filtrados por una categoria de peso especifica
select nombre, peleas_ganadas, bolsa_pelea, estado
from combatientes
where categoria_peso = 'peso pesado'
order by bolsa_pelea desc;

-- consulta 4: reporte analitico agrupado por estado actual de los combatientes con conteo y bolsa acumulada
select estado, count(*) as total_combatientes, sum(bolsa_pelea) as inversion_total_bolsas
from combatientes
group by estado;

-- consulta 5: historial de eventos de combate con informacion cruzada de los combatientes rojo y azul
select 
    e.id as evento_id,
    cr.nombre as combatiente_rojo,
    ca.nombre as combatiente_azul,
    e.modalidad,
    e.premio_total,
    e.estado_evento
from eventos_combate e
join combatientes cr on e.combatiente_rojo_id = cr.id
join combatientes ca on e.combatiente_azul_id = ca.id
order by e.id desc;