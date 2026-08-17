USE campuslands_mysql;

-- 1. Todos los productos con sus ventas, incluyendo los que aun no se han vendido
SELECT p.nombre, p.categoria, v.cantidad, v.precio_unitario, v.fecha
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
ORDER BY p.nombre;

-- 2. Productos que nunca se han vendido
SELECT p.nombre, p.categoria
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
WHERE v.id_venta IS NULL;

-- 3. Total de unidades vendidas por producto (0 si nunca se ha vendido)
SELECT p.nombre, COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY unidades_vendidas DESC;

-- 4. Ingresos totales por producto (0 si nunca se ha vendido)
SELECT p.nombre, COALESCE(SUM(v.cantidad * v.precio_unitario), 0) AS ingresos_totales
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY ingresos_totales DESC;

-- 5. Precio unitario promedio de venta por producto (NULL si nunca se ha vendido)
SELECT p.nombre, ROUND(AVG(v.precio_unitario), 1) AS precio_promedio_venta
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY precio_promedio_venta DESC;

-- 6. Ranking completo de productos por unidades vendidas, incluyendo los que tienen 0
SELECT p.nombre, COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas
FROM productos_intermedio p
LEFT JOIN ventas_intermedio v ON v.id_producto = p.id_producto
GROUP BY p.nombre
ORDER BY unidades_vendidas DESC, p.nombre;
