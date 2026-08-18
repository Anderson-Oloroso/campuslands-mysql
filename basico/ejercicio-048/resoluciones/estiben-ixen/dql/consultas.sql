-- Consultas para Ejercicio 048 - PRIMARY KEY para viajes y turismo
-- Concepto principal: PRIMARY KEY
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM paquetes_turisticos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM paquetes_turisticos;

-- 3. Consulta aplicando el concepto principal: PRIMARY KEY
SELECT * FROM paquetes_turisticos
ORDER BY precio_por_persona DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_paquete, duracion_dias, precio_por_persona
FROM paquetes_turisticos
WHERE precio_por_persona > (SELECT AVG(precio_por_persona) FROM paquetes_turisticos)
ORDER BY precio_por_persona DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(precio_por_persona) AS promedio_valor,
    MIN(precio_por_persona) AS valor_minimo,
    MAX(precio_por_persona) AS valor_maximo
FROM paquetes_turisticos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    duracion_dias,
    COUNT(*) AS cantidad,
    AVG(precio_por_persona) AS promedio
FROM paquetes_turisticos
GROUP BY duracion_dias
ORDER BY cantidad DESC;
