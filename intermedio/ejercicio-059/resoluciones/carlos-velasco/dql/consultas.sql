USE campuslands_mysql;

-- 1. Consultar todos los accesorios activos mediante la vista.
SELECT
    id_accesorio,
    nombre,
    categoria,
    precio,
    fecha_publicacion
FROM vista_accesorios_activos
ORDER BY fecha_publicacion ASC;


-- 2. Consultar los accesorios activos con precio superior a 100.
SELECT
    nombre,
    categoria,
    precio
FROM vista_accesorios_activos
WHERE precio > 100
ORDER BY precio DESC;


-- 3. Consultar los accesorios activos publicados desde marzo de 2026.
SELECT
    nombre,
    categoria,
    fecha_publicacion,
    precio
FROM vista_accesorios_activos
WHERE fecha_publicacion >= '2026-03-01'
ORDER BY fecha_publicacion ASC;


-- 4. Contar los accesorios activos por categoría.
SELECT
    categoria,
    COUNT(*) AS total_accesorios
FROM vista_accesorios_activos
GROUP BY categoria
ORDER BY total_accesorios DESC, categoria ASC;


-- 5. Calcular el precio promedio de los accesorios activos.
SELECT
    COUNT(*) AS total_accesorios,
    AVG(precio) AS precio_promedio
FROM vista_accesorios_activos;


-- 6. Obtener los 5 accesorios activos con mayor precio.
SELECT
    nombre,
    categoria,
    precio
FROM vista_accesorios_activos
ORDER BY precio DESC
LIMIT 5;