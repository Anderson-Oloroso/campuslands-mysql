-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

-- Consulta A: Obtener todos los clientes y sus compras (incluyendo los que NO han comprado)
SELECT 
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.email,
    p.nombre AS producto_comprado,
    v.cantidad,
    v.fecha_venta
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
LEFT JOIN productos p ON v.producto_id = p.producto_id;

-- Consulta B: Identificar específicamente los clientes que NUNCA han realizado una compra
SELECT 
    c.cliente_id,
    c.nombre AS nombre_cliente,
    c.email
FROM clientes c
LEFT JOIN ventas v ON c.cliente_id = v.cliente_id
WHERE v.venta_id IS NULL;

-- Consulta C: Productos y sus ventas totales (incluyendo productos nunca vendidos)
SELECT 
    p.producto_id,
    p.nombre AS nombre_producto,
    p.precio,
    COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas
FROM productos p
LEFT JOIN ventas v ON p.producto_id = v.producto_id
GROUP BY p.producto_id, p.nombre, p.precio;