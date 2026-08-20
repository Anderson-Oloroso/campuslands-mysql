USE campuslands_mysql;


-- 1. Mostrar todos los equipos junto con su categoría.
SELECT
    e.id_equipo,
    e.nombre AS equipo,
    e.marca,
    c.nombre AS categoria,
    e.precio,
    e.estado
FROM equipos_streaming AS e
INNER JOIN categorias_equipo AS c
    ON e.id_categoria = c.id_categoria
ORDER BY e.nombre ASC;


-- 2. Mostrar únicamente los equipos activos.
SELECT
    e.nombre AS equipo,
    e.marca,
    c.nombre AS categoria,
    e.precio
FROM equipos_streaming AS e
INNER JOIN categorias_equipo AS c
    ON e.id_categoria = c.id_categoria
WHERE e.estado = 'activo'
ORDER BY e.precio DESC;


-- 3. Contar cuántos equipos existen por categoría.
SELECT
    c.nombre AS categoria,
    COUNT(e.id_equipo) AS total_equipos
FROM categorias_equipo AS c
LEFT JOIN equipos_streaming AS e
    ON c.id_categoria = e.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY total_equipos DESC;


-- 4. Calcular el precio promedio de los equipos por categoría.
SELECT
    c.nombre AS categoria,
    COUNT(e.id_equipo) AS total_equipos,
    ROUND(AVG(e.precio), 2) AS precio_promedio
FROM categorias_equipo AS c
INNER JOIN equipos_streaming AS e
    ON c.id_categoria = e.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY precio_promedio DESC;


-- 5. Mostrar los equipos cuyo precio sea superior a 700.
SELECT
    e.nombre AS equipo,
    e.marca,
    c.nombre AS categoria,
    e.precio
FROM equipos_streaming AS e
INNER JOIN categorias_equipo AS c
    ON e.id_categoria = c.id_categoria
WHERE e.precio > 700
ORDER BY e.precio DESC;


-- 6. Mostrar los 5 equipos más económicos.
SELECT
    e.nombre AS equipo,
    c.nombre AS categoria,
    e.precio
FROM equipos_streaming AS e
INNER JOIN categorias_equipo AS c
    ON e.id_categoria = c.id_categoria
ORDER BY e.precio ASC
LIMIT 5;