USE campuslands_mysql;

SELECT
    id_plato,
    nombre,
    categoria,
    precio,
    calorias,
    estado
FROM platos
WHERE estado = 'disponible'
ORDER BY nombre;

SELECT
    nombre,
    categoria,
    precio
FROM platos
WHERE precio < 30
ORDER BY precio ASC;

SELECT
    categoria,
    COUNT(*) AS total_platos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    nombre,
    categoria,
    calorias
FROM platos
WHERE calorias <= 700
ORDER BY calorias ASC;

SELECT
    nombre,
    categoria,
    precio
FROM platos
ORDER BY precio DESC
LIMIT 5;

SELECT
    estado,
    COUNT(*) AS total_platos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM platos
GROUP BY estado
ORDER BY total_platos DESC;