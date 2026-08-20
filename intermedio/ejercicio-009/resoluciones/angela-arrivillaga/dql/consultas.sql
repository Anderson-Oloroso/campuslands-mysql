use campuslands_mysql;

-- 1. listado completo de luchadores mostrando su categoria de peso mediante joins
select 
    l.nombre_completo as luchador,
    l.apodo,
    c.nombre_categoria as categoria,
    c.limite_peso_kg as limite_peso,
    l.peleas_ganadas as ganadas,
    l.peleas_perdidas as perdidas,
    l.estado
from luchadores_kickboxing l
join categorias_peso c on l.categoria_id = c.id
order by l.peleas_ganadas desc;

-- 2. historial de combates cruzando las esquinas azul, roja y el ganador mediante múltiples foreign keys
select 
    cb.fecha_combate,
    cb.modalidad,
    la.nombre_completo as esquina_azul,
    lr.nombre_completo as esquina_roja,
    coalesce(lg.nombre_completo, 'empate') as ganador
from combates_kickboxing cb
join luchadores_kickboxing la on cb.luchador_azul_id = la.id
join luchadores_kickboxing lr on cb.luchador_rojo_id = lr.id
left join luchadores_kickboxing lg on cb.ganador_id = lg.id
order by cb.fecha_combate asc;

-- 3. top 3 luchadores con mayor cantidad de victorias acumuladas
select 
    nombre_completo as luchador,
    apodo,
    peleas_ganadas as victorias
from luchadores_kickboxing
order by peleas_ganadas desc
limit 3;

-- 4. cantidad de luchadores activos agrupados por su categoria de peso
select 
    c.nombre_categoria as categoria,
    count(l.id) as total_luchadores_activos
from categorias_peso c
left join luchadores_kickboxing l on c.id = l.categoria_id and l.estado = 'activo'
group by c.id, c.nombre_categoria
order by total_luchadores_activos desc;

-- 5. reporte de combates filtrados por la modalidad k1 y ordenados por fecha
select 
    cb.fecha_combate,
    cb.modalidad,
    la.nombre_completo as esquina_azul,
    lr.nombre_completo as esquina_roja
from combates_kickboxing cb
join luchadores_kickboxing la on cb.luchador_azul_id = la.id
join luchadores_kickboxing lr on cb.luchador_rojo_id = lr.id
where cb.modalidad = 'k1'
order by cb.fecha_combate desc;