-- Consultas para Ejercicio 040 - COUNT y SUM para carreras urbanas
-- Concepto principal: COUNT y SUM
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM vehiculos_tuning;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM vehiculos_tuning;

-- 3. Consulta aplicando el concepto principal: COUNT y SUM
SELECT * FROM vehiculos_tuning
ORDER BY potencia_hp DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT modelo, traccion, potencia_hp
FROM vehiculos_tuning
WHERE potencia_hp > (SELECT AVG(potencia_hp) FROM vehiculos_tuning)
ORDER BY potencia_hp DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(potencia_hp) AS promedio_valor,
    MIN(potencia_hp) AS valor_minimo,
    MAX(potencia_hp) AS valor_maximo
FROM vehiculos_tuning;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    traccion,
    COUNT(*) AS cantidad,
    AVG(potencia_hp) AS promedio
FROM vehiculos_tuning
GROUP BY traccion
ORDER BY cantidad DESC;
