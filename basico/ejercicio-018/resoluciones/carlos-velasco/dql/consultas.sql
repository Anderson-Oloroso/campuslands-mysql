USE campuslands_mysql;


-- 1. Mostrar todos los destinos disponibles.
SELECT
    id_destino,
    nombre,
    pais,
    ciudad,
    tipo_destino,
    precio,
    duracion_dias
FROM destinos
WHERE estado = 'activo'
ORDER BY nombre ASC;


-- 2. Mostrar destinos con precio inferior a 1000.
SELECT
    nombre,
    pais,
    ciudad,
    precio
FROM destinos
WHERE precio < 1000
ORDER BY precio ASC;


-- 3. Mostrar los destinos con duración de 5 días o más.
SELECT
    nombre,
    pais,
    duracion_dias,
    precio
FROM destinos
WHERE duracion_dias >= 5
ORDER BY duracion_dias DESC, precio DESC;


-- 4. Calcular el costo por día de cada destino.
SELECT
    nombre,
    duracion_dias,
    precio,
    ROUND(precio / duracion_dias, 2) AS costo_por_dia
FROM destinos
ORDER BY costo_por_dia ASC;


-- 5. Obtener la cantidad y precio promedio por tipo de destino.
SELECT
    tipo_destino,
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM destinos
GROUP BY tipo_destino
ORDER BY precio_promedio DESC;


-- 6. Obtener los 5 destinos más costosos.
SELECT
    nombre,
    pais,
    ciudad,
    precio
FROM destinos
ORDER BY precio DESC
LIMIT 5;


-- 7. Obtener un resumen general de los destinos activos.
SELECT
    COUNT(*) AS total_destinos,
    ROUND(AVG(precio), 2) AS precio_promedio,
    MIN(precio) AS precio_minimo,
    MAX(precio) AS precio_maximo,
    ROUND(AVG(duracion_dias), 2) AS duracion_promedio
FROM destinos
WHERE estado = 'activo';