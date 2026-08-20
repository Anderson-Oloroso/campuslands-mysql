-- Consultas Avanzadas para Ejercicio 050 - indices para estudio de tatuajes
-- Concepto principal: indices
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.cliente AS elemento,
        p.nombre AS categoria,
        s.horas_sesion AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_artista ORDER BY s.horas_sesion DESC) AS ranking
    FROM citas_tatuajes s
    INNER JOIN artistas_tatuadores p ON s.id_artista = p.id_artista
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_cita) AS cantidad_registros,
    AVG(s.horas_sesion) AS promedio_categoria,
    (AVG(s.horas_sesion) - (SELECT AVG(horas_sesion) FROM citas_tatuajes)) AS diferencia_vs_global
FROM artistas_tatuadores p
INNER JOIN citas_tatuajes s ON p.id_artista = s.id_artista
GROUP BY p.id_artista, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.cliente AS nombre_destacado,
    p.nombre AS origen,
    s.horas_sesion AS metrica_maxima
FROM citas_tatuajes s
INNER JOIN artistas_tatuadores p ON s.id_artista = p.id_artista
ORDER BY s.horas_sesion DESC
LIMIT 3;
