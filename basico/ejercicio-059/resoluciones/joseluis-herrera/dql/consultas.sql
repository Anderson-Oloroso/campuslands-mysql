USE campuslands_mysql;

SELECT
    id_producto,
    nombre,
    categoria,
    fecha_publicacion,
    estado
FROM productos_accesorios
ORDER BY fecha_publicacion ASC;

SELECT
    nombre,
    categoria,
    fecha_publicacion,
    precio
FROM productos_accesorios
WHERE fecha_publicacion >= '2026-03-01'
ORDER BY fecha_publicacion ASC;

SELECT
    nombre,
    marca,
    fecha_actualizacion,
    estado
FROM productos_accesorios
WHERE fecha_actualizacion >= '2026-06-01'
  AND fecha_actualizacion < '2026-07-01'
ORDER BY fecha_actualizacion ASC;

SELECT
    nombre,
    categoria,
    fecha_publicacion,
    precio
FROM productos_accesorios
WHERE estado = 'activo'
  AND fecha_publicacion BETWEEN '2026-04-01' AND '2026-06-30'
ORDER BY fecha_publicacion ASC;