USE campuslands_mysql;

-- 1. Consultar cada equipo junto con el streamer al que pertenece.
SELECT
    s.nombre AS streamer,
    s.canal,
    e.nombre_equipo AS equipo,
    e.tipo_equipo,
    e.precio
FROM streamers AS s
INNER JOIN equipos_streaming AS e
    ON s.id_streamer = e.id_streamer
ORDER BY s.nombre ASC, e.precio DESC;


-- 2. Consultar los equipos de streamers activos.
SELECT
    s.nombre AS streamer,
    e.nombre_equipo AS equipo,
    e.tipo_equipo,
    e.precio
FROM streamers AS s
INNER JOIN equipos_streaming AS e
    ON s.id_streamer = e.id_streamer
WHERE s.estado = 'activo'
ORDER BY e.precio DESC;


-- 3. Consultar el costo total del equipo de cada streamer.
SELECT
    s.nombre AS streamer,
    COUNT(e.id_equipo) AS total_equipos,
    SUM(e.precio) AS costo_total
FROM streamers AS s
INNER JOIN equipos_streaming AS e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY costo_total DESC;


-- 4. Consultar los equipos con precio superior a 200.
SELECT
    s.nombre AS streamer,
    e.nombre_equipo AS equipo,
    e.tipo_equipo,
    e.precio
FROM streamers AS s
INNER JOIN equipos_streaming AS e
    ON s.id_streamer = e.id_streamer
WHERE e.precio > 200
ORDER BY e.precio DESC;


-- 5. Consultar cuántos equipos tiene cada streamer.
SELECT
    s.nombre AS streamer,
    COUNT(e.id_equipo) AS total_equipos
FROM streamers AS s
LEFT JOIN equipos_streaming AS e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY total_equipos DESC;