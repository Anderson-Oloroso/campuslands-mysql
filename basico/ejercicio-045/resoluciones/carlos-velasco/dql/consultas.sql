USE campuslands_mysql;

-- 1. Mostrar todos los videojuegos junto con su categoría.
SELECT
    v.id_videojuego,
    v.titulo,
    v.plataforma,
    v.precio,
    v.estado,
    c.nombre AS categoria
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
ORDER BY v.titulo;

-- 2. Mostrar únicamente los videojuegos disponibles.
SELECT
    v.titulo,
    v.plataforma,
    v.precio,
    c.nombre AS categoria
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
WHERE v.estado = 'disponible'
ORDER BY v.titulo;

-- 3. Mostrar los videojuegos ordenados del más caro al más económico.
SELECT
    v.titulo,
    v.precio,
    c.nombre AS categoria
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
ORDER BY v.precio DESC;

-- 4. Contar cuántos videojuegos existen en cada categoría.
SELECT
    c.nombre AS categoria,
    COUNT(v.id_videojuego) AS total_videojuegos
FROM categorias AS c
LEFT JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY total_videojuegos DESC;

-- 5. Calcular el precio promedio de los videojuegos por categoría.
SELECT
    c.nombre AS categoria,
    COUNT(v.id_videojuego) AS total_videojuegos,
    ROUND(AVG(v.precio), 2) AS precio_promedio
FROM categorias AS c
INNER JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
GROUP BY c.id_categoria, c.nombre
ORDER BY precio_promedio DESC;