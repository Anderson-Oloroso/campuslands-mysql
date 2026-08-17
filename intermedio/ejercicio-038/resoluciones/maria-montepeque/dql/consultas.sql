USE campuslands_mysql;

-- 1. Jugadores con nombre y ciudad del equipo (via JOIN, no columnas repetidas)
SELECT j.nombre AS jugador, e.nombre AS equipo, e.ciudad, j.goles
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
ORDER BY e.nombre, j.nombre;

-- 2. Total de goles por equipo
SELECT e.nombre AS equipo, SUM(j.goles) AS goles_totales
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
GROUP BY e.nombre
ORDER BY goles_totales DESC;

-- 3. Equipos con mas de dos jugadores registrados (GROUP BY + HAVING)
SELECT e.nombre AS equipo, COUNT(*) AS total_jugadores
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
GROUP BY e.nombre
HAVING COUNT(*) > 2
ORDER BY total_jugadores DESC;

-- 4. Jugadores de equipos ubicados en Bogota
SELECT j.nombre AS jugador, e.nombre AS equipo
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
WHERE e.ciudad = 'Bogota';

-- 5. Equipo con mayor total de goles acumulado
SELECT e.nombre AS equipo, SUM(j.goles) AS goles_totales
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
GROUP BY e.nombre
ORDER BY goles_totales DESC
LIMIT 1;

-- 6. Jugadores de "Rayo Interior": la ciudad ya aparece actualizada a
-- Palmira en todos, sin haber tocado la tabla de jugadores.
SELECT j.nombre AS jugador, e.nombre AS equipo, e.ciudad
FROM jugadores_futsal_intermedio j
INNER JOIN equipos_futsal_intermedio e ON e.id_equipo = j.id_equipo
WHERE e.nombre = 'Rayo Interior';
