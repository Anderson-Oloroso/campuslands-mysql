USE campuslands_mysql;
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    fecha_publicacion,
    estado
FROM accesorios
ORDER BY fecha_publicacion DESC;

SELECT
    nombre AS accesorio,
    categoria,
    precio,
    fecha_publicacion
FROM accesorios
WHERE fecha_publicacion >= '2026-07-20'
ORDER BY fecha_publicacion ASC;


SELECT
    nombre AS accesorio,
    precio,
    fecha_publicacion
FROM accesorios
WHERE estado = 'activo'
  AND fecha_publicacion >= '2026-08-01'
  AND fecha_publicacion < '2026-09-01'
ORDER BY fecha_publicacion ASC;


SELECT
    AVG(precio) AS precio_promedio
FROM accesorios
WHERE fecha_publicacion >= '2026-07-01'
  AND fecha_publicacion < '2026-08-01';

SELECT
    nombre AS accesorio,
    categoria,
    precio,
    fecha_publicacion
FROM accesorios
WHERE estado = 'activo'
ORDER BY fecha_publicacion DESC
LIMIT 1;