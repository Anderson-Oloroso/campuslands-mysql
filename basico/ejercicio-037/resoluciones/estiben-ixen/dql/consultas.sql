-- Consultas para Ejercicio 037 - ORDER BY para liga de futbol
-- Concepto principal: ORDER BY
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM futbolistas;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM futbolistas;

-- 3. Consulta aplicando el concepto principal: ORDER BY
SELECT * FROM futbolistas
ORDER BY id_club DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, numero_camiseta, id_club
FROM futbolistas
WHERE id_club > (SELECT AVG(id_club) FROM futbolistas)
ORDER BY id_club DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_club) AS promedio_valor,
    MIN(id_club) AS valor_minimo,
    MAX(id_club) AS valor_maximo
FROM futbolistas;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    numero_camiseta,
    COUNT(*) AS cantidad,
    AVG(id_club) AS promedio
FROM futbolistas
GROUP BY numero_camiseta
ORDER BY cantidad DESC;
