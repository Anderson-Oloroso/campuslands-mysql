-- Consultas para Ejercicio 041 - validaciones simples para pingpong
-- Concepto principal: validaciones simples
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM jugadores_pingpong;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM jugadores_pingpong;

-- 3. Consulta aplicando el concepto principal: validaciones simples
SELECT * FROM jugadores_pingpong
ORDER BY id_club DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, estilo_agarre, id_club
FROM jugadores_pingpong
WHERE id_club > (SELECT AVG(id_club) FROM jugadores_pingpong)
ORDER BY id_club DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_club) AS promedio_valor,
    MIN(id_club) AS valor_minimo,
    MAX(id_club) AS valor_maximo
FROM jugadores_pingpong;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    estilo_agarre,
    COUNT(*) AS cantidad,
    AVG(id_club) AS promedio
FROM jugadores_pingpong
GROUP BY estilo_agarre
ORDER BY cantidad DESC;
