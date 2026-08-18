-- Consultas Avanzadas para Ejercicio 015 - optimizacion para biblioteca gamer
-- Concepto principal: optimizacion
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.titulo AS elemento,
        p.nombre_estudio AS categoria,
        s.metacritic_score AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_estudio ORDER BY s.metacritic_score DESC) AS ranking
    FROM videojuegos_catalogo s
    INNER JOIN estudios_desarrollo p ON s.id_estudio = p.id_estudio
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_estudio AS categoria_principal,
    COUNT(s.id_videojuego) AS cantidad_registros,
    AVG(s.metacritic_score) AS promedio_categoria,
    (AVG(s.metacritic_score) - (SELECT AVG(metacritic_score) FROM videojuegos_catalogo)) AS diferencia_vs_global
FROM estudios_desarrollo p
INNER JOIN videojuegos_catalogo s ON p.id_estudio = s.id_estudio
GROUP BY p.id_estudio, p.nombre_estudio
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.titulo AS nombre_destacado,
    p.nombre_estudio AS origen,
    s.metacritic_score AS metrica_maxima
FROM videojuegos_catalogo s
INNER JOIN estudios_desarrollo p ON s.id_estudio = p.id_estudio
ORDER BY s.metacritic_score DESC
LIMIT 3;
