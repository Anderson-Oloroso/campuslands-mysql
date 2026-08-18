USE campuslands_mysql;

-- 1. Consultar todos los productos ordenados por fecha de publicación.
SELECT
    nombre_producto AS producto,
    categoria,
    vendedor,
    precio,
    fecha_publicacion,
    estado
FROM productos_accesorios
ORDER BY fecha_publicacion ASC;


-- 2. Consultar productos publicados desde febrero de 2026.
SELECT
    nombre_producto AS producto,
    categoria,
    fecha_publicacion,
    precio
FROM productos_accesorios
WHERE fecha_publicacion >= '2026-02-01'
ORDER BY fecha_publicacion ASC;


-- 3. Consultar productos actualizados durante marzo de 2026.
SELECT
    nombre_producto AS producto,
    vendedor,
    fecha_actualizacion,
    estado
FROM productos_accesorios
WHERE fecha_actualizacion BETWEEN '2026-03-01' AND '2026-03-31'
ORDER BY fecha_actualizacion DESC;


-- 4. Consultar los 5 productos con publicación más reciente.
SELECT
    nombre_producto AS producto,
    categoria,
    fecha_publicacion
FROM productos_accesorios
ORDER BY fecha_publicacion DESC
LIMIT 5;


-- 5. Consultar productos activos publicados antes de marzo de 2026.
SELECT
    nombre_producto AS producto,
    precio,
    fecha_publicacion,
    estado
FROM productos_accesorios
WHERE estado = 'activo'
  AND fecha_publicacion < '2026-03-01'
ORDER BY fecha_publicacion ASC;