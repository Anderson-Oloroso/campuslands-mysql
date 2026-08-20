USE campuslands_mysql;

-- 1. Mostrar los equipos junto con su ciudad y estado.
SELECT
    e.nombre AS equipo,
    c.nombre AS ciudad,
    e.estado
FROM equipos_futsal AS e
INNER JOIN ciudades AS c
    ON e.id_ciudad = c.id_ciudad
ORDER BY e.nombre ASC;


-- 2. Mostrar todos los jugadores con su equipo y posición.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    p.nombre AS posicion,
    j.numero_camiseta AS camiseta
FROM jugadores_futsal AS j
INNER JOIN equipos_futsal AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN posiciones AS p
    ON j.id_posicion = p.id_posicion
ORDER BY e.nombre ASC, j.nombre ASC;


-- 3. Contar jugadores por equipo.
SELECT
    e.nombre AS equipo,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos_futsal AS e
LEFT JOIN jugadores_futsal AS j
    ON e.id_equipo = j.id_equipo
GROUP BY e.id_equipo, e.nombre
ORDER BY total_jugadores DESC;


-- 4. Mostrar los jugadores que pertenecen a equipos activos.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    p.nombre AS posicion
FROM jugadores_futsal AS j
INNER JOIN equipos_futsal AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN posiciones AS p
    ON j.id_posicion = p.id_posicion
WHERE e.estado = 'activo'
ORDER BY e.nombre ASC, j.nombre ASC;


-- 5. Contar jugadores por posición.
SELECT
    p.nombre AS posicion,
    COUNT(j.id_jugador) AS total_jugadores
FROM posiciones AS p
LEFT JOIN jugadores_futsal AS j
    ON p.id_posicion = j.id_posicion
GROUP BY p.id_posicion, p.nombre
ORDER BY total_jugadores DESC;


-- 6. Mostrar equipos activos con al menos dos jugadores.
SELECT
    e.nombre AS equipo,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos_futsal AS e
INNER JOIN jugadores_futsal AS j
    ON e.id_equipo = j.id_equipo
WHERE e.estado = 'activo'
GROUP BY e.id_equipo, e.nombre
HAVING COUNT(j.id_jugador) >= 2
ORDER BY total_jugadores DESC;


-- 7. Mostrar jugadores mayores de 24 años con su ciudad.
SELECT
    j.nombre AS jugador,
    j.edad,
    e.nombre AS equipo,
    c.nombre AS ciudad
FROM jugadores_futsal AS j
INNER JOIN equipos_futsal AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN ciudades AS c
    ON e.id_ciudad = c.id_ciudad
WHERE j.edad > 24
ORDER BY j.edad DESC;