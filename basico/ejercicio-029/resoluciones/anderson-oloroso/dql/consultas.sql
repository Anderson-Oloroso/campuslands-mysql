USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio_unitario descendentemente
SELECT accesorio_id, nombre_producto, categoria, stock, precio_unitario, estado
FROM accesorios_market
ORDER BY precio_unitario DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT accesorio_id, nombre_producto, categoria, precio_unitario
FROM accesorios_market
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de precio_unitario
SELECT categoria, COUNT(*) AS total_registros, AVG(precio_unitario) AS promedio_valor
FROM accesorios_market
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio_unitario mayor a 2000
SELECT accesorio_id, nombre_producto, categoria, precio_unitario
FROM accesorios_market
WHERE precio_unitario > 2000.00
ORDER BY precio_unitario ASC;

-- 5. Seleccionar los 5 mejores registros según precio_unitario
SELECT accesorio_id, nombre_producto, categoria, precio_unitario
FROM accesorios_market
ORDER BY precio_unitario DESC
LIMIT 5;
