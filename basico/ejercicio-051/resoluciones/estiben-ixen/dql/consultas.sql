-- Consultas para Ejercicio 051 - WHERE para dibujo digital
-- Concepto principal: WHERE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM obras_digitales;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM obras_digitales;

-- 3. Consulta aplicando el concepto principal: WHERE
SELECT * FROM obras_digitales
ORDER BY cantidad_capas DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT titulo, estilo, cantidad_capas
FROM obras_digitales
WHERE cantidad_capas > (SELECT AVG(cantidad_capas) FROM obras_digitales)
ORDER BY cantidad_capas DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(cantidad_capas) AS promedio_valor,
    MIN(cantidad_capas) AS valor_minimo,
    MAX(cantidad_capas) AS valor_maximo
FROM obras_digitales;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    estilo,
    COUNT(*) AS cantidad,
    AVG(cantidad_capas) AS promedio
FROM obras_digitales
GROUP BY estilo
ORDER BY cantidad DESC;
