USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Ranking de jugadores por cantidad de victorias.
-- ============================================================

WITH resultados AS (
    SELECT
        jugador1_id AS id_jugador,
        CASE
            WHEN puntos_jugador1 > puntos_jugador2 THEN 1
            ELSE 0
        END AS victoria
    FROM partidos
    WHERE estado = 'finalizado'

    UNION ALL

    SELECT
        jugador2_id AS id_jugador,
        CASE
            WHEN puntos_jugador2 > puntos_jugador1 THEN 1
            ELSE 0
        END AS victoria
    FROM partidos
    WHERE estado = 'finalizado'
),
ranking AS (
    SELECT
        id_jugador,
        COUNT(*) AS partidos_jugados,
        SUM(victoria) AS victorias
    FROM resultados
    GROUP BY id_jugador
)
SELECT
    j.id_jugador,
    j.nombre,
    j.nivel,
    r.partidos_jugados,
    r.victorias
FROM ranking AS r
INNER JOIN jugadores AS j
    ON j.id_jugador = r.id_jugador
ORDER BY r.victorias DESC, r.partidos_jugados DESC, j.nombre;


-- ============================================================
-- CONSULTA 2
-- Top 5 jugadores con mayor cantidad de puntos obtenidos.
-- ============================================================

WITH puntos AS (
    SELECT
        jugador1_id AS id_jugador,
        puntos_jugador1 AS puntos
    FROM partidos
    WHERE estado = 'finalizado'

    UNION ALL

    SELECT
        jugador2_id AS id_jugador,
        puntos_jugador2 AS puntos
    FROM partidos
    WHERE estado = 'finalizado'
),
totales AS (
    SELECT
        id_jugador,
        SUM(puntos) AS puntos_totales
    FROM puntos
    GROUP BY id_jugador
)
SELECT
    ROW_NUMBER() OVER (
        ORDER BY t.puntos_totales DESC
    ) AS posicion,
    j.nombre,
    j.nivel,
    t.puntos_totales
FROM totales AS t
INNER JOIN jugadores AS j
    ON j.id_jugador = t.id_jugador
ORDER BY t.puntos_totales DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 3
-- Promedio de puntos obtenidos por jugador.
-- ============================================================

WITH puntos AS (
    SELECT
        jugador1_id AS id_jugador,
        puntos_jugador1 AS puntos
    FROM partidos
    WHERE estado = 'finalizado'

    UNION ALL

    SELECT
        jugador2_id AS id_jugador,
        puntos_jugador2 AS puntos
    FROM partidos
    WHERE estado = 'finalizado'
)
SELECT
    j.nombre,
    j.nivel,
    COUNT(*) AS participaciones,
    ROUND(AVG(p.puntos), 2) AS promedio_puntos
FROM puntos AS p
INNER JOIN jugadores AS j
    ON j.id_jugador = p.id_jugador
GROUP BY
    j.id_jugador,
    j.nombre,
    j.nivel
ORDER BY promedio_puntos DESC;


-- ============================================================
-- CONSULTA 4
-- Partidos finalizados y diferencia de puntos.
-- ============================================================

WITH partidos_finalizados AS (
    SELECT
        id_partido,
        jugador1_id,
        jugador2_id,
        puntos_jugador1,
        puntos_jugador2,
        fecha_partido,
        ABS(puntos_jugador1 - puntos_jugador2) AS diferencia_puntos
    FROM partidos
    WHERE estado = 'finalizado'
)
SELECT
    pf.id_partido,
    j1.nombre AS jugador1,
    j2.nombre AS jugador2,
    pf.puntos_jugador1,
    pf.puntos_jugador2,
    pf.diferencia_puntos,
    pf.fecha_partido
FROM partidos_finalizados AS pf
INNER JOIN jugadores AS j1
    ON j1.id_jugador = pf.jugador1_id
INNER JOIN jugadores AS j2
    ON j2.id_jugador = pf.jugador2_id
ORDER BY pf.diferencia_puntos DESC, pf.fecha_partido;


-- ============================================================
-- CONSULTA 5
-- Jugadores activos con al menos una victoria.
-- ============================================================

WITH victorias AS (
    SELECT
        jugador1_id AS id_jugador
    FROM partidos
    WHERE estado = 'finalizado'
      AND puntos_jugador1 > puntos_jugador2

    UNION ALL

    SELECT
        jugador2_id AS id_jugador
    FROM partidos
    WHERE estado = 'finalizado'
      AND puntos_jugador2 > puntos_jugador1
),
resumen AS (
    SELECT
        id_jugador,
        COUNT(*) AS victorias
    FROM victorias
    GROUP BY id_jugador
)
SELECT
    j.nombre,
    j.nivel,
    r.victorias
FROM resumen AS r
INNER JOIN jugadores AS j
    ON j.id_jugador = r.id_jugador
WHERE j.estado = 'activo'
ORDER BY r.victorias DESC, j.nombre;


-- ============================================================
-- CONSULTA 6
-- Resumen de partidos por estado.
-- ============================================================

WITH resumen_partidos AS (
    SELECT
        estado,
        COUNT(*) AS total_partidos,
        AVG(puntos_jugador1 + puntos_jugador2) AS promedio_puntos_totales
    FROM partidos
    GROUP BY estado
)
SELECT
    estado,
    total_partidos,
    ROUND(promedio_puntos_totales, 2) AS promedio_puntos_totales
FROM resumen_partidos
ORDER BY total_partidos DESC;