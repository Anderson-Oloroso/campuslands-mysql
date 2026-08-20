-- ============================================================
-- EJERCICIO 037 - VISTAS AVANZADAS PARA LIGA DE FUTBOL
-- DQL - Consultas y validacion de vistas
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Clasificacion general de la liga.
-- ============================================================

SELECT
    ROW_NUMBER() OVER (
        ORDER BY puntos DESC, diferencia_goles DESC, goles_favor DESC
    ) AS posicion,
    nombre AS equipo,
    partidos_jugados,
    partidos_ganados,
    partidos_empatados,
    partidos_perdidos,
    goles_favor,
    goles_contra,
    diferencia_goles,
    puntos
FROM vw_clasificacion_liga
ORDER BY
    puntos DESC,
    diferencia_goles DESC,
    goles_favor DESC;


-- ============================================================
-- CONSULTA 2
-- Top 5 goleadores de la liga.
-- ============================================================

SELECT
    posicion_ranking AS posicion,
    jugador,
    equipo,
    posicion AS posicion_jugador,
    goles,
    asistencias
FROM vw_ranking_goleadores
ORDER BY
    posicion_ranking,
    jugador
LIMIT 5;


-- ============================================================
-- CONSULTA 3
-- Equipos que superan los 5 puntos.
-- ============================================================

SELECT
    nombre AS equipo,
    partidos_jugados,
    puntos,
    diferencia_goles
FROM vw_clasificacion_liga
WHERE puntos > 5
ORDER BY
    puntos DESC,
    diferencia_goles DESC;


-- ============================================================
-- CONSULTA 4
-- Promedio de goles por partido de cada equipo.
-- ============================================================

SELECT
    nombre AS equipo,
    partidos_jugados,
    goles_favor,
    ROUND(
        goles_favor / NULLIF(partidos_jugados, 0),
        2
    ) AS promedio_goles_por_partido
FROM vw_clasificacion_liga
ORDER BY
    promedio_goles_por_partido DESC;


-- ============================================================
-- CONSULTA 5
-- Jugadores con al menos 5 goles y 4 asistencias.
-- ============================================================

SELECT
    jugador,
    equipo,
    goles,
    asistencias,
    (goles + asistencias) AS participaciones_ofensivas
FROM vw_ranking_goleadores
WHERE goles >= 5
  AND asistencias >= 4
ORDER BY
    participaciones_ofensivas DESC,
    goles DESC;


-- ============================================================
-- CONSULTA 6
-- Partidos finalizados con diferencia de un solo gol.
-- ============================================================

SELECT
    p.partido_id,
    el.nombre AS equipo_local,
    ev.nombre AS equipo_visitante,
    p.fecha_partido,
    p.goles_local,
    p.goles_visitante,
    ABS(p.goles_local - p.goles_visitante) AS diferencia
FROM partidos p
INNER JOIN equipos el
    ON p.equipo_local_id = el.equipo_id
INNER JOIN equipos ev
    ON p.equipo_visitante_id = ev.equipo_id
WHERE p.estado = 'finalizado'
  AND ABS(p.goles_local - p.goles_visitante) = 1
ORDER BY
    p.fecha_partido;


-- ============================================================
-- CONSULTA 7
-- Resumen ofensivo de los equipos.
-- ============================================================

SELECT
    e.nombre AS equipo,
    COUNT(j.jugador_id) AS total_jugadores,
    SUM(j.goles) AS goles_jugadores,
    SUM(j.asistencias) AS asistencias_jugadores,
    ROUND(AVG(j.goles), 2) AS promedio_goles_por_jugador
FROM equipos e
INNER JOIN jugadores j
    ON e.equipo_id = j.equipo_id
WHERE e.estado = 'activo'
GROUP BY
    e.equipo_id,
    e.nombre
HAVING SUM(j.goles) >= 8
ORDER BY
    goles_jugadores DESC;


-- ============================================================
-- CONSULTA 8
-- Validacion directa de la vista de goleadores.
-- ============================================================

SELECT
    *
FROM vw_ranking_goleadores
ORDER BY
    goles DESC,
    asistencias DESC;