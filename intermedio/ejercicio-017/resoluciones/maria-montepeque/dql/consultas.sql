USE campuslands_mysql;

-- 1. Todos los productos con sus ventas, incluyendo los que nunca se han vendido
SELECT pr.nombre AS producto, pr.categoria, v.cliente_nombre, v.cantidad, v.fecha_venta
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
ORDER BY pr.nombre;

-- 2. Productos que nunca se han vendido
SELECT pr.nombre AS producto, pr.categoria, pr.precio
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
WHERE v.id_venta IS NULL;

-- 3. Unidades e ingresos totales por producto (0 si no se ha vendido)
SELECT pr.nombre AS producto,
       COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas,
       COALESCE(SUM(v.cantidad * pr.precio), 0) AS ingresos
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY ingresos DESC;

-- 4. Ingresos totales por categoria
SELECT pr.categoria, COALESCE(SUM(v.cantidad * pr.precio), 0) AS ingresos_categoria
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
GROUP BY pr.categoria
ORDER BY ingresos_categoria DESC;

-- 5. Historial de ventas con detalle de producto, ordenado por fecha
SELECT v.id_venta, pr.nombre AS producto, v.cliente_nombre, v.cantidad, v.fecha_venta
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
WHERE v.id_venta IS NOT NULL
ORDER BY v.fecha_venta;

-- 6. Ranking de productos por unidades vendidas (incluye los que tienen 0)
SELECT pr.nombre AS producto, COALESCE(SUM(v.cantidad), 0) AS unidades_vendidas
FROM productos_intermedio pr
LEFT JOIN ventas_intermedio v ON v.id_producto = pr.id_producto
GROUP BY pr.nombre
ORDER BY unidades_vendidas DESC
LIMIT 5;
