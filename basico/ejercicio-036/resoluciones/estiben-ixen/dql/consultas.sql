-- Consultas para Ejercicio 036 - WHERE para autos hiperdeportivos
-- Concepto principal: WHERE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM autos_hiperdeportivos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM autos_hiperdeportivos;

-- 3. Consulta aplicando el concepto principal: WHERE
SELECT * FROM autos_hiperdeportivos
ORDER BY velocidad_max DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT modelo, caballos_fuerza, velocidad_max
FROM autos_hiperdeportivos
WHERE velocidad_max > (SELECT AVG(velocidad_max) FROM autos_hiperdeportivos)
ORDER BY velocidad_max DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(velocidad_max) AS promedio_valor,
    MIN(velocidad_max) AS valor_minimo,
    MAX(velocidad_max) AS valor_maximo
FROM autos_hiperdeportivos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    caballos_fuerza,
    COUNT(*) AS cantidad,
    AVG(velocidad_max) AS promedio
FROM autos_hiperdeportivos
GROUP BY caballos_fuerza
ORDER BY cantidad DESC;
