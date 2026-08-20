use pingpong_db;

-- 1. uso de cte para calcular el promedio general de victorias y filtrar jugadores que superan dicho rendimiento medio
with rendimiento_promedio as (
    select avg(partidos_ganados) as media_ganados
    from jugadores_pingpong
    where estado_jugador = 'activo'
)
select j.nombre_completo, c.nombre_categoria, j.partidos_ganados, j.partidos_perdidos, j.estado_jugador
from jugadores_pingpong j
join categorias_nivel c on j.id_categoria = c.id_categoria
cross join rendimiento_promedio rp
where j.estado_jugador = 'activo' and j.partidos_ganados > rp.media_ganados
order by j.partidos_ganados desc;

-- 2. uso de cte para calcular la eficiencia de sets (ratio sets a favor / sets en contra) y listar el ranking tecnico
with eficiencia_sets as (
    select 
        id_jugador,
        nombre_completo,
        sets_a_favor,
        sets_en_contra,
        case 
            when sets_en_contra = 0 then cast(sets_a_favor as decimal(10,2))
            else round(sets_a_favor / sets_en_contra, 2)
        end as ratio_sets
    from jugadores_pingpong
)
select es.nombre_completo, cn.nombre_categoria, es.sets_a_favor, es.sets_en_contra, es.ratio_sets, j.estado_jugador
from eficiencia_sets es
join jugadores_pingpong j on es.id_jugador = j.id_jugador
join categorias_nivel cn on j.id_categoria = cn.id_categoria
order by es.ratio_sets desc;

-- 3. uso de cte para calcular los ingresos totales por categoria y filtrar categorias con alta recaudacion de membresias
with ingresos_por_categoria as (
    select 
        id_categoria,
        count(id_jugador) as total_jugadores,
        sum(cuota_membresia) as recaudacion_total
    from jugadores_pingpong
    group by id_categoria
)
select c.nombre_categoria, ipc.total_jugadores, ipc.recaudacion_total
from ingresos_por_categoria ipc
join categorias_nivel c on ipc.id_categoria = c.id_categoria
where ipc.recaudacion_total >= 100.00
order by ipc.recaudacion_total desc;

-- 4. uso de cte multiples para obtener el top de jugadores con mas victorias y calcular su proporcion de exito individual
with ranking_victorias as (
    select id_jugador, nombre_completo, id_categoria, partidos_ganados, partidos_perdidos,
           (partidos_ganados + partidos_perdidos) as total_partidos
    from jugadores_pingpong
),
proporcion_exito as (
    select rv.nombre_completo, cn.nombre_categoria, rv.partidos_ganados, rv.total_partidos,
           round((rv.partidos_ganados * 100.0) / nullif(rv.total_partidos, 0), 2) as porcentaje_exito
    from ranking_victorias rv
    join categorias_nivel cn on rv.id_categoria = cn.id_categoria
)
select pe.nombre_completo, pe.nombre_categoria, pe.partidos_ganados, pe.total_partidos, pe.porcentaje_exito
from proporcion_exito pe
order by pe.porcentaje_exito desc
limit 5;

-- 5. uso de cte para resumir estados operativos de la academia y filtrar jugadores que requieren atencion por lesion o retiro
with resumen_operativo as (
    select estado_jugador, count(*) as cantidad_jugadores, sum(cuota_membresia) as total_cuotas
    from jugadores_pingpong
    group by estado_jugador
)
select ro.estado_jugador, ro.cantidad_jugadores, ro.total_cuotas
from resumen_operativo ro
order by ro.cantidad_jugadores desc;