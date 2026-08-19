-- Consultas para Ejercicio 007 - ORDER BY para liga de futbol
-- Concepto principal: ORDER BY
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM futbolistas;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM futbolistas;

-- 3. Consulta aplicando el concepto principal: ORDER BY
SELECT * FROM futbolistas
ORDER BY id_club DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre, numero_camiseta, id_club
FROM futbolistas
WHERE id_club > (SELECT AVG(id_club) FROM futbolistas)
ORDER BY id_club DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(id_club) AS promedio_valor,
    MIN(id_club) AS valor_minimo,
    MAX(id_club) AS valor_maximo
FROM futbolistas;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    numero_camiseta,
    COUNT(*) AS cantidad,
    AVG(id_club) AS promedio
FROM futbolistas
GROUP BY numero_camiseta
ORDER BY cantidad DESC;
=======
USE campuslands_mysql;

-- ==========================================
-- CONSULTA 1
-- Equipos ordenados por puntos (mayor a menor)
-- ==========================================

SELECT
    nombre AS Equipo,
    puntos AS Puntos
FROM equipos
ORDER BY puntos DESC;


-- ==========================================
-- CONSULTA 2
-- Equipos ordenados alfabéticamente
-- ==========================================

SELECT
    nombre AS Equipo,
    ciudad AS Ciudad
FROM equipos
ORDER BY nombre ASC;


-- ==========================================
-- CONSULTA 3
-- Equipos ordenados por goles a favor
-- ==========================================

SELECT
    nombre AS Equipo,
    goles_favor AS Goles_Favor
FROM equipos
ORDER BY goles_favor DESC;


-- ==========================================
-- CONSULTA 4
-- Equipos ordenados por menos goles en contra
-- ==========================================

SELECT
    nombre AS Equipo,
    goles_contra AS Goles_Contra
FROM equipos
ORDER BY goles_contra ASC;


-- ==========================================
-- CONSULTA 5
-- Entrenadores ordenados por nombre
-- ==========================================

SELECT
    entrenador AS Entrenador,
    nombre AS Equipo
FROM equipos
ORDER BY entrenador ASC;


-- ==========================================
-- CONSULTA 6
-- Equipos ordenados por ciudad
-- ==========================================

SELECT
    nombre AS Equipo,
    ciudad AS Ciudad
FROM equipos
ORDER BY ciudad ASC;


-- ==========================================
-- CONSULTA 7
-- Equipos ordenados por partidos jugados
-- ==========================================

SELECT
    nombre AS Equipo,
    partidos_jugados AS Partidos
FROM equipos
ORDER BY partidos_jugados DESC;


-- ==========================================
-- CONSULTA 8
-- Equipos ordenados por estado y puntos
-- ==========================================

SELECT
    nombre AS Equipo,
    estado AS Estado,
    puntos AS Puntos
FROM equipos
ORDER BY estado ASC, puntos DESC;
