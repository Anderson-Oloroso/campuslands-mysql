-- Consultas para Ejercicio 001 - CREATE TABLE para torneo esports MOBA
-- Concepto principal: CREATE TABLE
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM jugadores_moba;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM jugadores_moba;

-- 3. Consulta aplicando el concepto principal: CREATE TABLE
SELECT * FROM jugadores_moba
ORDER BY id_escuadra DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, rol, id_escuadra
FROM jugadores_moba
WHERE id_escuadra > (SELECT AVG(id_escuadra) FROM jugadores_moba)
ORDER BY id_escuadra DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_escuadra) AS promedio_valor,
    MIN(id_escuadra) AS valor_minimo,
    MAX(id_escuadra) AS valor_maximo
FROM jugadores_moba;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    rol,
    COUNT(*) AS cantidad,
    AVG(id_escuadra) AS promedio
FROM jugadores_moba
GROUP BY rol
ORDER BY cantidad DESC;
