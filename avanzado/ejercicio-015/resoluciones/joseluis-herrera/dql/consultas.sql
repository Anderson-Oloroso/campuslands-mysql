USE campuslands_mysql;

SELECT
    titulo AS videojuego,
    plataforma,
    genero,
    precio,
    puntaje
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY puntaje DESC;

SELECT
    titulo AS videojuego,
    plataforma,
    puntaje
FROM videojuegos
WHERE puntaje >= 9.5
ORDER BY puntaje DESC;

SELECT
    titulo AS videojuego,
    fecha_lanzamiento,
    plataforma,
    puntaje
FROM videojuegos
WHERE fecha_lanzamiento >= '2020-01-01'
ORDER BY fecha_lanzamiento DESC;

SELECT
    plataforma,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM videojuegos
GROUP BY plataforma
ORDER BY total_videojuegos DESC;

SELECT
    titulo AS videojuego,
    plataforma,
    puntaje
FROM videojuegos
ORDER BY puntaje DESC
LIMIT 5;

EXPLAIN
SELECT
    titulo,
    plataforma,
    precio,
    puntaje
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY puntaje DESC;


SHOW INDEX FROM videojuegos;