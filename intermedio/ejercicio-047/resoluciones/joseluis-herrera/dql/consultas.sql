USE campuslands_mysql;

SELECT
    c.nombre AS categoria,
    p.nombre AS prenda,
    p.talla,
    p.precio,
    p.stock
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
ORDER BY c.nombre, p.nombre;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_prenda) AS total_prendas
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY total_prendas DESC;

SELECT
    c.nombre AS categoria,
    ROUND(AVG(p.precio), 2) AS precio_promedio
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY precio_promedio DESC;

SELECT
    c.nombre AS categoria,
    p.nombre AS prenda,
    p.precio
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
WHERE p.precio < 100
   OR p.id_prenda IS NULL
ORDER BY c.nombre, p.precio;

SELECT
    c.nombre AS categoria,
    COALESCE(SUM(p.stock), 0) AS unidades_disponibles
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY unidades_disponibles DESC;

SELECT
    c.nombre AS categoria,
    COUNT(p.id_prenda) AS total_prendas
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
GROUP BY c.id_categoria, c.nombre
HAVING COUNT(p.id_prenda) = 0
ORDER BY c.nombre;

SELECT
    c.nombre AS categoria,
    p.nombre AS prenda,
    p.stock
FROM categorias AS c
LEFT JOIN prendas AS p
    ON c.id_categoria = p.id_categoria
WHERE p.stock < 10
   OR p.id_prenda IS NULL
ORDER BY c.nombre, p.stock;