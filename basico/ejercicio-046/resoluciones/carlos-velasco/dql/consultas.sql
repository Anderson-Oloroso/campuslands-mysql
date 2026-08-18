USE campuslands_mysql;

-- 1. Mostrar todos los platos registrados.
SELECT
    id_plato,
    nombre,
    categoria,
    precio,
    disponible
FROM platos
ORDER BY nombre ASC;


-- 2. Mostrar los platos actualmente disponibles.
SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE disponible = TRUE
ORDER BY precio ASC;


-- 3. Mostrar los platos con precio igual o superior a 30.
SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE precio >= 30
ORDER BY precio DESC;


-- 4. Contar cuantos platos existen por categoria.
SELECT
    categoria,
    COUNT(*) AS total_platos
FROM platos
GROUP BY categoria
ORDER BY total_platos DESC;


-- 5. Calcular el precio promedio por categoria.
SELECT
    categoria,
    COUNT(*) AS total_platos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos
GROUP BY categoria
ORDER BY precio_promedio DESC;


-- 6. Mostrar los cinco platos mas caros.
SELECT
    nombre,
    categoria,
    precio
FROM platos
ORDER BY precio DESC
LIMIT 5;