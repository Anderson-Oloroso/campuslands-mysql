use kickboxing_db;

-- listado general del roster de kickboxing activo ordenado por cantidad de victorias descendente
select l.nombre_completo, c.nombre_categoria, l.peleas_ganadas, l.peleas_perdidas, l.nocauts_favor, l.cuota_mensual, l.estado_luchador
from luchadores l
join categorias_peso c on l.id_categoria = c.id_categoria
order by l.peleas_ganadas desc;

-- consulta filtrada de luchadores activos con mas de diez peleas ganadas en la academia
select l.nombre_completo, c.nombre_categoria, l.peleas_ganadas, l.nocauts_favor, l.cuota_mensual
from luchadores l
join categorias_peso c on l.id_categoria = c.id_categoria
where l.estado_luchador = 'activo' and l.peleas_ganadas > 10
order by l.nocauts_favor desc;

-- resumen estadistico agrupado por categoria de peso con conteos, promedio de nocauts y cuotas acumuladas
select 
    c.nombre_categoria,
    count(l.id_luchador) as total_luchadores,
    round(avg(l.nocauts_favor), 2) as promedio_nocauts,
    sum(l.cuota_mensual) as ingresos_acumulados
from categorias_peso c
left join luchadores l on c.id_categoria = l.id_categoria
group by c.id_categoria, c.nombre_categoria
order by ingresos_acumulados desc;

-- top cinco de los mejores golpeadores ordenados por cantidad de nocauts a favor
select l.nombre_completo, c.nombre_categoria, l.nocauts_favor, l.peleas_ganadas, l.cuota_mensual
from luchadores l
join categorias_peso c on l.id_categoria = c.id_categoria
order by l.nocauts_favor desc
limit 5;

-- reporte de auditoria para verificar los registros restantes despues de la ejecucion del delete controlado
select l.nombre_completo, c.nombre_categoria, l.estado_luchador, l.peleas_ganadas, l.peleas_perdidas
from luchadores l
join categorias_peso c on l.id_categoria = c.id_categoria
order by l.estado_luchador asc, l.peleas_ganadas desc;