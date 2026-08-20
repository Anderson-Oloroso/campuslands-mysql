USE campuslands_mysql;

-- 1. Analizar el plan de ejecución de la consulta de videojuegos disponibles.
EXPLAIN
SELECT
    v.titulo,
    v.plataforma,
    v.precio
FROM videojuegos AS v
WHERE v.estado = 'disponible'
ORDER BY v.precio DESC;

-- 2. Obtener videojuegos disponibles utilizando el índice compuesto.
EXPLAIN
SELECT
    v.titulo,
    v.plataforma,
    v.precio,
    c.nombre AS categoria
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
WHERE v.estado = 'disponible'
  AND v.id_categoria = 4
ORDER BY v.precio DESC;

-- 3. Mostrar los videojuegos disponibles por categoría.
SELECT
    c.nombre AS categoria,
    COUNT(v.id_videojuego) AS total_disponibles
FROM categorias AS c
INNER JOIN videojuegos AS v
    ON c.id_categoria = v.id_categoria
WHERE v.estado = 'disponible'
GROUP BY c.id_categoria, c.nombre
ORDER BY total_disponibles DESC;

-- 4. Consultar videojuegos de una plataforma específica.
EXPLAIN
SELECT
    v.titulo,
    v.plataforma,
    v.precio,
    v.estado
FROM videojuegos AS v
WHERE v.plataforma = 'PC'
ORDER BY v.precio DESC;

-- 5. Obtener los videojuegos con precio superior al promedio.
SELECT
    v.titulo,
    v.plataforma,
    v.precio
FROM videojuegos AS v
WHERE v.precio > (
    SELECT AVG(precio)
    FROM videojuegos
)
ORDER BY v.precio DESC;

-- 6. Obtener el videojuego más costoso de cada categoría.
SELECT
    c.nombre AS categoria,
    v.titulo,
    v.precio
FROM videojuegos AS v
INNER JOIN categorias AS c
    ON v.id_categoria = c.id_categoria
WHERE v.precio = (
    SELECT MAX(v2.precio)
    FROM videojuegos AS v2
    WHERE v2.id_categoria = v.id_categoria
)
ORDER BY v.precio DESC;

-- 7. Ranking de videojuegos por precio.
SELECT
    ROW_NUMBER() OVER (ORDER BY v.precio DESC) AS posicion,
    v.titulo,
    v.plataforma,
    v.precio
FROM videojuegos AS v
ORDER BY posicion;

-- 8. Consultar estadísticas generales de la biblioteca.
SELECT
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM videojuegos;