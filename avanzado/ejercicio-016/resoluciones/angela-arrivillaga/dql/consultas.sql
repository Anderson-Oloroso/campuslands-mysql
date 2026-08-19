use restaurante_urbano_db;

-- 1. consulta general de detalles de órdenes y clientes combinando tablas relacionales ordenadas por fecha de pedido
select 
    o.id_orden,
    o.cliente_nombre,
    m.nombre_producto,
    d.cantidad,
    d.subtotal_dolares,
    o.estado_orden,
    o.fecha_pedido
from ordenes_pedido o
join detalle_orden d on o.id_orden = d.id_orden
join menu_comida_urbana m on d.id_producto = m.id_producto
order by o.fecha_pedido desc;

-- 2. consulta filtrada de productos del menú de comida urbana que se encuentran disponibles y cuyo precio sea menor o igual a 8 dólares
select 
    nombre_producto,
    categoria,
    precio_dolares,
    disponible
from menu_comida_urbana
where disponible = true and precio_dolares <= 8.00
order by precio_dolares asc;

-- 3. reporte estadístico agrupado por categoría de comida con conteos de productos, precio promedio y precio máximo
select 
    categoria,
    count(id_producto) as total_productos,
    round(avg(precio_dolares), 2) as precio_promedio,
    max(precio_dolares) as precio_maximo
from menu_comida_urbana
group by categoria
order by precio_promedio desc;

-- 4. top 5 de platos más costosos en el menú de comida urbana
select 
    nombre_producto,
    categoria,
    precio_dolares
from menu_comida_urbana
order by precio_dolares desc
limit 5;

-- 5. consulta de resumen de ventas acumuladas por cliente ordenadas por el total pagado de forma descendente
select 
    cliente_nombre,
    count(id_orden) as cantidad_pedidos,
    sum(total_pagar) as total_gastado_dolares,
    max(fecha_orden) as ultima_fecha_orden
from ordenes_pedido
group by cliente_nombre
order by total_gastado_dolares desc;