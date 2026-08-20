USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    JSON_UNQUOTE(
        JSON_EXTRACT(detalles, '$.director')
    ) AS director,
    JSON_EXTRACT(
        detalles, '$.duracion_minutos'
    ) AS duracion_minutos
FROM peliculas
ORDER BY duracion_minutos DESC;

SELECT
    titulo AS pelicula,
    estado,
    JSON_UNQUOTE(
        JSON_EXTRACT(detalles, '$.director')
    ) AS director
FROM peliculas
WHERE estado = 'activo'
  AND JSON_CONTAINS(
      detalles->'$.plataformas',
      '"Prime Video"'
  );

SELECT
    titulo AS pelicula,
    JSON_LENGTH(
        detalles->'$.idiomas'
    ) AS cantidad_idiomas
FROM peliculas
WHERE JSON_LENGTH(
    detalles->'$.idiomas'
) > 2
ORDER BY cantidad_idiomas DESC;

SELECT
    titulo AS pelicula,
    categoria,
    puntaje,
    JSON_UNQUOTE(
        JSON_EXTRACT(detalles, '$.director')
    ) AS director,
    JSON_EXTRACT(
        detalles, '$.duracion_minutos'
    ) AS duracion_minutos
FROM peliculas
WHERE estado = 'activo'
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    titulo AS pelicula,
    anio,
    puntaje,
    JSON_UNQUOTE(
        JSON_EXTRACT(detalles, '$.director')
    ) AS director
FROM peliculas
WHERE JSON_UNQUOTE(
    JSON_EXTRACT(detalles, '$.director')
) = 'Ari Aster'
ORDER BY anio DESC;