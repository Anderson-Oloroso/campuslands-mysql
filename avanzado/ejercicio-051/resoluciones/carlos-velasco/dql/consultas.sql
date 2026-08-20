USE campuslands_mysql;

-- 1. Consultar todas las ilustraciones activas.
SELECT
    id_ilustracion,
    titulo,
    artista,
    tecnica,
    nivel,
    precio,
    fecha_creacion
FROM ilustraciones
WHERE estado = 'activa'
ORDER BY fecha_creacion DESC;


-- 2. Consultar ilustraciones de una técnica específica.
SELECT
    id_ilustracion,
    titulo,
    artista,
    nivel,
    precio
FROM ilustraciones
WHERE tecnica = 'ilustracion digital'
ORDER BY precio DESC;


-- 3. Obtener las ilustraciones activas con precio superior a 100.
SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM ilustraciones
WHERE estado = 'activa'
  AND precio > 100
ORDER BY precio DESC;


-- 4. Obtener indicadores por técnica.
SELECT
    tecnica,
    COUNT(*) AS total_ilustraciones,
    AVG(precio) AS precio_promedio,
    MAX(precio) AS precio_maximo
FROM ilustraciones
GROUP BY tecnica
ORDER BY precio_promedio DESC;


-- 5. Obtener las cinco ilustraciones activas de mayor precio.
SELECT
    titulo,
    artista,
    tecnica,
    precio
FROM ilustraciones
WHERE estado = 'activa'
ORDER BY precio DESC
LIMIT 5;


-- 6. Analizar el plan de ejecución de la consulta
-- que filtra por técnica y estado.
EXPLAIN
SELECT
    id_ilustracion,
    titulo,
    artista,
    nivel,
    precio
FROM ilustraciones
WHERE tecnica = 'pixel art'
  AND estado = 'activa';


-- 7. Analizar el plan de ejecución de una consulta
-- que utiliza únicamente el campo de técnica.
EXPLAIN
SELECT
    titulo,
    artista,
    precio
FROM ilustraciones
WHERE tecnica = 'concept art';