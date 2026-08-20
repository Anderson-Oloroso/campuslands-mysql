-- Consultas para Ejercicio 054 - DELETE controlado para soldadura
-- Concepto principal: DELETE controlado
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM proyectos_soldadura;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM proyectos_soldadura;

-- 3. Consulta aplicando el concepto principal: DELETE controlado
SELECT * FROM proyectos_soldadura
ORDER BY tipo_material DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_estructura, proceso_soldadura, tipo_material
FROM proyectos_soldadura
WHERE tipo_material > (SELECT AVG(tipo_material) FROM proyectos_soldadura)
ORDER BY tipo_material DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(tipo_material) AS promedio_valor,
    MIN(tipo_material) AS valor_minimo,
    MAX(tipo_material) AS valor_maximo
FROM proyectos_soldadura;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    proceso_soldadura,
    COUNT(*) AS cantidad,
    AVG(tipo_material) AS promedio
FROM proyectos_soldadura
GROUP BY proceso_soldadura
ORDER BY cantidad DESC;
