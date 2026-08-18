USE campuslands_mysql;

SELECT
    id,
    titulo,
    fecha_estreno,
    duracion_minutos,
    puntuacion
FROM vista_peliculas_activas
ORDER BY puntuacion DESC;

SELECT
    titulo,
    fecha_estreno,
    puntuacion
FROM vista_peliculas_activas
WHERE puntuacion >= 8.5
ORDER BY puntuacion DESC;

SELECT
    titulo,
    fecha_estreno,
    duracion_minutos
FROM vista_peliculas_activas
WHERE fecha_estreno >= '2020-01-01'
ORDER BY fecha_estreno DESC;

SELECT
    COUNT(*) AS total_peliculas_activas,
    AVG(puntuacion) AS puntuacion_promedio
FROM vista_peliculas_activas;

SELECT
    titulo,
    puntuacion,
    duracion_minutos
FROM vista_peliculas_activas
ORDER BY duracion_minutos DESC
LIMIT 5;