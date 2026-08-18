-- 1. Ver todas las categorías
SELECT * FROM `ejercicio-016-int-categorias`;

-- 2. Ver todos los platos
SELECT * FROM `ejercicio-016-int-platos`;

-- 3. Platos con su categoría (INNER JOIN)
SELECT p.nombre AS plato, c.nombre AS categoria, p.precio
FROM `ejercicio-016-int-platos` p
INNER JOIN `ejercicio-016-int-categorias` c ON p.categoria_id = c.id;