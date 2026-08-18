-- Consultas Avanzadas para Ejercicio 036 - EXPLAIN para autos hiperdeportivos
-- Concepto principal: EXPLAIN
USE campuslands_mysql;

-- 1. Analisis del plan de ejecucion con EXPLAIN
EXPLAIN SELECT 
    p.marca,
    s.modelo,
    s.velocidad_max
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
WHERE s.velocidad_max > 100
ORDER BY s.velocidad_max DESC;

-- 2. EXPLAIN FORMAT=TREE / ANALYZE
EXPLAIN ANALYZE SELECT 
    p.marca,
    COUNT(s.id_auto) AS total
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
GROUP BY p.marca;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.marca AS categoria_principal,
    COUNT(s.id_auto) AS cantidad_registros,
    AVG(s.velocidad_max) AS promedio_categoria,
    (AVG(s.velocidad_max) - (SELECT AVG(velocidad_max) FROM autos_hiperdeportivos)) AS diferencia_vs_global
FROM fabricantes_autos p
INNER JOIN autos_hiperdeportivos s ON p.id_fabricante = s.id_fabricante
GROUP BY p.id_fabricante, p.marca
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.modelo AS nombre_destacado,
    p.marca AS origen,
    s.velocidad_max AS metrica_maxima
FROM autos_hiperdeportivos s
INNER JOIN fabricantes_autos p ON s.id_fabricante = p.id_fabricante
ORDER BY s.velocidad_max DESC
LIMIT 3;
