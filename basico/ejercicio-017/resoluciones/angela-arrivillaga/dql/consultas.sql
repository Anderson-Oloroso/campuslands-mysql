USE tienda_ropa_db;

-- 1. Listado completo de articulos con su categoria, talla, precio exacto y stock actual
SELECT p.nombre_articulo, c.nombre_categoria AS categoria, p.talla, p.precio_unitario, p.stock_actual, p.estado_disponibilidad
FROM productos_ropa p
JOIN categorias_ropa c ON p.id_categoria = c.id_categoria
ORDER BY p.precio_unitario DESC;

-- 2. Conteo de productos, valor total del inventario y stock acumulado agrupados por categoria
SELECT c.nombre_categoria AS categoria, COUNT(p.id_producto) AS total_articulos, SUM(p.stock_actual) AS stock_total, ROUND(AVG(p.precio_unitario), 2) AS precio_promedio
FROM categorias_ropa c
LEFT JOIN productos_ropa p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY stock_total DESC;

-- 3. Productos que se encuentran en estado 'disponible' o 'en_oferta' con stock mayor a cero
SELECT p.nombre_articulo, c.nombre_categoria AS categoria, p.precio_unitario, p.stock_actual, p.estado_disponibilidad
FROM productos_ropa p
JOIN categorias_ropa c ON p.id_categoria = c.id_categoria
WHERE p.estado_disponibilidad IN ('disponible', 'en_oferta') AND p.stock_actual > 0
ORDER BY p.stock_actual DESC;

-- 4. Top 5 de articulos mas costosos de todo el inventario de la tienda de ropa
SELECT p.nombre_articulo, c.nombre_categoria AS categoria, p.talla, p.precio_unitario, p.estado_disponibilidad
FROM productos_ropa p
JOIN categorias_ropa c ON p.id_categoria = c.id_categoria
ORDER BY p.precio_unitario DESC
LIMIT 5;

-- 5. Calculo del valor monetario total invertido en stock por cada articulo (precio unitario por stock actual)
SELECT p.nombre_articulo, p.precio_unitario, p.stock_actual, (p.precio_unitario * p.stock_actual) AS valor_total_en_inventario
FROM productos_ropa p
WHERE p.stock_actual > 0
ORDER BY valor_total_en_inventario DESC;