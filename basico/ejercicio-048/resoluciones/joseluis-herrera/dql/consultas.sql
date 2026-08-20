USE campuslands_mysql;

SELECT
    id_destino,
    nombre,
    pais,
    categoria,
    precio
FROM destinos
ORDER BY nombre;

SELECT
    nombre,
    pais,
    precio
FROM destinos
WHERE estado = 'disponible'
ORDER BY precio ASC;

SELECT
    categoria,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio),2) AS precio_promedio
FROM destinos
GROUP BY categoria
ORDER BY precio_promedio DESC;

SELECT
    nombre,
    pais,
    duracion_dias
FROM destinos
WHERE duracion_dias >= 6
ORDER BY duracion_dias DESC;

SELECT
    nombre,
    pais,
    precio
FROM destinos
ORDER BY precio DESC
LIMIT 5;

SELECT
    pais,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY pais
ORDER BY total_destinos DESC;