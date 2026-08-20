use campuslands_mysql;

-- consulta 1: reporte de productos por categoria usando INNER JOIN
select 
    c.nombre_categoria, 
    p.nombre_producto, 
    p.precio_venta, 
    p.stock_actual
from categorias c
inner join productos p on c.id = p.categoria_id
order by c.nombre_categoria, p.precio_venta desc;

-- consulta 2: total de productos disponibles por categoria
select 
    c.nombre_categoria, 
    count(p.id) as total_productos, 
    sum(p.stock_actual) as inventario_total
from categorias c
inner join productos p on c.id = p.categoria_id
where p.estado_producto = 'disponible'
group by c.nombre_categoria;

-- consulta 3: productos mas costosos por categoria (ranking)
select 
    c.nombre_categoria, 
    p.nombre_producto, 
    p.precio_venta
from categorias c
inner join productos p on c.id = p.categoria_id
where p.precio_venta > (select avg(precio_venta) from productos)
order by p.precio_venta desc;

-- consulta 4: listado de productos agotados
select 
    p.nombre_producto, 
    c.nombre_categoria 
from productos p
inner join categorias c on p.categoria_id = c.id
where p.estado_producto = 'agotado';

-- consulta 5: valor total de inventario por categoria
select 
    c.nombre_categoria, 
    sum(p.precio_venta * p.stock_actual) as valor_total_inventario
from categorias c
inner join productos p on c.id = p.categoria_id
group by c.nombre_categoria
order by valor_total_inventario desc;