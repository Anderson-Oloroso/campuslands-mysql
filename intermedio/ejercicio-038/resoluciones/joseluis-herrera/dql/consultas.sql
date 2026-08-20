USE campuslands_mysql;


-- 1. Mostrar todos los jugadores con su equipo y posición.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    p.nombre AS posicion,
    j.numero_camiseta,
    j.goles,
    j.estado
FROM jugadores AS j
INNER JOIN equipos AS e
    ON e.id = j.equipo_id
INNER JOIN posiciones AS p
    ON p.id = j.posicion_id
ORDER BY j.nombre;


-- 2. Mostrar los jugadores activos ordenados
-- de mayor a menor cantidad de goles.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.goles
FROM jugadores AS j
INNER JOIN equipos AS e
    ON e.id = j.equipo_id
WHERE j.estado = 'activo'
ORDER BY j.goles DESC;


-- 3. Mostrar cuántos jugadores tiene cada equipo.
SELECT
    e.nombre AS equipo,
    COUNT(j.id) AS total_jugadores
FROM equipos AS e
LEFT JOIN jugadores AS j
    ON j.equipo_id = e.id
GROUP BY e.id, e.nombre
ORDER BY total_jugadores DESC;


-- 4. Calcular los goles totales por equipo.
SELECT
    e.nombre AS equipo,
    SUM(j.goles) AS total_goles
FROM equipos AS e
INNER JOIN jugadores AS j
    ON j.equipo_id = e.id
GROUP BY e.id, e.nombre
ORDER BY total_goles DESC;


-- 5. Mostrar el promedio de goles por posición.
SELECT
    p.nombre AS posicion,
    COUNT(j.id) AS total_jugadores,
    ROUND(AVG(j.goles), 2) AS promedio_goles
FROM posiciones AS p
INNER JOIN jugadores AS j
    ON j.posicion_id = p.id
GROUP BY p.id, p.nombre
ORDER BY promedio_goles DESC;


-- 6. Mostrar jugadores que tienen más de 7 goles.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    p.nombre AS posicion,
    j.goles
FROM jugadores AS j
INNER JOIN equipos AS e
    ON e.id = j.equipo_id
INNER JOIN posiciones AS p
    ON p.id = j.posicion_id
WHERE j.goles > 7
ORDER BY j.goles DESC;


-- 7. Mostrar los equipos que tienen al menos
-- dos jugadores registrados.
SELECT
    e.nombre AS equipo,
    COUNT(j.id) AS total_jugadores,
    SUM(j.goles) AS total_goles
FROM equipos AS e
INNER JOIN jugadores AS j
    ON j.equipo_id = e.id
GROUP BY e.id, e.nombre
HAVING COUNT(j.id) >= 2
ORDER BY total_goles DESC;