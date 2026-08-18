USE campuslands_mysql;

SELECT
    j.nickname AS jugador,
    j.rango,
    p.id_partida,
    p.posicion_final,
    p.eliminaciones,
    p.fecha_partida
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY j.nickname, p.fecha_partida;

SELECT
    j.nickname AS jugador,
    j.rango,
    COUNT(p.id_partida) AS total_partidas
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname, j.rango
ORDER BY total_partidas DESC;

SELECT
    j.nickname AS jugador,
    j.nombre,
    j.rango,
    j.estado
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
WHERE p.id_partida IS NULL
ORDER BY j.nickname;


SELECT
    j.nickname AS jugador,
    j.rango,
    COALESCE(SUM(p.eliminaciones), 0) AS eliminaciones_totales
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname, j.rango
ORDER BY eliminaciones_totales DESC;



SELECT
    j.nickname AS jugador,
    j.rango,
    ROUND(AVG(p.posicion_final), 2) AS promedio_posicion
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname, j.rango
ORDER BY promedio_posicion ASC;


SELECT
    j.nickname AS jugador,
    j.rango,
    j.puntaje,
    COUNT(p.id_partida) AS partidas_jugadas,
    COALESCE(SUM(p.eliminaciones), 0) AS eliminaciones_totales
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nickname, j.rango, j.puntaje
ORDER BY eliminaciones_totales DESC, j.puntaje DESC
LIMIT 5;