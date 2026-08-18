-- Consultas con LEFT JOIN sobre clientes_tienda y compras_tienda.
USE campuslands_mysql;

-- 1. Todos los clientes con sus compras (o NULL si no tienen ninguna)
SELECT c.nombre, c.ciudad, co.prenda, co.monto
FROM clientes_tienda c
LEFT JOIN compras_tienda co ON co.cliente_id = c.id
ORDER BY c.nombre;

-- 2. Clientes que NO tienen ninguna compra registrada (caso limite del LEFT JOIN)
SELECT c.nombre, c.ciudad
FROM clientes_tienda c
LEFT JOIN compras_tienda co ON co.cliente_id = c.id
WHERE co.id IS NULL;

-- 3. Total gastado por cliente, incluyendo los que gastaron 0 (COALESCE)
SELECT c.nombre, COALESCE(SUM(co.monto), 0) AS total_gastado
FROM clientes_tienda c
LEFT JOIN compras_tienda co ON co.cliente_id = c.id
GROUP BY c.nombre
ORDER BY total_gastado DESC;

-- 4. Cantidad de compras por cliente (0 para quienes no compraron)
SELECT c.nombre, COUNT(co.id) AS cantidad_compras
FROM clientes_tienda c
LEFT JOIN compras_tienda co ON co.cliente_id = c.id
GROUP BY c.nombre
ORDER BY cantidad_compras DESC;

-- 5. Clientes de Guatemala con o sin compras
SELECT c.nombre, co.prenda, co.fecha_compra
FROM clientes_tienda c
LEFT JOIN compras_tienda co ON co.cliente_id = c.id
WHERE c.ciudad = 'Guatemala';
