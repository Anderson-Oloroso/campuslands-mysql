-- Consultas para Ejercicio 052 - ORDER BY para animacion 3D
-- Concepto principal: ORDER BY
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM personajes_3d;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM personajes_3d;

-- 3. Consulta aplicando el concepto principal: ORDER BY
SELECT * FROM personajes_3d
ORDER BY poligonos_count DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_modelo, software_modelado, poligonos_count
FROM personajes_3d
WHERE poligonos_count > (SELECT AVG(poligonos_count) FROM personajes_3d)
ORDER BY poligonos_count DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(poligonos_count) AS promedio_valor,
    MIN(poligonos_count) AS valor_minimo,
    MAX(poligonos_count) AS valor_maximo
FROM personajes_3d;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    software_modelado,
    COUNT(*) AS cantidad,
    AVG(poligonos_count) AS promedio
FROM personajes_3d
GROUP BY software_modelado
ORDER BY cantidad DESC;
