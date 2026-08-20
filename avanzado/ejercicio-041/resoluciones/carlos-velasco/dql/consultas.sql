USE campuslands_mysql;

-- 1. Estadísticas generales de los jugadores activos.
WITH estadisticas AS (
    SELECT
        COUNT(*) AS total_jugadores,
        ROUND(AVG(edad), 2) AS edad_promedio,
        ROUND(AVG(ranking), 2) AS ranking_promedio,
        SUM(partidos_jugados) AS partidos_totales,
        SUM(partidos_ganados) AS victorias_totales
    FROM jugadores
    WHERE estado = 'activo'
)
SELECT
    total_jugadores,
    edad_promedio,
    ranking_promedio,
    partidos_totales,
    victorias_totales
FROM estadisticas;


-- 2. Ranking de jugadores activos mediante un CTE.
WITH jugadores_activos AS (
    SELECT
        id_jugador,
        nombre,
        ranking,
        nivel,
        partidos_ganados
    FROM jugadores
    WHERE estado = 'activo'
)
SELECT
    nombre,
    ranking,
    nivel,
    partidos_ganados
FROM jugadores_activos
ORDER BY ranking ASC
LIMIT 5;


-- 3. Porcentaje de victorias de cada jugador activo.
WITH rendimiento AS (
    SELECT
        nombre,
        partidos_jugados,
        partidos_ganados,
        ROUND(
            (partidos_ganados * 100.0) / NULLIF(partidos_jugados, 0),
            2
        ) AS porcentaje_victorias
    FROM jugadores
    WHERE estado = 'activo'
)
SELECT
    nombre,
    partidos_jugados,
    partidos_ganados,
    porcentaje_victorias
FROM rendimiento
ORDER BY porcentaje_victorias DESC;


-- 4. Promedio de rendimiento por nivel.
WITH rendimiento_nivel AS (
    SELECT
        nivel,
        COUNT(*) AS total_jugadores,
        SUM(partidos_jugados) AS partidos_jugados,
        SUM(partidos_ganados) AS partidos_ganados
    FROM jugadores
    WHERE estado = 'activo'
    GROUP BY nivel
)
SELECT
    nivel,
    total_jugadores,
    partidos_jugados,
    partidos_ganados,
    ROUND(
        (partidos_ganados * 100.0) / NULLIF(partidos_jugados, 0),
        2
    ) AS porcentaje_victorias
FROM rendimiento_nivel
ORDER BY porcentaje_victorias DESC;


-- 5. Jugadores activos cuyo porcentaje de victorias
-- supera el promedio general.
WITH rendimiento AS (
    SELECT
        id_jugador,
        nombre,
        ranking,
        nivel,
        partidos_jugados,
        partidos_ganados,
        (partidos_ganados * 100.0) /
            NULLIF(partidos_jugados, 0) AS porcentaje_victorias
    FROM jugadores
    WHERE estado = 'activo'
),
promedio_general AS (
    SELECT
        AVG(porcentaje_victorias) AS promedio_victorias
    FROM rendimiento
)
SELECT
    r.nombre,
    r.ranking,
    r.nivel,
    ROUND(r.porcentaje_victorias, 2) AS porcentaje_victorias,
    ROUND(p.promedio_victorias, 2) AS promedio_general
FROM rendimiento AS r
CROSS JOIN promedio_general AS p
WHERE r.porcentaje_victorias > p.promedio_victorias
ORDER BY r.porcentaje_victorias DESC;


-- 6. CTE para identificar jugadores avanzados
-- dentro de los mejores 30 puestos.
WITH ranking_avanzado AS (
    SELECT
        nombre,
        ranking,
        nivel,
        partidos_ganados
    FROM jugadores
    WHERE estado = 'activo'
      AND nivel = 'avanzado'
)
SELECT
    nombre,
    ranking,
    nivel,
    partidos_ganados
FROM ranking_avanzado
WHERE ranking <= 30
ORDER BY ranking ASC;