WITH partidos_procesados AS (
    SELECT 
        partido_id,
        torneo_id,
        jugador1_id AS jugador_id,
        sets_jugador1 AS sets_favor,
        sets_jugador2 AS sets_contra,
        CASE WHEN sets_jugador1 > sets_jugador2 THEN 1 ELSE 0 END AS es_victoria
    FROM partidos_pingpong
    UNION ALL
    SELECT 
        partido_id,
        torneo_id,
        jugador2_id AS jugador_id,
        sets_jugador2 AS sets_favor,
        sets_jugador1 AS sets_contra,
        CASE WHEN sets_jugador2 > sets_jugador1 THEN 1 ELSE 0 END AS es_victoria
    FROM partidos_pingpong
),
rendimiento_jugador AS (
    SELECT 
        j.jugador_id,
        j.nombre_jugador,
        c.nombre_club,
        COUNT(pp.partido_id) AS total_partidos,
        SUM(pp.es_victoria) AS partidos_ganados,
        COUNT(pp.partido_id) - SUM(pp.es_victoria) AS partidos_perdidos,
        SUM(pp.sets_favor) AS total_sets_favor,
        SUM(pp.sets_contra) AS total_sets_contra,
        ROUND((SUM(pp.es_victoria) / COUNT(pp.partido_id)) * 100, 2) AS porcentaje_efectividad
    FROM jugadores_pingpong j
    INNER JOIN clubes_pingpong c ON j.club_id = c.club_id
    INNER JOIN partidos_procesados pp ON j.jugador_id = pp.jugador_id
    GROUP BY j.jugador_id, j.nombre_jugador, c.nombre_club
)
SELECT 
    jugador_id,
    nombre_jugador,
    nombre_club,
    total_partidos,
    partidos_ganados,
    partidos_perdidos,
    total_sets_favor,
    total_sets_contra,
    porcentaje_efectividad
FROM rendimiento_jugador
WHERE total_partidos >= 2
ORDER BY porcentaje_efectividad DESC, partidos_ganados DESC;

WITH rendimiento_club AS (
    SELECT 
        c.club_id,
        c.nombre_club,
        COUNT(DISTINCT j.jugador_id) AS total_jugadores,
        COUNT(p.partido_id) AS partidos_disputados,
        SUM(
            CASE 
                WHEN (p.jugador1_id = j.jugador_id AND p.sets_jugador1 > p.sets_jugador2) OR 
                     (p.jugador2_id = j.jugador_id AND p.sets_jugador2 > p.sets_jugador1) 
                THEN 1 ELSE 0 
            END
        ) AS victorias_totales
    FROM clubes_pingpong c
    INNER JOIN jugadores_pingpong j ON c.club_id = j.club_id
    INNER JOIN partidos_pingpong p ON j.jugador_id = p.jugador1_id OR j.jugador_id = p.jugador2_id
    GROUP BY c.club_id, c.nombre_club
)
SELECT 
    club_id,
    nombre_club,
    total_jugadores,
    partidos_disputados,
    victorias_totales,
    ROUND((victorias_totales / partidos_disputados) * 100, 2) AS tasa_victoria_club
FROM rendimiento_club
ORDER BY tasa_victoria_club DESC;