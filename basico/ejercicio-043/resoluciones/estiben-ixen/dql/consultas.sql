-- Consultas para Ejercicio 043 - filtros por estado para catalogo de peliculas de miedo
-- Concepto principal: filtros por estado
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM peliculas_terror;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM peliculas_terror;

-- 3. Consulta aplicando el concepto principal: filtros por estado
SELECT * FROM peliculas_terror
ORDER BY duracion_min DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT titulo, subgenero, duracion_min
FROM peliculas_terror
WHERE duracion_min > (SELECT AVG(duracion_min) FROM peliculas_terror)
ORDER BY duracion_min DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(duracion_min) AS promedio_valor,
    MIN(duracion_min) AS valor_minimo,
    MAX(duracion_min) AS valor_maximo
FROM peliculas_terror;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    subgenero,
    COUNT(*) AS cantidad,
    AVG(duracion_min) AS promedio
FROM peliculas_terror
GROUP BY subgenero
ORDER BY cantidad DESC;
