USE campuslands_mysql;

SELECT
    equipo.nombre AS equipo,
    equipo.marca,
    categoria.nombre AS categoria,
    equipo.precio,
    equipo.stock,
    equipo.estado
FROM equipos_streaming AS equipo
INNER JOIN categorias AS categoria
    ON equipo.id_categoria = categoria.id_categoria
ORDER BY equipo.nombre;

SELECT
    equipo.nombre AS equipo,
    categoria.nombre AS categoria,
    equipo.stock
FROM equipos_streaming AS equipo
INNER JOIN categorias AS categoria
    ON equipo.id_categoria = categoria.id_categoria
WHERE equipo.estado = 'disponible'
ORDER BY equipo.stock DESC;

SELECT
    equipo.nombre AS equipo,
    equipo.marca,
    equipo.precio,
    equipo.stock
FROM equipos_streaming AS equipo
INNER JOIN categorias AS categoria
    ON equipo.id_categoria = categoria.id_categoria
WHERE categoria.nombre = 'Audio'
ORDER BY equipo.precio ASC;