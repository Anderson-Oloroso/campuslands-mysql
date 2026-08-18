-- Consultas para Ejercicio 058 - filtros por estado para academia tech
-- Concepto principal: filtros por estado
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM campers_estudiantes;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM campers_estudiantes;

-- 3. Consulta aplicando el concepto principal: filtros por estado
SELECT * FROM campers_estudiantes
ORDER BY promedio_acumulado DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, id_ruta, promedio_acumulado
FROM campers_estudiantes
WHERE promedio_acumulado > (SELECT AVG(promedio_acumulado) FROM campers_estudiantes)
ORDER BY promedio_acumulado DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(promedio_acumulado) AS promedio_valor,
    MIN(promedio_acumulado) AS valor_minimo,
    MAX(promedio_acumulado) AS valor_maximo
FROM campers_estudiantes;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    id_ruta,
    COUNT(*) AS cantidad,
    AVG(promedio_acumulado) AS promedio
FROM campers_estudiantes
GROUP BY id_ruta
ORDER BY cantidad DESC;
