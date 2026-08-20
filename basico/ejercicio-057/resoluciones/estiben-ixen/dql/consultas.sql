-- Consultas para Ejercicio 057 - modelado de entidad para videojuego de accion y aventura
-- Concepto principal: modelado de entidad
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM artefactos_magicos;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM artefactos_magicos;

-- 3. Consulta aplicando el concepto principal: modelado de entidad
SELECT * FROM artefactos_magicos
ORDER BY poder_ataque DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_artefacto, tipo_artefacto, poder_ataque
FROM artefactos_magicos
WHERE poder_ataque > (SELECT AVG(poder_ataque) FROM artefactos_magicos)
ORDER BY poder_ataque DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(poder_ataque) AS promedio_valor,
    MIN(poder_ataque) AS valor_minimo,
    MAX(poder_ataque) AS valor_maximo
FROM artefactos_magicos;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    tipo_artefacto,
    COUNT(*) AS cantidad,
    AVG(poder_ataque) AS promedio
FROM artefactos_magicos
GROUP BY tipo_artefacto
ORDER BY cantidad DESC;
