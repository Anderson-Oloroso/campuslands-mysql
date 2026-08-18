-- Consultas para Ejercicio 049 - INSERT para paracaidismo
-- Concepto principal: INSERT
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM saltos_registrados;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM saltos_registrados;

-- 3. Consulta aplicando el concepto principal: INSERT
SELECT * FROM saltos_registrados
ORDER BY altitud_salto_pies DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT paracaidista, id_zona, altitud_salto_pies
FROM saltos_registrados
WHERE altitud_salto_pies > (SELECT AVG(altitud_salto_pies) FROM saltos_registrados)
ORDER BY altitud_salto_pies DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(altitud_salto_pies) AS promedio_valor,
    MIN(altitud_salto_pies) AS valor_minimo,
    MAX(altitud_salto_pies) AS valor_maximo
FROM saltos_registrados;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    id_zona,
    COUNT(*) AS cantidad,
    AVG(altitud_salto_pies) AS promedio
FROM saltos_registrados
GROUP BY id_zona
ORDER BY cantidad DESC;
