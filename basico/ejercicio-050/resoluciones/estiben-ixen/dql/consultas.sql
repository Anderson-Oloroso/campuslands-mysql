-- Consultas para Ejercicio 050 - SELECT para estudio de tatuajes
-- Concepto principal: SELECT
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM citas_tatuajes;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM citas_tatuajes;

-- 3. Consulta aplicando el concepto principal: SELECT
SELECT * FROM citas_tatuajes
ORDER BY horas_sesion DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT cliente, zona_cuerpo, horas_sesion
FROM citas_tatuajes
WHERE horas_sesion > (SELECT AVG(horas_sesion) FROM citas_tatuajes)
ORDER BY horas_sesion DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(horas_sesion) AS promedio_valor,
    MIN(horas_sesion) AS valor_minimo,
    MAX(horas_sesion) AS valor_maximo
FROM citas_tatuajes;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    zona_cuerpo,
    COUNT(*) AS cantidad,
    AVG(horas_sesion) AS promedio
FROM citas_tatuajes
GROUP BY zona_cuerpo
ORDER BY cantidad DESC;
