use tienda_ropa_db;

-- 1. consulta general de todo el inventario de prendas de ropa ordenado por precio de manera descendente
select 
    p.nombre_prenda,
    c.nombre_categoria,
    p.talla,
    p.color,
    p.stock_actual,
    p.precio_dolares
from inventario_prendas p
join categorias_prendas c on p.id_categoria = c.id_categoria
order by p.precio_dolares desc;

-- 2. consulta filtrada de prendas con stock bajo (menor o igual a 35 unidades) para reposicion
select 
    nombre_prenda,
    talla,
    color,
    stock_actual,
    precio_dolares
from inventario_prendas
where stock_actual <= 35
order by stock_actual asc;

-- 3. reporte estadístico agrupado por categoría de prendas con conteo de artículos, stock total e inversión estimada
select 
    c.nombre_categoria,
    count(p.id_prenda) as total_articulos,
    sum(p.stock_actual) as stock_total_unidades,
    round(avg(p.precio_dolares), 2) as precio_promedio_dolares
from categorias_prendas c
left join inventario_prendas p on c.id_categoria = p.id_categoria
group by c.id_categoria, c.nombre_categoria
order by stock_total_unidades desc;

-- 4. top 5 de prendas más costosas disponibles en la tienda de ropa
select 
    nombre_prenda,
    talla,
    color,
    precio_dolares
from inventario_prendas
order by precio_dolares desc
limit 5;

-- 5. consulta de auditoría para verificar los registros de cambios de stock generados por el procedimiento almacenado
select 
    a.id_auditoria,
    p.nombre_prenda,
    a.stock_anterior,
    a.stock_nuevo,
    a.fecha_modificacion
from auditoria_stock a
join inventario_prendas p on a.id_prenda = p.id_prenda
order by a.fecha_modificacion desc;