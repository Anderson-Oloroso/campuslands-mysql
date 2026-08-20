-- Consultas para Ejercicio 060 - relaciones simples para equipo de streaming
-- Concepto principal: relaciones simples
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM dispositivos_setup;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM dispositivos_setup;

-- 3. Consulta aplicando el concepto principal: relaciones simples
SELECT * FROM dispositivos_setup
ORDER BY marca DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_hardware, tipo_dispositivo, marca
FROM dispositivos_setup
WHERE marca > (SELECT AVG(marca) FROM dispositivos_setup)
ORDER BY marca DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(marca) AS promedio_valor,
    MIN(marca) AS valor_minimo,
    MAX(marca) AS valor_maximo
FROM dispositivos_setup;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    tipo_dispositivo,
    COUNT(*) AS cantidad,
    AVG(marca) AS promedio
FROM dispositivos_setup
GROUP BY tipo_dispositivo
ORDER BY cantidad DESC;
