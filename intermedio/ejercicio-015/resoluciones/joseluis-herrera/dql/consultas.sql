USE campuslands_mysql;

SELECT
    titulo AS videojuego,
    plataforma,
    genero,
    precio,
    puntaje
FROM videojuegos
WHERE estado = 'disponible'
ORDER BY titulo;

SELECT
    titulo AS videojuego,
    plataforma,
    puntaje
FROM videojuegos
WHERE puntaje >= 9.0
ORDER BY puntaje DESC;

SELECT
    titulo AS videojuego,
    plataforma,
    precio
FROM videojuegos
ORDER BY precio DESC
LIMIT 5;

SELECT
    plataforma,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM videojuegos
GROUP BY plataforma
ORDER BY total_videojuegos DESC;

SELECT
    genero,
    COUNT(*) AS total_videojuegos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM videojuegos
GROUP BY genero
ORDER BY precio_promedio DESC;

SELECT
    titulo AS videojuego,
    fecha_lanzamiento,
    plataforma,
    puntaje
FROM videojuegos
WHERE fecha_lanzamiento >= '2020-01-01'
ORDER BY fecha_lanzamiento DESC;