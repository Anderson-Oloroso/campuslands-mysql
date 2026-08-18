-- Consultas Avanzadas para Ejercicio 037 - vistas avanzadas para liga de futbol
-- Concepto principal: vistas avanzadas
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre AS elemento,
        p.nombre_club AS categoria,
        s.id_club AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_club ORDER BY s.id_club DESC) AS ranking
    FROM futbolistas s
    INNER JOIN clubes_futbol p ON s.posicion = p.id_club
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_club AS categoria_principal,
    COUNT(s.id_jugador) AS cantidad_registros,
    AVG(s.id_club) AS promedio_categoria,
    (AVG(s.id_club) - (SELECT AVG(id_club) FROM futbolistas)) AS diferencia_vs_global
FROM clubes_futbol p
INNER JOIN futbolistas s ON p.id_club = s.posicion
GROUP BY p.id_club, p.nombre_club
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre_club AS origen,
    s.id_club AS metrica_maxima
FROM futbolistas s
INNER JOIN clubes_futbol p ON s.posicion = p.id_club
ORDER BY s.id_club DESC
LIMIT 3;
