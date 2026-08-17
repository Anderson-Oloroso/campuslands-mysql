




SELECT 
    p.partido_id,
    j1.nombre AS jugador_1,
    p.puntos_j1,
    j2.nombre AS jugador_2,
    p.puntos_j2,
    p.fecha_partido,
    CASE 
        WHEN p.puntos_j1 > p.puntos_j2 THEN j1.nombre
        WHEN p.puntos_j2 > p.puntos_j1 THEN j2.nombre
        ELSE 'Empate'
    END AS ganador
FROM partidos p
INNER JOIN jugadores j1 ON p.jugador_1_id = j1.jugador_id
INNER JOIN jugadores j2 ON p.jugador_2_id = j2.jugador_id;

SELECT 
    nombre, 
    edad, 
    categoria, 
    puntos_ranking
FROM jugadores
WHERE puntos_ranking > (SELECT AVG(puntos_ranking) FROM jugadores)
ORDER BY puntos_ranking DESC;