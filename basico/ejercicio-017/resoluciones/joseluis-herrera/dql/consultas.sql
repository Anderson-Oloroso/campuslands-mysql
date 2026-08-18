USE campuslands_mysql;

SELECT
    id_producto,
    nombre,
    categoria,
    talla,
    precio,
    stock
FROM productos
WHERE disponible = TRUE
ORDER BY nombre ASC;

SELECT
    id_producto,
    nombre,
    categoria,
    precio
FROM productos
WHERE precio > 100.00
ORDER BY precio DESC;

SELECT
    nombre AS producto,
    talla,
    stock
FROM productos
WHERE stock > 0
ORDER BY stock DESC;

SELECT
    ROUND(AVG(precio), 2) AS precio_promedio
FROM productos;

SELECT
    nombre AS producto,
    categoria,
    precio
FROM productos
ORDER BY precio DESC
LIMIT 1;

SELECT
    categoria,
    COUNT(*) AS total_productos
FROM productos
GROUP BY categoria
ORDER BY total_productos DESC;

SELECT
    nombre AS producto,
    categoria,
    talla,
    stock,
    disponible
FROM productos
WHERE stock = 0
ORDER BY nombre ASC;