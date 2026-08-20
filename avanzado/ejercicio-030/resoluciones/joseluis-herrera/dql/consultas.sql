USE campuslands_mysql;

SELECT
    s.nombre AS streamer,
    s.plataforma,
    e.nombre AS equipo,
    e.categoria,
    e.precio
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
WHERE s.estado = 'activo'
ORDER BY e.precio DESC;

SELECT
    e.nombre AS equipo,
    e.categoria,
    e.precio,
    e.cantidad
FROM equipos e
WHERE e.categoria = 'Audio'
ORDER BY e.precio DESC;

SELECT
    e.nombre AS equipo,
    e.categoria,
    e.precio
FROM equipos e
WHERE e.precio BETWEEN 500.00 AND 1000.00
ORDER BY e.precio DESC;

SELECT
    s.nombre AS streamer,
    COUNT(e.id_equipo) AS tipos_de_equipo,
    SUM(e.precio * e.cantidad) AS valor_total_inventario
FROM streamers s
INNER JOIN equipos e
    ON s.id_streamer = e.id_streamer
GROUP BY s.id_streamer, s.nombre
ORDER BY valor_total_inventario DESC;

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
    e.nombre AS equipo,
    e.categoria,
    e.precio,
    e.cantidad,
    e.precio * e.cantidad AS valor_inventario
FROM equipos e
ORDER BY valor_inventario DESC
LIMIT 5;

EXPLAIN
SELECT
    e.nombre,
    e.categoria,
    e.precio
FROM equipos e
WHERE e.categoria = 'Audio';

EXPLAIN
SELECT
    e.nombre,
    e.categoria,
    e.precio
FROM equipos e
WHERE e.precio BETWEEN 500.00 AND 1000.00;