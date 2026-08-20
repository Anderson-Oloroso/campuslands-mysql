USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Ranking general de canciones por reproducciones.
-- ============================================================

SELECT
    ROW_NUMBER() OVER (
        ORDER BY reproducciones DESC
    ) AS posicion,
    titulo,
    genero,
    reproducciones
FROM canciones
WHERE estado = 'activa'
ORDER BY reproducciones DESC;


-- ============================================================
-- CONSULTA 2
-- Ranking de canciones dentro de cada genero.
-- Permite comparar canciones sin mezclar los generos.
-- ============================================================

SELECT
    genero,
    titulo,
    reproducciones,
    RANK() OVER (
        PARTITION BY genero
        ORDER BY reproducciones DESC
    ) AS posicion_genero
FROM canciones
WHERE estado = 'activa'
ORDER BY genero, posicion_genero;


-- ============================================================
-- CONSULTA 3
-- Top 2 canciones de cada genero.
-- ============================================================

WITH canciones_rankeadas AS (
    SELECT
        titulo,
        genero,
        reproducciones,
        DENSE_RANK() OVER (
            PARTITION BY genero
            ORDER BY reproducciones DESC
        ) AS posicion
    FROM canciones
    WHERE estado = 'activa'
)
SELECT
    genero,
    titulo,
    reproducciones,
    posicion
FROM canciones_rankeadas
WHERE posicion <= 2
ORDER BY genero, posicion, titulo;


-- ============================================================
-- CONSULTA 4
-- Participacion de cada cancion sobre el total
-- de reproducciones de la playlist.
-- ============================================================

SELECT
    titulo,
    genero,
    reproducciones,
    SUM(reproducciones) OVER () AS reproducciones_totales,
    ROUND(
        reproducciones * 100.0
        / SUM(reproducciones) OVER (),
        2
    ) AS porcentaje_total
FROM canciones
WHERE estado = 'activa'
ORDER BY porcentaje_total DESC;


-- ============================================================
-- CONSULTA 5
-- Comparacion de cada cancion con el promedio
-- de reproducciones de su mismo genero.
-- ============================================================

WITH estadisticas_genero AS (
    SELECT
        titulo,
        genero,
        reproducciones,
        ROUND(
            AVG(reproducciones) OVER (
                PARTITION BY genero
            ),
            2
        ) AS promedio_genero
    FROM canciones
    WHERE estado = 'activa'
)
SELECT
    titulo,
    genero,
    reproducciones,
    promedio_genero,
    ROUND(
        reproducciones - promedio_genero,
        2
    ) AS diferencia_promedio
FROM estadisticas_genero
ORDER BY genero, diferencia_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Comparacion de reproducciones con la cancion
-- anterior dentro del mismo genero.
-- ============================================================

WITH comparacion AS (
    SELECT
        titulo,
        genero,
        reproducciones,
        LAG(reproducciones) OVER (
            PARTITION BY genero
            ORDER BY reproducciones DESC
        ) AS reproducciones_anterior
    FROM canciones
    WHERE estado = 'activa'
)
SELECT
    titulo,
    genero,
    reproducciones,
    reproducciones_anterior,
    CASE
        WHEN reproducciones_anterior IS NULL THEN NULL
        ELSE reproducciones - reproducciones_anterior
    END AS diferencia_reproducciones
FROM comparacion
ORDER BY genero, reproducciones DESC;