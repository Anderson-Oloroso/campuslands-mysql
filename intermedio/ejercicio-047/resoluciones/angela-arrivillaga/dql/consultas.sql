USE campuslands_mysql;

-- 1. Listar todas las categorías y sus productos (incluye categorías sin productos)
SELECT c.nombre_categoria, p.nombre_producto
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id;

-- 2. Identificar productos huérfanos (sin categoría asignada)
SELECT nombre_producto, 'Sin categoría' AS categoria
FROM productos
WHERE categoria_id IS NULL;

-- 3. Conteo de productos por categoría usando LEFT JOIN
SELECT c.nombre_categoria, COUNT(p.id) AS total_productos
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.nombre_categoria;

-- 4. Valor total de inventario por categoría (incluye categorías vacías como 0)
SELECT c.nombre_categoria, IFNULL(SUM(p.precio_unidad * p.stock), 0) AS valor_inventario
FROM categorias c
LEFT JOIN productos p ON c.id = p.categoria_id
GROUP BY c.nombre_categoria;

-- 5. Listado de productos disponibles con su categoría (si la tiene)
SELECT p.nombre_producto, IFNULL(c.nombre_categoria, 'Sin clasificar') AS categoria
FROM productos p
LEFT JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado_venta = 'disponible'
ORDER BY p.nombre_producto ASC;