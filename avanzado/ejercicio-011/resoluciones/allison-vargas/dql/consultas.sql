-- DQL: Consultas avanzadas utilizando CTEs (Common Table Expressions)
USE campuslands_mysql;

-- 1. CTE Básica: Clasificación de jugadores por nivel según sus puntos de ranking
WITH nivel_jugadores AS (
    SELECT 
        jugador_id,
        nombre_jugador,
        puntos_ranking,
        CASE 
            WHEN puntos_ranking >= 1400 THEN 'Elite'
            WHEN puntos_ranking >= 1200 THEN 'Avanzado'
            ELSE 'Intermedio'
        END AS nivel
    FROM jugadores_pingpong
    WHERE estado = 'activo'
)
SELECT nivel, COUNT(*) AS total_jugadores, AVG(puntos_ranking) AS promedio_puntos
FROM nivel_jugadores
GROUP BY nivel
ORDER BY promedio_puntos DESC;

-- 2. CTE Múltiple: Métricas consolidadas por club (Promedio de ranking y partidos jugados)
WITH estadisticas_club AS (
    SELECT club, COUNT(jugador_id) AS total_socios, AVG(puntos_ranking) AS promedio_ranking
    FROM jugadores_pingpong
    GROUP BY club
),
victorias_jugador AS (
    SELECT jugador1_id AS ganador_id FROM partidos_pingpong WHERE sets_jugador1 > sets_jugador2
    UNION ALL
    SELECT jugador2_id AS ganador_id FROM partidos_pingpong WHERE sets_jugador2 > sets_jugador1
)
SELECT 
    ec.club,
    ec.total_socios,
    ROUND(ec.promedio_ranking, 1) AS promedio_ranking,
    COUNT(vj.ganador_id) AS victorias_totales_club
FROM estadisticas_club ec
LEFT JOIN jugadores_pingpong j ON ec.club = j.club
LEFT JOIN victorias_jugador vj ON j.jugador_id = vj.ganador_id
GROUP BY ec.club, ec.total_socios, ec.promedio_ranking;

-- 3. CTE para cálculo de efectividad de sets ganados por jugador
WITH resumen_sets AS (
    SELECT jugador1_id AS jugador_id, sets_jugador1 AS sets_favor, sets_jugador2 AS sets_contra FROM partidos_pingpong
    UNION ALL
    SELECT jugador2_id AS jugador_id, sets_jugador2 AS sets_favor, sets_jugador1 AS sets_contra FROM partidos_pingpong
)
SELECT 
    j.nombre_jugador,
    j.categoria,
    SUM(rs.sets_favor) AS total_sets_ganados,
    SUM(rs.sets_contra) AS total_sets_perdidos,
    (SUM(rs.sets_favor) - SUM(rs.sets_contra)) AS diferencia_sets
FROM resumen_sets rs
INNER JOIN jugadores_pingpong j ON rs.jugador_id = j.jugador_id
GROUP BY j.jugador_id, j.nombre_jugador, j.categoria
ORDER BY diferencia_sets DESC;

-- 4. CTE Top 3 jugadores invictos o con mejor saldo de victorias
WITH victorias AS (
    SELECT 
        CASE WHEN sets_jugador1 > sets_jugador2 THEN jugador1_id ELSE jugador2_id END AS ganador_id,
        COUNT(*) AS total_victorias
    FROM partidos_pingpong
    GROUP BY ganador_id
)
SELECT 
    j.nombre_jugador,
    j.club,
    v.total_victorias
FROM victorias v
INNER JOIN jugadores_pingpong j ON v.ganador_id = j.jugador_id
ORDER BY v.total_victorias DESC
LIMIT 3;

-- 5. CTE con promedio comparativo general de puntos de ranking
WITH promedio_global AS (
    SELECT AVG(puntos_ranking) AS avg_puntos FROM jugadores_pingpong
)
SELECT 
    j.nombre_jugador,
    j.puntos_ranking,
    ROUND(pg.avg_puntos, 2) AS promedio_general,
    ROUND(j.puntos_ranking - pg.avg_puntos, 2) AS diferencia_promedio
FROM jugadores_pingpong j, promedio_global pg
ORDER BY diferencia_promedio DESC;
