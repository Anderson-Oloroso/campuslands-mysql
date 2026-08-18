USE campuslands_mysql;

SELECT
    id_prenda,
    nombre,
    categoria,
    talla,
    precio,
    stock,
    disponible
FROM prendas
WHERE disponible = TRUE
ORDER BY nombre;

SELECT
    nombre,
    categoria,
    talla,
    precio
FROM prendas
WHERE precio BETWEEN 50 AND 150
ORDER BY precio ASC;

SELECT
    categoria,
    COUNT(*) AS total_prendas,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM prendas
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    nombre,
    categoria,
    stock
FROM prendas
WHERE stock < 10
ORDER BY stock ASC;

SELECT
    nombre,
    categoria,
    precio
FROM prendas
ORDER BY precio DESC
LIMIT 5;

SELECT
    categoria,
    SUM(stock) AS unidades_disponibles,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM prendas
WHERE disponible = TRUE
GROUP BY categoria
ORDER BY unidades_disponibles DESC;

SELECT
    nombre,
    categoria,
    precio,
    stock
FROM prendas
WHERE disponible = TRUE
  AND precio < 100
  AND stock > 5
ORDER BY precio ASC;