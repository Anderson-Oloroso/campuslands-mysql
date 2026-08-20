-- Consultas Avanzadas para Ejercicio 051 - EXPLAIN para dibujo digital
-- Concepto principal: EXPLAIN
USE campuslands_mysql;

-- 1. Analisis del plan de ejecucion con EXPLAIN
EXPLAIN SELECT 
    p.nombre_artistico,
    s.titulo,
    s.cantidad_capas
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
WHERE s.cantidad_capas > 100
ORDER BY s.cantidad_capas DESC;

-- 2. EXPLAIN FORMAT=TREE / ANALYZE
EXPLAIN ANALYZE SELECT 
    p.nombre_artistico,
    COUNT(s.id_obra) AS total
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
GROUP BY p.nombre_artistico;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_artistico AS categoria_principal,
    COUNT(s.id_obra) AS cantidad_registros,
    AVG(s.cantidad_capas) AS promedio_categoria,
    (AVG(s.cantidad_capas) - (SELECT AVG(cantidad_capas) FROM obras_digitales)) AS diferencia_vs_global
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
GROUP BY p.id_ilustrador, p.nombre_artistico
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.titulo AS nombre_destacado,
    p.nombre_artistico AS origen,
    s.cantidad_capas AS metrica_maxima
FROM obras_digitales s
INNER JOIN ilustradores_digitales p ON s.id_ilustrador = p.id_ilustrador
ORDER BY s.cantidad_capas DESC
LIMIT 3;
