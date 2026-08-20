-- Consultas para Ejercicio 055 - COUNT y SUM para laboratorio de formulas quimicas
-- Concepto principal: COUNT y SUM
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM reactivos_quimicos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM reactivos_quimicos;

-- 3. Consulta aplicando el concepto principal: COUNT y SUM
SELECT * FROM reactivos_quimicos
ORDER BY pureza_porcentaje DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_quimico, id_laboratorio, pureza_porcentaje
FROM reactivos_quimicos
WHERE pureza_porcentaje > (SELECT AVG(pureza_porcentaje) FROM reactivos_quimicos)
ORDER BY pureza_porcentaje DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(pureza_porcentaje) AS promedio_valor,
    MIN(pureza_porcentaje) AS valor_minimo,
    MAX(pureza_porcentaje) AS valor_maximo
FROM reactivos_quimicos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    id_laboratorio,
    COUNT(*) AS cantidad,
    AVG(pureza_porcentaje) AS promedio
FROM reactivos_quimicos
GROUP BY id_laboratorio
ORDER BY cantidad DESC;
