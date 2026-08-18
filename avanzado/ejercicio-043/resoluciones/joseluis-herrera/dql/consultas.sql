USE campuslands_mysql;

SELECT
    id,
    titulo,
    puntuacion,
    JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.subgenero')) AS subgenero
FROM peliculas_miedo
WHERE estado = 'activa'
ORDER BY puntuacion DESC;

SELECT
    titulo,
    JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.director')) AS director,
    JSON_EXTRACT(detalles, '$.duracion_minutos') AS duracion_minutos
FROM peliculas_miedo
WHERE JSON_EXTRACT(detalles, '$.duracion_minutos') > 110
ORDER BY duracion_minutos DESC;

SELECT
    JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.subgenero')) AS subgenero,
    COUNT(*) AS total_peliculas,
    AVG(puntuacion) AS puntuacion_promedio
FROM peliculas_miedo
GROUP BY JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.subgenero'))
ORDER BY puntuacion_promedio DESC;

SELECT
    titulo,
    puntuacion,
    JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.director')) AS director
FROM peliculas_miedo
WHERE JSON_CONTAINS(
    JSON_EXTRACT(detalles, '$.caracteristicas'),
    JSON_QUOTE('fantasmas')
)
ORDER BY puntuacion DESC;

SELECT
    titulo,
    anio_estreno,
    JSON_UNQUOTE(JSON_EXTRACT(detalles, '$.subgenero')) AS subgenero,
    puntuacion
FROM peliculas_miedo
WHERE puntuacion >= 8.0
  AND estado = 'activa'
ORDER BY puntuacion DESC
LIMIT 5;