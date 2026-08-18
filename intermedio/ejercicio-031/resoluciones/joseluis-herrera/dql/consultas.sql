USE campuslands_mysql;

SELECT
    j.nombre AS jugador,
    j.rol,
    e.nombre AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
ORDER BY e.nombre, j.nombre;

SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE e.estado = 'activo'
ORDER BY e.nombre, j.nombre;


SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE e.region = 'LATAM'
ORDER BY j.edad DESC;

SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE j.edad > 21
ORDER BY j.edad DESC;

SELECT
    e.nombre AS equipo,
    e.region,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos AS e
INNER JOIN jugadores AS j
    ON e.id_equipo = j.id_equipo
GROUP BY e.id_equipo, e.nombre, e.region
ORDER BY total_jugadores DESC;

SELECT
    j.nombre AS jugador,
    j.rol,
    e.nombre AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE j.rol IN ('Mid', 'Jungla')
ORDER BY j.rol, j.nombre;