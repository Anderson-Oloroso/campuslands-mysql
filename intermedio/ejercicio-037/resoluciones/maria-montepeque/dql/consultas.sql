USE campuslands_mysql;

-- 1. Goles con el nombre del jugador y los datos del partido (JOIN de las 3 tablas)
SELECT j.nombre AS jugador,
       p.equipo_local,
       p.equipo_visitante,
       p.fecha_partido,
       g.minuto,
       g.tipo_gol
FROM goles_partido_intermedio g
INNER JOIN jugadores_intermedio j ON j.id_jugador = g.id_jugador
INNER JOIN partidos_intermedio p ON p.id_partido = g.id_partido
ORDER BY p.fecha_partido, g.minuto;

-- 2. Ranking de goleadores
SELECT j.nombre AS jugador, j.equipo, COUNT(*) AS total_goles
FROM goles_partido_intermedio g
INNER JOIN jugadores_intermedio j ON j.id_jugador = g.id_jugador
GROUP BY j.nombre, j.equipo
ORDER BY total_goles DESC;

-- 3. Partidos con mas de 2 goles registrados
SELECT p.equipo_local, p.equipo_visitante, p.fecha_partido, COUNT(*) AS total_goles
FROM goles_partido_intermedio g
INNER JOIN partidos_intermedio p ON p.id_partido = g.id_partido
GROUP BY p.id_partido, p.equipo_local, p.equipo_visitante, p.fecha_partido
HAVING COUNT(*) > 2
ORDER BY total_goles DESC;

-- 4. Goles marcados despues del minuto 80
SELECT j.nombre AS jugador, p.fecha_partido, g.minuto, g.tipo_gol
FROM goles_partido_intermedio g
INNER JOIN jugadores_intermedio j ON j.id_jugador = g.id_jugador
INNER JOIN partidos_intermedio p ON p.id_partido = g.id_partido
WHERE g.minuto > 80
ORDER BY g.minuto DESC;

-- 5. Jugadores que anotaron en mas de un partido distinto
SELECT j.nombre AS jugador, COUNT(DISTINCT g.id_partido) AS partidos_distintos_con_gol
FROM goles_partido_intermedio g
INNER JOIN jugadores_intermedio j ON j.id_jugador = g.id_jugador
GROUP BY j.nombre
HAVING COUNT(DISTINCT g.id_partido) > 1
ORDER BY partidos_distintos_con_gol DESC;

-- 6. Cantidad de goles por tipo
SELECT tipo_gol, COUNT(*) AS total_goles
FROM goles_partido_intermedio
GROUP BY tipo_gol
ORDER BY total_goles DESC;
