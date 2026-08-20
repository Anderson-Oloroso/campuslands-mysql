USE campuslands_mysql;

-- 1. Mostrar los jugadores junto con su equipo y posición.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.posicion,
    j.numero_camiseta
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
ORDER BY e.nombre, j.numero_camiseta;


-- 2. Mostrar los partidos con sus equipos y resultado.
SELECT
    p.id_partido,
    p.fecha,
    el.nombre AS equipo_local,
    ev.nombre AS equipo_visitante,
    p.goles_local,
    p.goles_visitante
FROM partidos AS p
INNER JOIN equipos AS el
    ON p.equipo_local_id = el.id_equipo
INNER JOIN equipos AS ev
    ON p.equipo_visitante_id = ev.id_equipo
ORDER BY p.fecha;


-- 3. Obtener el total de goles y asistencias de cada jugador.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    SUM(ep.goles) AS total_goles,
    SUM(ep.asistencias) AS total_asistencias
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN estadisticas_partido AS ep
    ON j.id_jugador = ep.jugador_id
GROUP BY
    j.id_jugador,
    j.nombre,
    e.nombre
ORDER BY total_goles DESC, total_asistencias DESC;


-- 4. Obtener los jugadores que acumulan más de una asistencia.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    SUM(ep.asistencias) AS total_asistencias
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN estadisticas_partido AS ep
    ON j.id_jugador = ep.jugador_id
GROUP BY
    j.id_jugador,
    j.nombre,
    e.nombre
HAVING SUM(ep.asistencias) > 1
ORDER BY total_asistencias DESC;


-- 5. Mostrar el máximo goleador de la liga.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    SUM(ep.goles) AS total_goles
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN estadisticas_partido AS ep
    ON j.id_jugador = ep.jugador_id
GROUP BY
    j.id_jugador,
    j.nombre,
    e.nombre
ORDER BY total_goles DESC
LIMIT 1;


-- 6. Mostrar el total de minutos jugados por cada jugador.
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    SUM(ep.minutos_jugados) AS minutos_totales
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
INNER JOIN estadisticas_partido AS ep
    ON j.id_jugador = ep.jugador_id
GROUP BY
    j.id_jugador,
    j.nombre,
    e.nombre
ORDER BY minutos_totales DESC;


-- 7. Mostrar los equipos cuyos jugadores han marcado al menos 3 goles.
SELECT
    e.nombre AS equipo,
    SUM(ep.goles) AS goles_totales
FROM equipos AS e
INNER JOIN jugadores AS j
    ON e.id_equipo = j.id_equipo
INNER JOIN estadisticas_partido AS ep
    ON j.id_jugador = ep.jugador_id
GROUP BY
    e.id_equipo,
    e.nombre
HAVING SUM(ep.goles) >= 3
ORDER BY goles_totales DESC;