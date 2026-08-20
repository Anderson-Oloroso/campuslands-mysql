-- Consultas Avanzadas para Ejercicio 052 - vistas avanzadas para animacion 3D
-- Concepto principal: vistas avanzadas
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre_modelo AS elemento,
        p.nombre_estudio AS categoria,
        s.poligonos_count AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_estudio ORDER BY s.poligonos_count DESC) AS ranking
    FROM personajes_3d s
    INNER JOIN estudios_animacion p ON s.id_estudio = p.id_estudio
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_estudio AS categoria_principal,
    COUNT(s.id_personaje) AS cantidad_registros,
    AVG(s.poligonos_count) AS promedio_categoria,
    (AVG(s.poligonos_count) - (SELECT AVG(poligonos_count) FROM personajes_3d)) AS diferencia_vs_global
FROM estudios_animacion p
INNER JOIN personajes_3d s ON p.id_estudio = s.id_estudio
GROUP BY p.id_estudio, p.nombre_estudio
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_modelo AS nombre_destacado,
    p.nombre_estudio AS origen,
    s.poligonos_count AS metrica_maxima
FROM personajes_3d s
INNER JOIN estudios_animacion p ON s.id_estudio = p.id_estudio
ORDER BY s.poligonos_count DESC
LIMIT 3;
