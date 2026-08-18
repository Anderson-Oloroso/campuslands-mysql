-- 1. Ver todos los productos con su categoría (LEFT JOIN)
SELECT p.nombre AS producto, c.nombre AS categoria, p.precio
FROM `ejercicio-017-int-productos` p
LEFT JOIN `ejercicio-017-int-categorias` c ON p.categoria_id = c.id;

-- 2. Productos sin categoría
SELECT nombre, precio FROM `ejercicio-017-int-productos` WHERE categoria_id IS NULL;

-- 3. Conteo de productos por categoría
SELECT c.nombre, COUNT(p.id) AS total
FROM `ejercicio-017-int-categorias` c
LEFT JOIN `ejercicio-017-int-productos` p ON c.id = p.categoria_id
GROUP BY c.id;