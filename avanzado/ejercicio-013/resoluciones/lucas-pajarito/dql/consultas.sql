
-- ============================================================
-- 8. CONSULTA GENERAL DE LAS PELICULAS
-- ============================================================

SELECT
    id,
    titulo_pelicula,
    id_categoria,
    id_director,
    duracion_minutos,
    anio_publicacion,
    informacion_json
FROM peliculas;


-- ============================================================
-- 9. EXTRAER UN DATO ESPECIFICO DEL JSON
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.clasificacion') AS clasificacion
FROM peliculas;


-- ============================================================
-- 10. EXTRAER DATOS JSON SIN COMILLAS
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_UNQUOTE(
        JSON_EXTRACT(informacion_json, '$.pais')
    ) AS pais
FROM peliculas;


-- ============================================================
-- 11. CONSULTAR CALIFICACION
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.calificacion') AS calificacion
FROM peliculas
ORDER BY calificacion DESC;


-- ============================================================
-- 12. FILTRAR PELICULAS CON CALIFICACION MAYOR A 7
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.calificacion') AS calificacion
FROM peliculas
WHERE JSON_EXTRACT(informacion_json, '$.calificacion') > 7
ORDER BY calificacion DESC;


-- ============================================================
-- 13. CONSULTAR PLATAFORMAS
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.plataformas') AS plataformas
FROM peliculas;


-- ============================================================
-- 14. CONSULTAR REPARTO
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.reparto') AS reparto
FROM peliculas;


-- ============================================================
-- 15. COMPROBAR SI UNA PELICULA ESTA EN NETFLIX
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.plataformas') AS plataformas
FROM peliculas
WHERE JSON_CONTAINS(
    informacion_json,
    '"Netflix"',
    '$.plataformas'
);


-- ============================================================
-- 16. COMPROBAR SI UN ACTOR ESTA EN EL REPARTO
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_EXTRACT(informacion_json, '$.reparto') AS reparto
FROM peliculas
WHERE JSON_CONTAINS(
    informacion_json,
    '"Patrick Wilson"',
    '$.reparto'
);


-- ============================================================
-- 17. CONTAR ELEMENTOS DEL REPARTO
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_LENGTH(
        JSON_EXTRACT(informacion_json, '$.reparto')
    ) AS cantidad_actores
FROM peliculas
ORDER BY cantidad_actores DESC;


-- ============================================================
-- 18. EXTRAER LOS ACTORES DEL JSON CON JSON_TABLE
-- ============================================================

SELECT
    p.titulo_pelicula,
    r.actor
FROM peliculas p
JOIN JSON_TABLE(
    p.informacion_json,
    '$.reparto[*]'
    COLUMNS (
        actor VARCHAR(100) PATH '$'
    )
) AS r;


-- ============================================================
-- 19. EXTRAER LAS PLATAFORMAS CON JSON_TABLE
-- ============================================================

SELECT
    p.titulo_pelicula,
    pl.plataforma
FROM peliculas p
JOIN JSON_TABLE(
    p.informacion_json,
    '$.plataformas[*]'
    COLUMNS (
        plataforma VARCHAR(100) PATH '$'
    )
) AS pl;


-- ============================================================
-- 20. MODIFICAR UN DATO DEL JSON
-- ============================================================

UPDATE peliculas
SET informacion_json = JSON_SET(
    informacion_json,
    '$.estado',
    'Disponible'
)
WHERE id = 1;


-- ============================================================
-- 21. AGREGAR NUEVO DATO JSON A VARIAS PELICULAS
-- ============================================================

UPDATE peliculas
SET informacion_json = JSON_SET(
    informacion_json,
    '$.formato',
    'Digital'
)
WHERE anio_publicacion >= 2019;


-- ============================================================
-- 22. CONSULTAR LOS NUEVOS DATOS
-- ============================================================

SELECT
    titulo_pelicula,
    JSON_UNQUOTE(
        JSON_EXTRACT(informacion_json, '$.estado')
    ) AS estado,
    JSON_UNQUOTE(
        JSON_EXTRACT(informacion_json, '$.formato')
    ) AS formato
FROM peliculas;


-- ============================================================
-- 23. CONSULTA CON CATEGORIA Y DIRECTOR + JSON
-- ============================================================

SELECT
    p.titulo_pelicula,
    c.nombre_categoria,
    d.nombre_director,
    p.anio_publicacion,
    JSON_UNQUOTE(
        JSON_EXTRACT(p.informacion_json, '$.clasificacion')
    ) AS clasificacion,
    JSON_EXTRACT(
        p.informacion_json, '$.calificacion'
    ) AS calificacion
FROM peliculas p
INNER JOIN categorias c
    ON p.id_categoria = c.id
INNER JOIN directores d
    ON p.id_director = d.id
ORDER BY calificacion DESC;


-- ============================================================
-- 24. VERIFICAR QUE LA COLUMNA CONTIENE JSON VALIDO
-- ============================================================

SELECT
    id,
    titulo_pelicula,
    JSON_VALID(informacion_json) AS json_valido
FROM peliculas;