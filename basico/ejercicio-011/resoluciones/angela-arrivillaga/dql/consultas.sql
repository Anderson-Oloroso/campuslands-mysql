USE pingpong_db;

-- 1. Listado general de jugadores activos con su nivel y puntaje
SELECT nombre, nivel, puntos_ranking
FROM jugadores
WHERE activo = TRUE
ORDER BY puntos_ranking DESC;

-- 2. Conteo de jugadores agrupados por su nivel de habilidad
SELECT nivel, COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY nivel
ORDER BY total_jugadores DESC;

-- 3. Promedio de puntos de ranking de los jugadores activos
SELECT AVG(puntos_ranking) AS promedio_puntos_activos
FROM jugadores
WHERE activo = TRUE;

-- 4. Detalle de partidos con nombres de los jugadores enfrentados y marcador
SELECT p.id_partido, j1.nombre AS jugador_1, p.sets_jugador1, 
       j2.nombre AS jugador_2, p.sets_jugador2, p.fecha_partido
FROM partidos p
JOIN jugadores j1 ON p.id_jugador1 = j1.id_jugador1
JOIN jugadores j2 ON p.id_jugador2 = j2.id_jugador2;

-- 5. Jugadores con puntaje de ranking mayor o igual a 1800 ordenados descendentemente
SELECT nombre, nivel, puntos_ranking
FROM jugadores
WHERE puntos_ranking >= 1800
ORDER BY puntos_ranking DESC;