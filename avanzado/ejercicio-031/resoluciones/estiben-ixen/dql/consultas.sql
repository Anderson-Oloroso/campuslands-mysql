-- Consultas Avanzadas para Ejercicio 031 - transacciones para torneo esports MOBA
-- Concepto principal: transacciones
USE campuslands_mysql;

-- 1. Consulta Avanzada con CTE y Ranking
WITH ranking_datos AS (
    SELECT 
        s.nombre AS elemento,
        p.nombre AS categoria,
        s.id_escuadra AS metrica,
        DENSE_RANK() OVER (PARTITION BY p.id_escuadra ORDER BY s.id_escuadra DESC) AS ranking
    FROM jugadores_moba s
    INNER JOIN escuadras p ON s.nickname = p.id_escuadra
)
SELECT * FROM ranking_datos WHERE ranking <= 2;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_jugador) AS cantidad_registros,
    AVG(s.id_escuadra) AS promedio_categoria,
    (AVG(s.id_escuadra) - (SELECT AVG(id_escuadra) FROM jugadores_moba)) AS diferencia_vs_global
FROM escuadras p
INNER JOIN jugadores_moba s ON p.id_escuadra = s.nickname
GROUP BY p.id_escuadra, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre AS origen,
    s.id_escuadra AS metrica_maxima
FROM jugadores_moba s
INNER JOIN escuadras p ON s.nickname = p.id_escuadra
ORDER BY s.id_escuadra DESC
LIMIT 3;
