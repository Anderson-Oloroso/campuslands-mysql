USE liga_futbol_db;

-- 1. Jugadores activos y su equipo
SELECT CONCAT(j.nombre, ' ', j.apellido) AS jugador, j.posicion, j.goles, e.nombre AS equipo
FROM jugadores j
JOIN equipos e ON j.equipo_id = e.id
WHERE j.estado = 'activo';

-- 2. Total de goles por equipo
SELECT e.nombre AS equipo, SUM(j.goles) AS total_goles
FROM equipos e
LEFT JOIN jugadores j ON e.id = j.equipo_id
GROUP BY e.id, e.nombre;

-- 3. Top 3 goleadores
SELECT CONCAT(j.nombre, ' ', j.apellido) AS goleador, j.goles, e.nombre AS equipo
FROM jugadores j
JOIN equipos e ON j.equipo_id = e.id
ORDER BY j.goles DESC
LIMIT 3;

-- 4. Promedio de goles por posición
SELECT posicion, COUNT(*) AS total_jugadores, AVG(goles) AS promedio_goles
FROM jugadores
GROUP BY posicion;

-- 5. Jugadores no activos (lesionados o suspendidos)
SELECT CONCAT(nombre, ' ', apellido) AS jugador, posicion, estado
FROM jugadores
WHERE estado != 'activo';
