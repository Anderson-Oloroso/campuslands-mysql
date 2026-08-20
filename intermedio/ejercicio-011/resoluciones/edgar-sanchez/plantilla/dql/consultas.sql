SELECT 
    p.partido_id,
    t.nombre_torneo,
    t.categoria,
    p.fase_torneo,
    j1.nombre_completo AS jugador_1,
    p.sets_jugador1,
    p.sets_jugador2,
    j2.nombre_completo AS jugador_2,
    CASE 
        WHEN p.sets_jugador1 = 3 THEN j1.nombre_completo
        ELSE j2.nombre_completo
    END AS ganador,
    p.duracion_minutos
FROM partidos_pingpong p
INNER JOIN torneos_pingpong t ON p.torneo_id = t.torneo_id
INNER JOIN jugadores_pingpong j1 ON p.jugador1_id = j1.jugador_id
INNER JOIN jugadores_pingpong j2 ON p.jugador2_id = j2.jugador_id
ORDER BY p.partido_id ASC;

SELECT 
    j.jugador_id,
    j.codigo_federado,
    j.nombre_completo,
    c.nombre_club,
    j.mano_dominante,
    j.puntos_ranking,
    COUNT(p.partido_id) AS total_partidos_jugados
FROM jugadores_pingpong j
INNER JOIN clubes_pingpong c ON j.club_id = c.club_id
LEFT JOIN partidos_pingpong p ON j.jugador_id = p.jugador1_id OR j.jugador_id = p.jugador2_id
GROUP BY j.jugador_id, j.codigo_federado, j.nombre_completo, c.nombre_club, j.mano_dominante, j.puntos_ranking
ORDER BY j.puntos_ranking DESC;