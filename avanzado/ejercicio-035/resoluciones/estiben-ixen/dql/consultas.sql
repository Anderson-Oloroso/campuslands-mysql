-- Consultas Avanzadas para Ejercicio 035 - indices para taller mecanico de motos
-- Concepto principal: indices
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.moto AS elemento,
        p.nombre AS categoria,
        s.descripcion AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_mecanico ORDER BY s.descripcion DESC) AS ranking
    FROM servicios_taller s
    INNER JOIN mecanicos p ON s.id_mecanico = p.id_mecanico
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_servicio) AS cantidad_registros,
    AVG(s.descripcion) AS promedio_categoria,
    (AVG(s.descripcion) - (SELECT AVG(descripcion) FROM servicios_taller)) AS diferencia_vs_global
FROM mecanicos p
INNER JOIN servicios_taller s ON p.id_mecanico = s.id_mecanico
GROUP BY p.id_mecanico, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.moto AS nombre_destacado,
    p.nombre AS origen,
    s.descripcion AS metrica_maxima
FROM servicios_taller s
INNER JOIN mecanicos p ON s.id_mecanico = p.id_mecanico
ORDER BY s.descripcion DESC
LIMIT 3;
