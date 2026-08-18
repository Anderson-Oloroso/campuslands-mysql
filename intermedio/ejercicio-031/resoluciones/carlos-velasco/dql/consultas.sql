USE campuslands_mysql;

-- 1. Mostrar cada jugador junto con su equipo y región.
SELECT
    j.nombre_jugador AS jugador,
    j.rol,
    e.nombre_equipo AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
ORDER BY e.nombre_equipo, j.rol;


-- 2. Mostrar las partidas con los nombres de los dos equipos.
SELECT
    p.id_partida AS partida,
    p.fecha_partida AS fecha,
    el.nombre_equipo AS equipo_local,
    ev.nombre_equipo AS equipo_visitante
FROM partidas AS p
INNER JOIN equipos AS el
    ON p.id_equipo_local = el.id_equipo
INNER JOIN equipos AS ev
    ON p.id_equipo_visitante = ev.id_equipo
ORDER BY p.fecha_partida;


-- 3. Mostrar las partidas indicando el equipo ganador.
SELECT
    p.id_partida AS partida,
    p.fecha_partida AS fecha,
    el.nombre_equipo AS equipo_local,
    ev.nombre_equipo AS equipo_visitante,
    eg.nombre_equipo AS ganador
FROM partidas AS p
INNER JOIN equipos AS el
    ON p.id_equipo_local = el.id_equipo
INNER JOIN equipos AS ev
    ON p.id_equipo_visitante = ev.id_equipo
INNER JOIN equipos AS eg
    ON p.ganador_id = eg.id_equipo
ORDER BY p.fecha_partida;


-- 4. Contar cuántos jugadores tiene cada equipo.
SELECT
    e.nombre_equipo AS equipo,
    e.region,
    COUNT(j.id_jugador) AS total_jugadores
FROM equipos AS e
INNER JOIN jugadores AS j
    ON e.id_equipo = j.id_equipo
GROUP BY e.id_equipo, e.nombre_equipo, e.region
ORDER BY total_jugadores DESC, equipo ASC;


-- 5. Mostrar jugadores de equipos activos que ocupan el rol de Mid o ADC.
SELECT
    j.nombre_jugador AS jugador,
    j.rol,
    e.nombre_equipo AS equipo,
    e.region
FROM jugadores AS j
INNER JOIN equipos AS e
    ON j.id_equipo = e.id_equipo
WHERE e.estado = 'activo'
  AND j.rol IN ('Mid', 'ADC')
ORDER BY j.rol, j.nombre_jugador;