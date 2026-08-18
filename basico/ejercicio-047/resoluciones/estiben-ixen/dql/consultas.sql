-- Consultas para Ejercicio 047 - tipos de datos para tienda de ropa
-- Concepto principal: tipos de datos
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM prendas_vestir;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM prendas_vestir;

-- 3. Consulta aplicando el concepto principal: tipos de datos
SELECT * FROM prendas_vestir
ORDER BY color DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_articulo, talla, color
FROM prendas_vestir
WHERE color > (SELECT AVG(color) FROM prendas_vestir)
ORDER BY color DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(color) AS promedio_valor,
    MIN(color) AS valor_minimo,
    MAX(color) AS valor_maximo
FROM prendas_vestir;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    talla,
    COUNT(*) AS cantidad,
    AVG(color) AS promedio
FROM prendas_vestir
GROUP BY talla
ORDER BY cantidad DESC;
