USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM vista_peliculas_activas
ORDER BY fecha_estreno ASC;

SELECT
    titulo AS pelicula,
    saga,
    puntaje
FROM vista_top_peliculas
ORDER BY puntaje DESC;

SELECT
    titulo AS pelicula,
    fecha_estreno,
    puntaje
FROM vista_peliculas_activas
WHERE saga = 'Star Wars'
ORDER BY fecha_estreno ASC;

SELECT
    saga,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM vista_peliculas_activas
GROUP BY saga
ORDER BY promedio_puntaje DESC;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM vista_peliculas_activas
ORDER BY puntaje DESC
LIMIT 5;