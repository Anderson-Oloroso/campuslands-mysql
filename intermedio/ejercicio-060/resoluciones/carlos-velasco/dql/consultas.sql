USE campuslands_mysql;

-- 1. Mostrar todos los equipos activos.
SELECT
    id_equipo,
    nombre_equipo,
    categoria,
    marca,
    modelo,
    precio,
    stock
FROM equipos_streaming
WHERE estado = 'activo'
ORDER BY nombre_equipo ASC;


-- 2. Mostrar los equipos con stock disponible.
SELECT
    nombre_equipo,
    categoria,
    stock
FROM equipos_streaming
WHERE stock > 0
ORDER BY stock DESC;


-- 3. Mostrar los equipos cuyo precio sea superior a 700.
SELECT
    nombre_equipo,
    marca,
    modelo,
    precio
FROM equipos_streaming
WHERE precio > 700
ORDER BY precio DESC;


-- 4. Obtener la cantidad de equipos registrados por categoría.
SELECT
    categoria,
    COUNT(*) AS total_equipos
FROM equipos_streaming
GROUP BY categoria
ORDER BY total_equipos DESC;


-- 5. Calcular el valor total del inventario por categoría.
SELECT
    categoria,
    SUM(precio * stock) AS valor_inventario
FROM equipos_streaming
GROUP BY categoria
ORDER BY valor_inventario DESC;


-- 6. Obtener los 5 equipos con mayor precio.
SELECT
    nombre_equipo,
    categoria,
    marca,
    precio
FROM equipos_streaming
ORDER BY precio DESC
LIMIT 5;