-- Consultas para Ejercicio 053 - normalizacion 3FN para arquitectura 3D
-- Concepto principal: normalizacion 3FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_firma AS nombre_firma,
    s.nombre_obra AS nombre_obra,
    s.area_m2 AS metrica
FROM firmas_arquitectura p
INNER JOIN proyectos_bim s ON p.id_firma = s.id_firma
ORDER BY s.area_m2 DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_firma AS entidad_principal,
    COUNT(s.id_proyecto) AS total_registros,
    AVG(s.area_m2) AS promedio_metrica
FROM firmas_arquitectura p
INNER JOIN proyectos_bim s ON p.id_firma = s.id_firma
GROUP BY p.nombre_firma
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_firma AS entidad_principal,
    COUNT(s.id_proyecto) AS total_registros,
    AVG(s.area_m2) AS promedio_metrica
FROM firmas_arquitectura p
INNER JOIN proyectos_bim s ON p.id_firma = s.id_firma
GROUP BY p.nombre_firma
HAVING COUNT(s.id_proyecto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_firma AS entidad_principal,
    COALESCE(s.nombre_obra, 'Sin registros') AS detalle_asociado
FROM firmas_arquitectura p
LEFT JOIN proyectos_bim s ON p.id_firma = s.id_firma
ORDER BY p.nombre_firma;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_obra,
    s.area_m2,
    (SELECT p.nombre_firma FROM firmas_arquitectura p WHERE p.id_firma = s.id_firma) AS entidad_origen
FROM proyectos_bim s
WHERE s.area_m2 > (SELECT AVG(area_m2) FROM proyectos_bim)
ORDER BY s.area_m2 DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_obra AS nombre_elemento,
    p.nombre_firma AS categoria_principal,
    s.area_m2 AS valor_destacado
FROM proyectos_bim s
INNER JOIN firmas_arquitectura p ON s.id_firma = p.id_firma
ORDER BY s.area_m2 DESC
LIMIT 5;
