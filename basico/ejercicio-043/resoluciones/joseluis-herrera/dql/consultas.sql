USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    director,
    subgenero,
    anio_estreno AS estreno,
    calificacion
FROM peliculas
WHERE estado = 'disponible'
ORDER BY titulo;

SELECT
    titulo AS pelicula,
    subgenero,
    calificacion
FROM peliculas
WHERE estado = 'no_disponible'
ORDER BY calificacion DESC;

SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas
GROUP BY estado
ORDER BY total_peliculas DESC;

SELECT
    titulo AS pelicula,
    subgenero,
    calificacion,
    duracion_minutos AS duracion
FROM peliculas
WHERE estado = 'disponible'
ORDER BY calificacion DESC
LIMIT 5;