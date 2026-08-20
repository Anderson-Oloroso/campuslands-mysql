USE restaurante_urbano_db;

-- 1. Listado completo de productos del menu con su categoria, precio y estado ordenados por precio descendente
SELECT p.nombre_producto, c.nombre_categoria AS categoria, p.precio, p.calorias, p.estado_disponibilidad
FROM productos_urbana p
JOIN categorias_menu c ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC;

-- 2. Conteo de productos y precio promedio agrupados por cada categoria del menu
SELECT c.nombre_categoria AS categoria, COUNT(p.id_producto) AS total_productos, ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias_menu c
LEFT JOIN productos_urbana p ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY total_productos DESC;

-- 3. Productos que se encuentran actualmente disponibles en el menu del restaurante
SELECT p.nombre_producto, c.nombre_categoria AS categoria, p.precio, p.estado_disponibilidad
FROM productos_urbana p
JOIN categorias_menu c ON p.id_categoria = c.id_categoria
WHERE p.estado_disponibilidad = 'disponible'
ORDER BY p.precio ASC;

-- 4. Top 5 de productos mas economicos dentro de toda la oferta culinaria urbana
SELECT p.nombre_producto, c.nombre_categoria AS categoria, p.precio, p.calorias
FROM productos_urbana p
JOIN categorias_menu c ON p.id_categoria = c.id_categoria
ORDER BY p.precio ASC
LIMIT 5;

-- 5. Auditoria y resumen del inventario agrupado por estado de disponibilidad
SELECT estado_disponibilidad, COUNT(*) AS cantidad_platos, ROUND(AVG(calorias), 0) AS promedio_calorias
FROM productos_urbana
GROUP BY estado_disponibilidad
ORDER BY cantidad_platos DESC;