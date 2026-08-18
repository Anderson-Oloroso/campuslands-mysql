USE campuslands_mysql;

SELECT
    id,
    nombre,
    ciudad
FROM equipos
ORDER BY nombre ASC;

SELECT
    e.nombre AS equipo,
    e.ciudad,
    p.partidos_jugados,
    p.partidos_ganados,
    p.partidos_empatados,
    p.partidos_perdidos,
    p.goles_favor,
    p.goles_contra,
    p.puntos
FROM participaciones AS p
INNER JOIN equipos AS e
    ON e.id = p.equipo_id
WHERE p.liga_id = 1
ORDER BY p.puntos DESC, p.goles_favor DESC;


SELECT
    e.nombre AS equipo,
    p.goles_favor,
    p.goles_contra,
    p.puntos
FROM participaciones AS p
INNER JOIN equipos AS e
    ON e.id = p.equipo_id
WHERE p.goles_favor > 15
ORDER BY p.goles_favor DESC;


SELECT
    e.nombre AS equipo,
    p.puntos
FROM participaciones AS p
INNER JOIN equipos AS e
    ON e.id = p.equipo_id
ORDER BY p.puntos DESC
LIMIT 3;

SELECT
    e.nombre AS equipo,
    e.ciudad,
    p.partidos_ganados,
    p.puntos
FROM equipos AS e
INNER JOIN participaciones AS p
    ON p.equipo_id = e.id
WHERE e.ciudad = 'Madrid'
ORDER BY p.puntos DESC;

SELECT
    l.nombre AS liga,
    l.temporada,
    e.nombre AS equipo,
    e.ciudad,
    p.puntos
FROM ligas AS l
INNER JOIN participaciones AS p
    ON p.liga_id = l.id
INNER JOIN equipos AS e
    ON e.id = p.equipo_id
ORDER BY p.puntos DESC;