USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Listado de peliculas con informacion extraida del JSON.
-- ============================================================

SELECT
    id_pelicula,
    titulo,
    anio_estreno,
    genero,
    detalles_json->>'$.director' AS director,
    detalles_json->>'$.pais' AS pais,
    detalles_json->>'$.puntuacion' AS puntuacion
FROM peliculas
WHERE estado = 'disponible'
ORDER BY CAST(
    detalles_json->>'$.puntuacion'
    AS DECIMAL(3,1)
) DESC;


-- ============================================================
-- CONSULTA 2
-- Peliculas con puntuacion igual o superior a 8.0.
-- ============================================================

SELECT
    titulo,
    genero,
    detalles_json->>'$.director' AS director,
    CAST(
        detalles_json->>'$.puntuacion'
        AS DECIMAL(3,1)
    ) AS puntuacion
FROM peliculas
WHERE CAST(
    detalles_json->>'$.puntuacion'
    AS DECIMAL(3,1)
) >= 8.0
ORDER BY puntuacion DESC, titulo;


-- ============================================================
-- CONSULTA 3
-- Peliculas que contienen la etiqueta "fantasmas".
-- JSON_CONTAINS permite consultar un valor dentro del array.
-- ============================================================

SELECT
    titulo,
    genero,
    detalles_json->>'$.pais' AS pais,
    detalles_json->>'$.director' AS director
FROM peliculas
WHERE JSON_CONTAINS(
    detalles_json,
    '"fantasmas"',
    '$.etiquetas'
)
ORDER BY titulo;


-- ============================================================
-- CONSULTA 4
-- Cantidad de actores registrados en cada pelicula.
-- ============================================================

SELECT
    titulo,
    JSON_LENGTH(
        detalles_json->'$.actores'
    ) AS cantidad_actores,
    detalles_json->>'$.clasificacion' AS clasificacion
FROM peliculas
ORDER BY cantidad_actores DESC, titulo;


-- ============================================================
-- CONSULTA 5
-- Promedio de puntuacion por pais.
-- ============================================================

SELECT
    detalles_json->>'$.pais' AS pais,
    COUNT(*) AS total_peliculas,
    ROUND(
        AVG(
            CAST(
                detalles_json->>'$.puntuacion'
                AS DECIMAL(3,1)
            )
        ),
        2
    ) AS puntuacion_promedio
FROM peliculas
WHERE estado = 'disponible'
GROUP BY detalles_json->>'$.pais'
ORDER BY puntuacion_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Actores que aparecen en el catalogo y cantidad de peliculas
-- en las que participan.
--
-- JSON_TABLE transforma el array JSON de actores en filas.
-- ============================================================

SELECT
    actores.nombre_actor,
    COUNT(*) AS peliculas_participadas
FROM peliculas AS p
JOIN JSON_TABLE(
    p.detalles_json,
    '$.actores[*]'
    COLUMNS (
        nombre_actor VARCHAR(100) PATH '$'
    )
) AS actores
WHERE p.estado = 'disponible'
GROUP BY actores.nombre_actor
ORDER BY peliculas_participadas DESC, actores.nombre_actor;