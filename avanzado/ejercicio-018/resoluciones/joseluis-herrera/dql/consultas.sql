USE campuslands_mysql;

SELECT
    id_destino,
    CONCAT(nombre, ' - ', pais) AS destino_completo,
    tipo_destino,
    precio_desde
FROM destinos
ORDER BY nombre ASC;

SELECT
    id_destino,
    UPPER(nombre) AS destino,
    UPPER(pais) AS pais
FROM destinos
ORDER BY nombre ASC;

SELECT
    nombre AS destino,
    LOWER(pais) AS pais,
    tipo_destino
FROM destinos
ORDER BY pais ASC;

SELECT
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos;

SELECT
    MIN(precio_desde) AS precio_minimo,
    MAX(precio_desde) AS precio_maximo,
    ROUND(AVG(precio_desde), 2) AS precio_promedio
FROM destinos;

SELECT
    COUNT(*) AS total_destinos_disponibles
FROM destinos
WHERE disponible = TRUE;

SELECT
    nombre AS destino,
    fecha_registro,
    DATEDIFF('2026-08-17', fecha_registro) AS dias_desde_registro
FROM destinos
ORDER BY dias_desde_registro DESC;


SELECT
    nombre AS destino,
    precio_desde,
    ROUND(precio_desde, 0) AS precio_redondeado,
    CASE
        WHEN precio_desde < 1000 THEN 'Económico'
        WHEN precio_desde < 3000 THEN 'Moderado'
        ELSE 'Premium'
    END AS categoria_precio
FROM destinos
ORDER BY precio_desde ASC;

SELECT
    COALESCE(
        ROUND(AVG(precio_desde), 2),
        0
    ) AS precio_promedio_disponible
FROM destinos
WHERE disponible = TRUE;

SELECT
    nombre AS destino,
    pais,
    precio_desde
FROM destinos
ORDER BY precio_desde DESC
LIMIT 5;