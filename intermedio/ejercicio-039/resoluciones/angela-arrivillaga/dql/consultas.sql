use kickboxing_fk_db;

-- 1. Listado completo de luchadores integrando su gimnasio de procedencia y categoría de peso mediante múltiples FOREIGN KEYS
select 
    l.nombre_completo as luchador,
    l.edad,
    l.estado,
    g.nombre_gimnasio,
    g.ciudad as ciudad_gimnasio,
    c.nombre_categoria,
    c.modalidad,
    l.peleas_ganadas,
    l.peleas_perdidas
from luchadores l
join gimnasios g on l.id_gimnasio = g.id_gimnasio
join categorias_peso c on l.id_categoria = c.id_categoria
order by l.peleas_ganadas desc;

-- 2. Historial detallado de combates con los nombres de ambos contrincantes, evento, método de victoria y ganador
select 
    e.nombre_evento,
    e.fecha_evento,
    la.nombre_completo as esquina_azul,
    lr.nombre_completo as esquina_roja,
    cat.nombre_categoria,
    cb.resultado_metodo,
    coalesce(lg.nombre_completo, 'Empate / Sin Decisión') as ganador,
    cb.duracion_rounds
from combates cb
join eventos e on cb.id_evento = e.id_evento
join luchadores la on cb.id_luchador_azul = la.id_luchador
join luchadores lr on cb.id_luchador_rojo = lr.id_luchador
join categorias_peso cat on cb.id_categoria = cat.id_categoria
left join luchadores lg on cb.id_ganador = lg.id_luchador
order by e.fecha_evento desc;

-- 3. Ranking de eficiencia y porcentaje de victorias por luchador con estado activo
select 
    l.nombre_completo,
    g.nombre_gimnasio,
    l.peleas_ganadas,
    l.peleas_perdidas,
    (l.peleas_ganadas + l.peleas_perdidas) as total_peleas,
    round((l.peleas_ganadas / nullif(l.peleas_ganadas + l.peleas_perdidas, 0)) * 100, 2) as porcentaje_efectividad
from luchadores l
join gimnasios g on l.id_gimnasio = g.id_gimnasio
where l.estado = 'activo'
order by porcentaje_efectividad desc, l.peleas_ganadas desc;

-- 4. Reporte de cantidad de luchadores afiliados y promedio de victorias agrupados por gimnasio
select 
    g.nombre_gimnasio,
    g.ciudad,
    count(l.id_luchador) as total_luchadores_afiliados,
    sum(l.peleas_ganadas) as total_victorias_gimnasio,
    round(avg(l.peleas_ganadas), 1) as promedio_victorias
from gimnasios g
left join luchadores l on g.id_gimnasio = l.id_gimnasio
group by g.id_gimnasio, g.nombre_gimnasio, g.ciudad
order by total_victorias_gimnasio desc;

-- 5. Consulta analítica para identificar los métodos de finalización más frecuentes en los combates registrados
select 
    resultado_metodo,
    count(*) as total_combates,
    round((count(*) * 100.0) / (select count(*) from combates), 2) as porcentaje_uso
from combates
group by resultado_metodo
order by total_combates desc;