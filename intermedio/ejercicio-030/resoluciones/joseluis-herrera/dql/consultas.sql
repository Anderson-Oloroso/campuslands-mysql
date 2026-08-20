USE campuslands_mysql;

SELECT
    s.nombre AS streamer,
    s.plataforma,
    e.nombre AS equipo,
    e.categoria,
    e.precio,
    e.cantidad
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
ORDER BY s.nombre, e.nombre;

SELECT
    s.nombre AS streamer,
    e.nombre AS equipo,
    e.categoria,
    e.precio,
    e.cantidad
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
WHERE s.estado = 'activo'
ORDER BY e.precio DESC;

SELECT
    e.nombre AS equipo,
    e.categoria,
    e.precio
FROM equipos e
WHERE e.precio > (
    SELECT AVG(precio)
    FROM equipos
)
ORDER BY e.precio DESC;

SELECT
    s.nombre AS streamer,
    SUM(e.precio * e.cantidad) AS valor_total_inventario
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY valor_total_inventario DESC;

SELECT
    s.nombre AS streamer,
    COUNT(e.id_equipo) AS tipos_de_equipo,
    SUM(e.cantidad) AS total_unidades
FROM streamers s
LEFT JOIN equipos e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY total_unidades DESC, streamer;

SELECT
    e.categoria,
    COUNT(e.id_equipo) AS tipos_de_equipo,
    SUM(e.cantidad) AS total_unidades
FROM equipos e
GROUP BY e.categoria
ORDER BY total_unidades DESC, e.categoria;