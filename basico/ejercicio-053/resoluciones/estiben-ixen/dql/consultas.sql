-- Consultas para Ejercicio 053 - UPDATE para arquitectura 3D
-- Concepto principal: UPDATE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM proyectos_bim;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM proyectos_bim;

-- 3. Consulta aplicando el concepto principal: UPDATE
SELECT * FROM proyectos_bim
ORDER BY area_m2 DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_obra, tipologia, area_m2
FROM proyectos_bim
WHERE area_m2 > (SELECT AVG(area_m2) FROM proyectos_bim)
ORDER BY area_m2 DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(area_m2) AS promedio_valor,
    MIN(area_m2) AS valor_minimo,
    MAX(area_m2) AS valor_maximo
FROM proyectos_bim;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    tipologia,
    COUNT(*) AS cantidad,
    AVG(area_m2) AS promedio
FROM proyectos_bim
GROUP BY tipologia
ORDER BY cantidad DESC;
