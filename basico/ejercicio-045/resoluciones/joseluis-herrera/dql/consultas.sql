USE campuslands_mysql;

SELECT
    v.titulo,
    c.nombre AS categoria,
    v.plataforma,
    v.precio,
    v.puntaje,
    v.estado
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
ORDER BY v.titulo;

SELECT
    v.titulo,
    c.nombre AS categoria,
    v.precio,
    v.puntaje
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
WHERE v.estado = 'disponible'
ORDER BY v.puntaje DESC;

SELECT
    c.nombre AS categoria,
    COUNT(v.id_videojuego) AS total_videojuegos,
    ROUND(AVG(v.puntaje), 2) AS puntaje_promedio
FROM categorias AS c
LEFT JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY puntaje_promedio DESC;

SELECT
    v.titulo,
    c.nombre AS categoria,
    v.precio
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
WHERE v.precio < 40
ORDER BY v.precio ASC;

SELECT
    v.titulo,
    c.nombre AS categoria,
    v.puntaje
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
ORDER BY v.puntaje DESC
LIMIT 5;

SELECT
    c.nombre AS categoria,
    COUNT(v.id_videojuego) AS videojuegos_prestados
FROM categorias AS c
INNER JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
WHERE v.estado = 'prestado'
GROUP BY c.id_categoria, c.nombre
ORDER BY videojuegos_prestados DESC;

SELECT
    c.nombre AS categoria,
    ROUND(AVG(v.precio), 2) AS precio_promedio
FROM categorias AS c
INNER JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
GROUP BY c.id_categoria, c.nombre
HAVING AVG(v.precio) > 40
ORDER BY precio_promedio DESC;