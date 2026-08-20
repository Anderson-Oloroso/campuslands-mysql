USE campuslands_mysql;

SELECT
    id_plato,
    nombre,
    categoria,
    precio
FROM platos
WHERE disponible = TRUE
ORDER BY nombre ASC;

SELECT
    id_plato,
    nombre,
    categoria,
    precio
FROM platos
ORDER BY precio DESC;

SELECT
    id_plato,
    nombre,
    categoria,
    precio
FROM platos
WHERE precio > 20.00
ORDER BY precio DESC;

SELECT
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos;


SELECT
    nombre AS plato,
    categoria,
    precio
FROM platos
WHERE disponible = TRUE
ORDER BY precio DESC
LIMIT 1;

SELECT
    categoria,
    COUNT(*) AS total_platos
FROM platos
GROUP BY categoria
ORDER BY total_platos DESC;

SELECT
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo
FROM platos
WHERE disponible = TRUE;