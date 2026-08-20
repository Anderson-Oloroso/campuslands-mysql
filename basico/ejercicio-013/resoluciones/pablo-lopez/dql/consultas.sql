USE catalogo_peliculas_miedo;

SELECT
    id_pelicula,
    titulo,
    genero,
    puntuacion,
    estado
FROM peliculas
WHERE estado = 'disponible';

SELECT
    titulo,
    director,
    genero,
    estado
FROM peliculas
WHERE estado = 'no_disponible';

SELECT
    titulo,
    genero,
    puntuacion
FROM peliculas
WHERE estado = 'disponible'
ORDER BY puntuacion DESC;

SELECT
    titulo,
    director,
    puntuacion
FROM peliculas
WHERE estado = 'disponible'
ORDER BY puntuacion DESC
LIMIT 5;

SELECT
    genero,
    COUNT(*) AS total_peliculas,
    AVG(puntuacion) AS puntuacion_promedio
FROM peliculas
WHERE estado = 'disponible'
GROUP BY genero
ORDER BY puntuacion_promedio DESC;

SELECT
    titulo,
    genero,
    duracion_minutos,
    puntuacion
FROM peliculas
WHERE estado = 'disponible'
  AND duracion_minutos >= 110
ORDER BY duracion_minutos DESC;

SELECT
    COUNT(*) AS total_peliculas,
    SUM(CASE WHEN estado = 'disponible' THEN 1 ELSE 0 END) AS disponibles,
    SUM(CASE WHEN estado = 'no_disponible' THEN 1 ELSE 0 END) AS no_disponibles,
    AVG(puntuacion) AS puntuacion_promedio
FROM peliculas;