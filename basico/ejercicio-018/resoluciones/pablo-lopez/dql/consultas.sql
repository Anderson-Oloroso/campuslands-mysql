-- ============================================================
-- EJERCICIO 018 - PRIMARY KEY PARA VIAJES Y TURISMO
-- Archivo: dql/consultas.sql
-- Motor: MySQL
-- ============================================================

USE campuslands_mysql;

-- ============================================================
-- CONSULTA 1
-- Mostrar todos los destinos disponibles.
-- ============================================================

SELECT
    id_destino,
    nombre AS destino,
    pais,
    continente,
    costo_promedio
FROM destinos
WHERE estado = 'disponible'
ORDER BY nombre ASC;


-- ============================================================
-- CONSULTA 2
-- Mostrar destinos ordenados de menor a mayor costo.
-- ============================================================

SELECT
    id_destino,
    nombre AS destino,
    pais,
    costo_promedio AS costo_viaje
FROM destinos
ORDER BY costo_promedio ASC;


-- ============================================================
-- CONSULTA 3
-- Mostrar los 5 destinos disponibles con mayor costo.
-- ============================================================

SELECT
    id_destino,
    nombre AS destino,
    pais,
    costo_promedio AS costo_viaje,
    dias_recomendados
FROM destinos
WHERE estado = 'disponible'
ORDER BY costo_promedio DESC
LIMIT 5;


-- ============================================================
-- CONSULTA 4
-- Contar destinos por continente.
-- ============================================================

SELECT
    continente,
    COUNT(*) AS total_destinos
FROM destinos
GROUP BY continente
ORDER BY total_destinos DESC;


-- ============================================================
-- CONSULTA 5
-- Calcular el costo promedio por continente.
-- ============================================================

SELECT
    continente,
    COUNT(*) AS total_destinos,
    ROUND(AVG(costo_promedio), 2) AS costo_promedio
FROM destinos
GROUP BY continente
ORDER BY costo_promedio DESC;


-- ============================================================
-- CONSULTA 6
-- Calcular el costo total de todos los destinos disponibles.
-- ============================================================

SELECT
    COUNT(*) AS destinos_disponibles,
    ROUND(SUM(costo_promedio), 2) AS suma_costos,
    ROUND(AVG(costo_promedio), 2) AS costo_promedio
FROM destinos
WHERE estado = 'disponible';


-- ============================================================
-- CONSULTA 7
-- Mostrar destinos que requieren 7 días o más.
-- ============================================================

SELECT
    id_destino,
    nombre AS destino,
    pais,
    dias_recomendados,
    costo_promedio
FROM destinos
WHERE dias_recomendados >= 7
ORDER BY dias_recomendados DESC, costo_promedio DESC;


-- ============================================================
-- CONSULTA 8
-- Mostrar continentes que tienen al menos 2 destinos.
-- ============================================================

SELECT
    continente,
    COUNT(*) AS total_destinos,
    ROUND(AVG(costo_promedio), 2) AS costo_promedio
FROM destinos
GROUP BY continente
HAVING COUNT(*) >= 2
ORDER BY total_destinos DESC;