-- Consultas para Ejercicio 038 - UPDATE para futbol sala
-- Concepto principal: UPDATE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM jugadores_futsal;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM jugadores_futsal;

-- 3. Consulta aplicando el concepto principal: UPDATE
SELECT * FROM jugadores_futsal
ORDER BY goles DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, id_equipo, goles
FROM jugadores_futsal
WHERE goles > (SELECT AVG(goles) FROM jugadores_futsal)
ORDER BY goles DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(goles) AS promedio_valor,
    MIN(goles) AS valor_minimo,
    MAX(goles) AS valor_maximo
FROM jugadores_futsal;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    id_equipo,
    COUNT(*) AS cantidad,
    AVG(goles) AS promedio
FROM jugadores_futsal
GROUP BY id_equipo
ORDER BY cantidad DESC;
