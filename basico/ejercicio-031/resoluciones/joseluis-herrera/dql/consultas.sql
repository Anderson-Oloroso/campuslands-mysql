USE campuslands_mysql;


SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo,
    e.region
FROM jugadores j
INNER JOIN equipos e
    ON j.id_equipo = e.id_equipo
ORDER BY e.nombre, j.nombre;


SELECT
    j.nombre AS jugador,
    j.rol,
    e.nombre AS equipo,
    e.region
FROM jugadores j
INNER JOIN equipos e
    ON j.id_equipo = e.id_equipo
WHERE e.estado = 'activo'
ORDER BY e.nombre, j.nombre;

SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e
    ON j.id_equipo = e.id_equipo
WHERE j.edad > 21
ORDER BY j.edad DESC;


SELECT
    e.nombre AS equipo,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos e
LEFT JOIN jugadores j
    ON e.id_equipo = j.id_equipo
GROUP BY e.id_equipo, e.nombre
ORDER BY total_jugadores DESC, equipo;


SELECT
    j.nombre AS jugador,
    j.rol,
    j.edad,
    e.nombre AS equipo
FROM jugadores j
INNER JOIN equipos e
    ON j.id_equipo = e.id_equipo
ORDER BY j.edad DESC;


SELECT
    rol,
    COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY rol
ORDER BY total_jugadores DESC, rol;