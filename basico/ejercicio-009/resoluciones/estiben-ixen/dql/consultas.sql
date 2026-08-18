-- Consultas para Ejercicio 009 - DELETE controlado para kickboxing
-- Concepto principal: DELETE controlado
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM peleadores_kb;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM peleadores_kb;

-- 3. Consulta aplicando el concepto principal: DELETE controlado
SELECT * FROM peleadores_kb
ORDER BY id_gimnasio DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, categoria_peso, id_gimnasio
FROM peleadores_kb
WHERE id_gimnasio > (SELECT AVG(id_gimnasio) FROM peleadores_kb)
ORDER BY id_gimnasio DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_gimnasio) AS promedio_valor,
    MIN(id_gimnasio) AS valor_minimo,
    MAX(id_gimnasio) AS valor_maximo
FROM peleadores_kb;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    categoria_peso,
    COUNT(*) AS cantidad,
    AVG(id_gimnasio) AS promedio
FROM peleadores_kb
GROUP BY categoria_peso
ORDER BY cantidad DESC;
