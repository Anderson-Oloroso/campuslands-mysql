USE campuslands_mysql;

SELECT
    categoria,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY categoria
ORDER BY total_destinos DESC;

SELECT
    pais,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio),2) AS precio_promedio
FROM destinos
GROUP BY pais
ORDER BY precio_promedio DESC;

SELECT
    estado,
    COUNT(*) AS destinos,
    ROUND(AVG(duracion_dias),2) AS duracion_promedio
FROM destinos
GROUP BY estado
ORDER BY destinos DESC;

SELECT
    categoria,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(precio),2) AS precio_promedio
FROM destinos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    pais,
    SUM(precio) AS valor_total_paquetes
FROM destinos
GROUP BY pais
ORDER BY valor_total_paquetes DESC;

SELECT
    duracion_dias,
    COUNT(*) AS cantidad_paquetes
FROM destinos
GROUP BY duracion_dias
ORDER BY duracion_dias ASC;

SELECT
    categoria,
    COUNT(*) AS total,
    ROUND(AVG(precio),2) AS promedio
FROM destinos
WHERE estado = 'disponible'
GROUP BY categoria
ORDER BY promedio DESC;