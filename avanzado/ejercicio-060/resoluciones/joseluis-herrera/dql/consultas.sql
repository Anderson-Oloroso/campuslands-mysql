USE campuslands_mysql;

SELECT
    id_equipo,
    nombre,
    categoria,
    marca,
    precio,
    stock
FROM equipos_streaming
WHERE estado = 'disponible'
ORDER BY nombre;

SELECT
    nombre,
    marca,
    categoria,
    precio,
    stock
FROM equipos_streaming
WHERE estado = 'disponible'
  AND categoria = 'Audio'
ORDER BY precio ASC;

SELECT
    nombre,
    categoria,
    stock,
    precio
FROM equipos_streaming
WHERE stock BETWEEN 1 AND 7
ORDER BY stock ASC;

SELECT
    categoria,
    COUNT(*) AS total_equipos,
    SUM(stock) AS stock_total,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM equipos_streaming
GROUP BY categoria
ORDER BY total_equipos DESC;