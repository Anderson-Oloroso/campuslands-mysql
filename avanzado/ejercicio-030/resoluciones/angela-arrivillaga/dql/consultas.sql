use equipo_streaming_db;

-- 1. consulta analitica optimizada agrupando por categoria y estado operativo utilizando indices compuestos
explain analyze
select 
    c.nombre_categoria,
    e.estado_operativo,
    count(e.id_equipo) as total_equipos,
    sum(e.stock) as stock_total_unidades,
    round(avg(e.precio), 2) as precio_promedio
from categorias_equipo c
join equipos_streaming e on c.id_categoria = e.id_categoria
group by c.nombre_categoria, e.estado_operativo
order by total_equipos desc;

-- 2. consulta para filtrar equipos disponibles con precio superior al promedio general utilizando subconsulta optimizada
explain analyze
select 
    e.nombre_equipo,
    c.nombre_categoria,
    e.precio,
    e.stock,
    e.fecha_adquisicion
from equipos_streaming e
join categorias_equipo c on e.id_categoria = c.id_categoria
where e.estado_operativo = 'disponible' 
  and e.precio > (select avg(precio) from equipos_streaming)
order by e.precio desc;

-- 3. consulta con ranking (dense_rank) para identificar los 2 equipos mas costosos de cada categoria de streaming
explain analyze
with ranking_equipos as (
    select 
        c.nombre_categoria,
        e.nombre_equipo,
        e.precio,
        e.estado_operativo,
        dense_rank() over (partition by c.id_categoria order by e.precio desc) as ranking_categoria
    from equipos_streaming e
    join categorias_equipo c on e.id_categoria = c.id_categoria
)
select 
    nombre_categoria,
    nombre_equipo,
    precio,
    estado_operativo,
    ranking_categoria
from ranking_equipos
where ranking_categoria <= 2
order by nombre_categoria asc, ranking_categoria asc;

-- 4. reporte analitico de inventario total valorado por categoria para auditoria tecnica y financiera
explain analyze
select 
    c.nombre_categoria,
    count(e.id_equipo) as variedad_equipos,
    sum(e.stock) as unidades_totales,
    round(sum(e.precio * e.stock), 2) as valor_total_inventario
from categorias_equipo c
left join equipos_streaming e on c.id_categoria = e.id_categoria
group by c.id_categoria, c.nombre_categoria
order by valor_total_inventario desc;

-- 5. consulta de control operativo para filtrar equipos proximos o en mantenimiento con restricciones de fecha de adquisicion
explain analyze
select 
    e.nombre_equipo,
    c.nombre_categoria,
    e.estado_operativo,
    e.fecha_adquisicion,
    datediff(current_date(), e.fecha_adquisicion) as dias_en_inventario
from equipos_streaming e
join categorias_equipo c on e.id_categoria = c.id_categoria
where e.estado_operativo != 'disponible'
order by e.fecha_adquisicion asc;