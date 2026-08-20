USE campuslands_mysql;

SELECT
    p.nombre AS plato,
    c.nombre AS categoria,
    p.precio,
    p.calorias,
    p.estado
FROM platos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
ORDER BY p.nombre;

SELECT
    p.nombre AS plato,
    c.nombre AS categoria,
    p.precio
FROM platos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE p.estado = 'disponible'
ORDER BY p.precio ASC;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_plato) AS total_platos,
    ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias AS c
INNER JOIN platos AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY precio_promedio DESC;

SELECT
    p.nombre AS plato,
    c.nombre AS categoria,
    p.calorias
FROM platos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE p.calorias < 700
ORDER BY p.calorias ASC;

SELECT
    p.nombre AS plato,
    c.nombre AS categoria,
    p.precio
FROM platos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
ORDER BY p.precio DESC
LIMIT 5;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_plato) AS platos_disponibles
FROM categorias AS c
INNER JOIN platos AS p
    ON c.id_categoria = p.id_categoria
WHERE p.estado = 'disponible'
GROUP BY c.id_categoria, c.nombre
ORDER BY platos_disponibles DESC;

SELECT
    p.nombre AS plato,
    c.nombre AS categoria,
    p.precio,
    p.calorias
FROM platos AS p
INNER JOIN categorias AS c
    ON p.id_categoria = c.id_categoria
WHERE p.precio BETWEEN 20 AND 30
  AND p.calorias < 700
ORDER BY p.precio ASC;