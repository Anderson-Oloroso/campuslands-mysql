USE campuslands_mysql;

-- 1. Consultar todos los equipos activos.
SELECT
    id_equipo,
    nombre,
    categoria,
    marca,
    precio,
    stock
FROM equipos_streaming
WHERE estado = 'activo'
ORDER BY nombre;


-- 2. Consultar los equipos con precio superior a 100.
SELECT
    nombre,
    categoria,
    marca,
    precio
FROM equipos_streaming
WHERE precio > 100
ORDER BY precio DESC;


-- 3. Consultar los 5 equipos con mayor stock.
SELECT
    nombre,
    categoria,
    stock
FROM equipos_streaming
WHERE estado = 'activo'
ORDER BY stock DESC
LIMIT 5;


-- 4. Contar equipos disponibles por categoría.
SELECT
    categoria,
    COUNT(*) AS total_equipos
FROM equipos_streaming
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY total_equipos DESC, categoria;


-- 5. Calcular el valor total del inventario activo.
SELECT
    SUM(precio * stock) AS valor_total_inventario
FROM equipos_streaming
WHERE estado = 'activo';


-- 6. Obtener el precio promedio por categoría.
SELECT
    categoria,
    COUNT(*) AS total_equipos,
    AVG(precio) AS precio_promedio
FROM equipos_streaming
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- 7. Consultar equipos activos con stock bajo.
SELECT
    nombre,
    categoria,
    stock
FROM equipos_streaming
WHERE estado = 'activo'
  AND stock BETWEEN 1 AND 5
ORDER BY stock ASC, nombre;


-- 8. Identificar el equipo activo de mayor precio.
SELECT
    nombre,
    categoria,
    marca,
    precio
FROM equipos_streaming
WHERE estado = 'activo'
ORDER BY precio DESC
LIMIT 1;