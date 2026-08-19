USE tienda_ropa_db;

-- 1. Reporte completo utilizando LEFT JOIN para asegurar la inclusion de todas las categorias (incluso aquellas sin prendas asignadas)
SELECT c.nombre_categoria AS categoria, c.descripcion_categoria, p.codigo_prenda, p.nombre_prenda, CONCAT('$', FORMAT(p.precio, 2)) AS precio_usd, p.stock, p.estado_prenda
FROM categorias_ropa c
LEFT JOIN prendas_tienda p ON c.id_categoria = p.id_categoria
ORDER BY c.nombre_categoria, p.precio DESC;

-- 2. Reporte estadístico agrupado por categoría mediante LEFT JOIN calculando el total de prendas, inventario total y precio promedio por seccion
SELECT c.nombre_categoria AS categoria, COUNT(p.id_prenda) AS total_prendas, SUM(p.stock) AS inventario_total, CONCAT('$', FORMAT(COALESCE(AVG(p.precio), 0), 2)) AS precio_promedio
FROM categorias_ropa c
LEFT JOIN prendas_tienda p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY total_prendas DESC;

-- 3. Identificar categorías vacías o sin inventario de prendas utilizando LEFT JOIN y la condicion IS NULL
SELECT c.id_categoria, c.nombre_categoria AS categoria_sin_prendas, c.descripcion_categoria
FROM categorias_ropa c
LEFT JOIN prendas_tienda p ON c.id_categoria = p.id_categoria
WHERE p.id_prenda IS NULL;

-- 4. Reporte de prendas en estado 'oferta' o con stock menor a 15 unidades cruzado con su categoría mediante LEFT JOIN
SELECT p.codigo_prenda, p.nombre_prenda, c.nombre_categoria AS categoria, p.precio, p.stock, p.estado_prenda
FROM prendas_tienda p
LEFT JOIN categorias_ropa c ON p.id_categoria = c.id_categoria
WHERE p.estado_prenda = 'oferta' OR p.stock < 15
ORDER BY p.stock ASC;

-- 5. Análisis de valoración de inventario total (Precio * Stock) agrupado por categoría utilizando LEFT JOIN y agregaciones
SELECT c.nombre_categoria AS categoria, COUNT(p.id_prenda) AS variedad_prendas, SUM(p.stock) AS unidades_totales, CONCAT('$', FORMAT(SUM(p.precio * p.stock), 2)) AS valor_total_inventario
FROM categorias_ropa c
LEFT JOIN prendas_tienda p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY SUM(p.precio * p.stock) DESC;