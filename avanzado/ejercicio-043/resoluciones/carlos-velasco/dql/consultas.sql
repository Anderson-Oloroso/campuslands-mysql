USE campuslands_mysql;

-- 1. Mostrar la informacion JSON completa de las peliculas activas.
SELECT
    titulo,
    estado,
    informacion
FROM peliculas_miedo
WHERE estado = 'activa';


-- 2. Extraer datos especificos almacenados dentro del JSON.
SELECT
    titulo,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.pais')) AS pais,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.idioma')) AS idioma,
    JSON_EXTRACT(informacion, '$.duracion_minutos') AS duracion_minutos
FROM peliculas_miedo
ORDER BY titulo;


-- 3. Buscar peliculas producidas en Colombia.
SELECT
    titulo,
    director,
    genero,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.pais')) AS pais
FROM peliculas_miedo
WHERE JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.pais')) = 'Colombia'
ORDER BY titulo;


-- 4. Mostrar peliculas con una duracion superior a 110 minutos.
SELECT
    titulo,
    genero,
    JSON_EXTRACT(informacion, '$.duracion_minutos') AS duracion_minutos
FROM peliculas_miedo
WHERE CAST(
    JSON_UNQUOTE(
        JSON_EXTRACT(informacion, '$.duracion_minutos')
    ) AS UNSIGNED
) > 110
ORDER BY duracion_minutos DESC;


-- 5. Buscar peliculas disponibles en HorrorMax.
SELECT
    titulo,
    genero,
    estado,
    informacion
FROM peliculas_miedo
WHERE JSON_CONTAINS(
    JSON_EXTRACT(informacion, '$.plataformas'),
    JSON_QUOTE('HorrorMax')
)
ORDER BY titulo;


-- 6. Mostrar el ranking de peliculas activas por puntuacion.
SELECT
    titulo,
    genero,
    puntuacion,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.pais')) AS pais
FROM peliculas_miedo
WHERE estado = 'activa'
ORDER BY puntuacion DESC
LIMIT 5;


-- 7. Contar peliculas activas por pais almacenado en JSON.
SELECT
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.pais')) AS pais,
    COUNT(*) AS total_peliculas
FROM peliculas_miedo
WHERE estado = 'activa'
GROUP BY pais
ORDER BY total_peliculas DESC, pais ASC;