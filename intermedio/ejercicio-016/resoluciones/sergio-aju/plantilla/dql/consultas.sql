-- Consultas de negocio utilizando INNER JOIN
-- Ejecuta este archivo después de inserts.sql.

USE campuslands_mysql;

-- 1. Menú completo activo relacionando producto y categoría con formato accesible
SELECT 
    p.id AS producto_id,
    p.nombre AS producto,
    c.nombre AS categoria,
    CONCAT('$ ', FORMAT(p.precio, 2)) AS precio,
    p.puntaje AS calificacion
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado = 'activo' AND c.estado = 'activo'
ORDER BY c.nombre ASC, p.puntaje DESC;

-- 2. Reporte consolidado por categoría con INNER JOIN: conteos, precio promedio y calificación
SELECT 
    c.nombre AS categoria,
    COUNT(p.id) AS total_productos,
    ROUND(AVG(p.precio), 2) AS precio_promedio,
    ROUND(AVG(p.puntaje), 2) AS calificacion_promedio
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado = 'activo'
GROUP BY c.id, c.nombre
ORDER BY calificacion_promedio DESC;

-- 3. Top 5 de platillos mejor calificados con un costo menor o igual a $40.00
SELECT 
    p.nombre AS platillo,
    c.nombre AS categoria,
    p.precio,
    p.puntaje
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado = 'activo' 
  AND p.precio <= 40.00
ORDER BY p.puntaje DESC, p.precio ASC
LIMIT 5;

-- 4. Auditoría de control de calidad: Productos que están en revisión o con calificación menor a 4.0
SELECT 
    p.id AS producto_id,
    p.nombre AS producto,
    c.nombre AS categoria,
    p.precio,
    p.puntaje,
    p.estado AS estado_producto
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado = 'revision' OR p.puntaje < 4.00
ORDER BY p.puntaje ASC;

-- 5. Consulta de distribución de rangos de precio por categoría activa
SELECT 
    c.nombre AS categoria,
    MIN(p.precio) AS precio_minimo,
    MAX(p.precio) AS precio_maximo,
    COUNT(p.id) AS platillos_disponibles
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id
WHERE p.estado = 'activo' AND c.estado = 'activo'
GROUP BY c.id, c.nombre
HAVING COUNT(p.id) >= 2
ORDER BY precio_maximo DESC;