-- Consultas para Ejercicio 044 - fechas basicas para saga de ciencia ficcion
-- Concepto principal: fechas basicas
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM naves_espaciales;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM naves_espaciales;

-- 3. Consulta aplicando el concepto principal: fechas basicas
SELECT * FROM naves_espaciales
ORDER BY tripulacion_max DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_nave, id_faccion, tripulacion_max
FROM naves_espaciales
WHERE tripulacion_max > (SELECT AVG(tripulacion_max) FROM naves_espaciales)
ORDER BY tripulacion_max DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(tripulacion_max) AS promedio_valor,
    MIN(tripulacion_max) AS valor_minimo,
    MAX(tripulacion_max) AS valor_maximo
FROM naves_espaciales;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    id_faccion,
    COUNT(*) AS cantidad,
    AVG(tripulacion_max) AS promedio
FROM naves_espaciales
GROUP BY id_faccion
ORDER BY cantidad DESC;
