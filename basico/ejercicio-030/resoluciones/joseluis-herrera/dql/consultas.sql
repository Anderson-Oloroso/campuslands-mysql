USE campuslands_mysql;

SELECT
    s.nombre AS streamer,
    s.plataforma,
    e.nombre AS equipo,
    e.categoria,
    e.precio,
    e.estado
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
ORDER BY s.nombre, e.nombre;

SELECT
    s.nombre AS streamer,
    e.nombre AS equipo,
    e.categoria,
    e.precio
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
WHERE s.estado = 'activo'
  AND e.estado = 'en_uso'
ORDER BY e.precio DESC;

SELECT
    s.nombre AS streamer,
    COUNT(e.id_equipo) AS total_equipos
FROM streamers s
LEFT JOIN equipos e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY total_equipos DESC, streamer;

SELECT
    s.nombre AS streamer,
    SUM(e.precio) AS valor_total_equipos
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY valor_total_equipos DESC;

SELECT
    s.nombre AS streamer,
    e.nombre AS equipo,
    e.categoria,
    e.precio
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
ORDER BY e.precio DESC
LIMIT 5;