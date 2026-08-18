USE campuslands_mysql;

SELECT
    pais,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY pais
ORDER BY total_destinos DESC;

SELECT
    pais,
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos
GROUP BY pais
ORDER BY precio_promedio DESC;


SELECT
    pais,
    MIN(precio_desde) AS precio_minimo,
    MAX(precio_desde) AS precio_maximo
FROM destinos
GROUP BY pais
ORDER BY precio_minimo ASC;

SELECT
    tipo_destino,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY tipo_destino
ORDER BY total_destinos DESC;

SELECT
    tipo_destino,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos
GROUP BY tipo_destino
ORDER BY precio_promedio DESC;

SELECT
    disponible,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY disponible
ORDER BY disponible DESC;

SELECT
    pais,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos
GROUP BY pais
HAVING AVG(precio_desde) > 2000
ORDER BY precio_promedio DESC;