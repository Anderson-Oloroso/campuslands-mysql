USE campuslands_mysql;

SELECT
    id_videojuego,
    titulo,
    genero,
    plataforma,
    precio,
    puntaje,
    estado
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY titulo;

SELECT
    id_videojuego,
    titulo,
    genero,
    puntaje,
    estado
FROM videojuegos
WHERE estado = 'disponible'
  AND puntaje >= 9.00
ORDER BY puntaje DESC;

SELECT
    genero,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY genero
ORDER BY puntaje_promedio DESC;

SELECT
    titulo,
    genero,
    plataforma,
    precio,
    puntaje
FROM videojuegos
WHERE precio BETWEEN 30 AND 60
ORDER BY precio ASC;

SELECT
    titulo,
    genero,
    plataforma,
    puntaje
FROM videojuegos
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    estado,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio
FROM videojuegos
GROUP BY estado
ORDER BY total_videojuegos DESC;

EXPLAIN
SELECT
    id_videojuego,
    titulo,
    genero,
    plataforma,
    precio,
    puntaje,
    estado
FROM videojuegos
WHERE estado = 'disponible'
  AND puntaje >= 9.00
ORDER BY puntaje DESC;

EXPLAIN
SELECT
    id_videojuego,
    titulo,
    genero,
    plataforma,
    precio,
    puntaje,
    estado
FROM videojuegos
WHERE estado = 'disponible';