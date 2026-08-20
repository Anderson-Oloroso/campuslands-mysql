-- Consultas Avanzadas para Ejercicio 060 - optimizacion para equipo de streaming
-- Concepto principal: optimizacion
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre_hardware AS elemento,
        p.nickname AS categoria,
        s.marca AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_streamer ORDER BY s.marca DESC) AS ranking
    FROM dispositivos_setup s
    INNER JOIN canales_streamers p ON s.id_streamer = p.id_streamer
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nickname AS categoria_principal,
    COUNT(s.id_dispositivo) AS cantidad_registros,
    AVG(s.marca) AS promedio_categoria,
    (AVG(s.marca) - (SELECT AVG(marca) FROM dispositivos_setup)) AS diferencia_vs_global
FROM canales_streamers p
INNER JOIN dispositivos_setup s ON p.id_streamer = s.id_streamer
GROUP BY p.id_streamer, p.nickname
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_hardware AS nombre_destacado,
    p.nickname AS origen,
    s.marca AS metrica_maxima
FROM dispositivos_setup s
INNER JOIN canales_streamers p ON s.id_streamer = p.id_streamer
ORDER BY s.marca DESC
LIMIT 3;
