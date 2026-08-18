USE campuslands_mysql;

SELECT
    id_destino,
    nombre,
    pais,
    tipo_destino,
    precio_desde,
    disponible
FROM destinos
ORDER BY id_destino ASC;

SELECT
    id_destino,
    nombre AS destino,
    pais,
    precio_desde
FROM destinos
WHERE disponible = TRUE
ORDER BY precio_desde ASC;

SELECT
    id_destino,
    nombre AS destino,
    pais,
    precio_desde
FROM destinos
WHERE precio_desde < 3000.00
ORDER BY precio_desde ASC;

SELECT
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos;

SELECT
    id_destino,
    nombre AS destino,
    pais,
    precio_desde
FROM destinos
ORDER BY precio_desde ASC
LIMIT 1;

SELECT
    pais,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY pais
ORDER BY total_destinos DESC;

SELECT
    id_destino,
    nombre AS destino,
    pais,
    precio_desde
FROM destinos
WHERE tipo_destino = 'Playa'
ORDER BY precio_desde ASC;