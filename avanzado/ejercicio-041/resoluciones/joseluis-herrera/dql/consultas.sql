USE campuslands_mysql;

WITH estadisticas AS (
    SELECT
        id_jugador,
        CONCAT(nombre, ' ', apellido) AS jugador,
        categoria,
        ranking,
        partidos_ganados,
        partidos_perdidos,
        partidos_ganados + partidos_perdidos AS partidos_jugados
    FROM jugadores
)
SELECT
    jugador,
    categoria,
    ranking,
    partidos_jugados,
    partidos_ganados,
    partidos_perdidos
FROM estadisticas
ORDER BY ranking;


USE campuslands_mysql;

WITH rendimiento AS (
    SELECT
        id_jugador,
        CONCAT(nombre, ' ', apellido) AS jugador,
        categoria,
        partidos_ganados,
        partidos_perdidos,
        partidos_ganados + partidos_perdidos AS partidos_jugados
    FROM jugadores
)
SELECT
    jugador,
    categoria,
    partidos_jugados,
    partidos_ganados,
    ROUND(
        partidos_ganados * 100.0 / NULLIF(partidos_jugados, 0),
        2
    ) AS porcentaje_victorias
FROM rendimiento
ORDER BY porcentaje_victorias DESC;

USE campuslands_mysql;

WITH resumen_categoria AS (
    SELECT
        categoria,
        COUNT(*) AS total_jugadores,
        SUM(partidos_ganados) AS victorias_totales,
        SUM(partidos_perdidos) AS derrotas_totales,
        AVG(partidos_ganados) AS promedio_victorias
    FROM jugadores
    GROUP BY categoria
)
SELECT
    categoria,
    total_jugadores,
    victorias_totales,
    derrotas_totales,
    ROUND(promedio_victorias, 2) AS promedio_victorias
FROM resumen_categoria
ORDER BY promedio_victorias DESC;