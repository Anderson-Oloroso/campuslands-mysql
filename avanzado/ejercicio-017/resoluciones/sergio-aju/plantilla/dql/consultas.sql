USE campuslands_mysql;

-- 1. Prueba del procedimiento almacenado de filtrado
-- Muestra camisetas con precio menor o igual a 23.00
CALL sp_filtrar_productos(1, 23.00);

-- 2. Lista general de productos registrados con su categoría
SELECT 
    p.id,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.talla,
    p.precio,
    p.stock
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
ORDER BY p.id ASC;

-- 3. Resumen de inventario y valor total por categoría
SELECT 
    c.nombre AS categoria,
    COUNT(p.id) AS total_prendas,
    SUM(p.stock) AS unidades_totales,
    SUM(p.precio * p.stock) AS valor_inventario
FROM categorias c
INNER JOIN productos p ON c.id = p.categoria_id
GROUP BY c.id, c.nombre;

-- 4. Top 3 prendas más costosas registradas en el sistema
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria,
    p.precio
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
ORDER BY p.precio DESC
LIMIT 3;

-- 5. Control de stock crítico (prendas con menos de 8 unidades disponibles)
SELECT 
    p.nombre AS producto,
    c.nombre AS categoria,
    p.stock
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.stock < 8
ORDER BY p.stock ASC;