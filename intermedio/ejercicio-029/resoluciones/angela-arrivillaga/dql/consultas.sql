use marketplace_accesorios_db;

-- consulta de vista de accesorios disponibles ordenados por precio de mayor a menor
select codigo_sku, nombre_accesorio, nombre_categoria, precio, stock
from vw_accesorios_disponibles
order by precio desc;

-- consulta de vista de resumen de inventario por categoria ordenados por total de productos
select nombre_categoria, total_productos, stock_total, precio_promedio
from vw_resumen_inventario_categorias
order by total_productos desc;

-- reporte de accesorios con precio superior a cincuenta dolares
select a.codigo_sku, a.nombre_accesorio, c.nombre_categoria, a.precio, a.estado_accesorio
from accesorios a
join categorias c on a.id_categoria = c.id_categoria
where a.precio > 50.00
order by a.precio asc;

-- consulta para identificar accesorios que se encuentran actualmente agotados o descontinuados
select a.codigo_sku, a.nombre_accesorio, c.nombre_categoria, a.estado_accesorio, a.stock
from accesorios a
join categorias c on a.id_categoria = c.id_categoria
where a.estado_accesorio in ('agotado', 'descontinuado')
order by a.estado_accesorio asc;

-- reporte analitico de valor total del inventario agrupado por categoria
select 
    c.nombre_categoria,
    count(a.id_accesorio) as cantidad_items,
    sum(a.precio * a.stock) as valor_total_inventario
from categorias c
left join accesorios a on c.id_categoria = a.id_categoria
group by c.id_categoria, c.nombre_categoria
order by valor_total_inventario desc;