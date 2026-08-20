-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    v.titulo,
    c.nombre AS categoria,
    v.estado
FROM videojuegos v
INNER JOIN categorias c
ON v.categoria_id = c.id;

SELECT
    titulo,
    plataforma
FROM videojuegos
WHERE estado='Disponible';

SELECT
    v.titulo,
    c.nombre AS categoria
FROM videojuegos v
INNER JOIN categorias c
ON v.categoria_id=c.id
WHERE c.nombre='RPG';

SELECT
    c.nombre AS categoria,
    COUNT(v.id) AS total_videojuegos
FROM categorias c
INNER JOIN videojuegos v
ON c.id=v.categoria_id
GROUP BY c.nombre;

SELECT
    titulo,
    fecha_lanzamiento
FROM videojuegos
ORDER BY fecha_lanzamiento DESC;

SELECT
    titulo,
    desarrollador
FROM videojuegos
WHERE estado='Prestado';