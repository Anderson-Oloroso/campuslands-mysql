USE campuslands_mysql;

-- 1. Ver el estado actual del inventario de productos
SELECT 
    id,
    nombre AS producto,
    precio,
    stock
FROM productos
ORDER BY stock ASC;

-- 2. Ver pedidos registrados con su total y estado
SELECT 
    id AS pedido_num,
    cliente,
    total,
    estado
FROM pedidos;

-- 3. Detalle completo de productos vendidos en cada pedido
SELECT 
    pedidos.id AS pedido_num,
    pedidos.cliente,
    productos.nombre AS producto,
    detalle_pedidos.cantidad,
    detalle_pedidos.subtotal
FROM detalle_pedidos
INNER JOIN pedidos ON detalle_pedidos.pedido_id = pedidos.id
INNER JOIN productos ON detalle_pedidos.producto_id = productos.id;

-- 4. Total de ventas acumuladas por pedidos completados
SELECT 
    COUNT(*) AS total_pedidos,
    SUM(total) AS venta_total,
    AVG(total) AS ticket_promedio
FROM pedidos
WHERE estado = 'completado';

-- 5. Productos con stock bajo (menos de 20 unidades)
SELECT 
    nombre AS producto,
    stock
FROM productos
WHERE stock < 20
ORDER BY stock ASC;