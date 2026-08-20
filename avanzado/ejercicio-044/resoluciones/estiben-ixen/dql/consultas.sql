-- Consultas Avanzadas para Ejercicio 044 - event scheduler para saga de ciencia ficcion
-- Concepto principal: event scheduler
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre_nave AS elemento,
        p.nombre_faccion AS categoria,
        s.tripulacion_max AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_faccion ORDER BY s.tripulacion_max DESC) AS ranking
    FROM naves_espaciales s
    INNER JOIN facciones_scifi p ON s.id_faccion = p.id_faccion
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_faccion AS categoria_principal,
    COUNT(s.id_nave) AS cantidad_registros,
    AVG(s.tripulacion_max) AS promedio_categoria,
    (AVG(s.tripulacion_max) - (SELECT AVG(tripulacion_max) FROM naves_espaciales)) AS diferencia_vs_global
FROM facciones_scifi p
INNER JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
GROUP BY p.id_faccion, p.nombre_faccion
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_nave AS nombre_destacado,
    p.nombre_faccion AS origen,
    s.tripulacion_max AS metrica_maxima
FROM naves_espaciales s
INNER JOIN facciones_scifi p ON s.id_faccion = p.id_faccion
ORDER BY s.tripulacion_max DESC
LIMIT 3;
