USE campuslands_mysql;

-- 1. Ranking global de canciones por cantidad de reproducciones.
SELECT
    titulo,
    artista,
    genero,
    reproducciones,
    RANK() OVER (
        ORDER BY reproducciones DESC
    ) AS ranking_global
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY ranking_global, titulo;


-- 2. Ranking de canciones dentro de cada genero.
SELECT
    titulo,
    artista,
    genero,
    reproducciones,
    RANK() OVER (
        PARTITION BY genero
        ORDER BY reproducciones DESC
    ) AS ranking_genero
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY genero, ranking_genero, titulo;


-- 3. Promedio de reproducciones de cada genero junto
--    con las reproducciones de cada cancion.
SELECT
    titulo,
    artista,
    genero,
    reproducciones,
    ROUND(
        AVG(reproducciones) OVER (
            PARTITION BY genero
        ),
        2
    ) AS promedio_genero
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY genero, reproducciones DESC;


-- 4. Total acumulado de reproducciones por genero
--    ordenado cronologicamente.
SELECT
    titulo,
    artista,
    genero,
    fecha_lanzamiento,
    reproducciones,
    SUM(reproducciones) OVER (
        PARTITION BY genero
        ORDER BY fecha_lanzamiento
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS reproducciones_acumuladas
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY genero, fecha_lanzamiento;


-- 5. Comparacion de reproducciones con la cancion
--    anterior dentro del mismo genero.
SELECT
    titulo,
    artista,
    genero,
    fecha_lanzamiento,
    reproducciones,
    LAG(reproducciones) OVER (
        PARTITION BY genero
        ORDER BY fecha_lanzamiento
    ) AS reproducciones_cancion_anterior,
    reproducciones
        - LAG(reproducciones) OVER (
            PARTITION BY genero
            ORDER BY fecha_lanzamiento
        ) AS diferencia_reproducciones
FROM canciones_playlist
WHERE estado = 'activa'
ORDER BY genero, fecha_lanzamiento;


-- 6. Top 3 de canciones de cada genero.
SELECT
    titulo,
    artista,
    genero,
    reproducciones,
    ranking_genero
FROM (
    SELECT
        titulo,
        artista,
        genero,
        reproducciones,
        ROW_NUMBER() OVER (
            PARTITION BY genero
            ORDER BY reproducciones DESC
        ) AS ranking_genero
    FROM canciones_playlist
    WHERE estado = 'activa'
) AS ranking
WHERE ranking_genero <= 3
ORDER BY genero, ranking_genero;