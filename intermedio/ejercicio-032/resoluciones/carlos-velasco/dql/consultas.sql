USE campuslands_mysql;

-- 1. Mostrar todos los jugadores y sus partidas.
-- Los jugadores sin partidas también aparecen.
SELECT
    j.nombre_jugador AS jugador,
    j.plataforma,
    p.id_partida AS partida,
    p.posicion_final AS posicion,
    p.eliminaciones,
    p.puntos
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
ORDER BY j.nombre_jugador, p.fecha_partida;


-- 2. Mostrar el total de partidas y puntos acumulados por jugador.
SELECT
    j.nombre_jugador AS jugador,
    COUNT(p.id_partida) AS total_partidas,
    COALESCE(SUM(p.puntos), 0) AS puntos_totales
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nombre_jugador
ORDER BY puntos_totales DESC, jugador ASC;


-- 3. Mostrar el ranking de jugadores según sus puntos acumulados.
SELECT
    j.nombre_jugador AS jugador,
    j.nivel,
    COALESCE(SUM(p.puntos), 0) AS puntos_totales
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nombre_jugador, j.nivel
ORDER BY puntos_totales DESC, j.nivel DESC
LIMIT 5;


-- 4. Mostrar jugadores que todavía no tienen partidas registradas.
SELECT
    j.nombre_jugador AS jugador,
    j.plataforma,
    j.nivel,
    j.estado
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
WHERE p.id_partida IS NULL
ORDER BY j.nombre_jugador;


-- 5. Mostrar el promedio de puntos y eliminaciones por jugador.
SELECT
    j.nombre_jugador AS jugador,
    COUNT(p.id_partida) AS partidas_jugadas,
    COALESCE(ROUND(AVG(p.puntos), 2), 0) AS promedio_puntos,
    COALESCE(ROUND(AVG(p.eliminaciones), 2), 0) AS promedio_eliminaciones
FROM jugadores AS j
LEFT JOIN partidas AS p
    ON j.id_jugador = p.id_jugador
GROUP BY j.id_jugador, j.nombre_jugador
ORDER BY promedio_puntos DESC, promedio_eliminaciones DESC;