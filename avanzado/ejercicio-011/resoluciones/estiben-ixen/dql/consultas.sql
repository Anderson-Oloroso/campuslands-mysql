-- Consultas Avanzadas para Ejercicio 011 - CTE para pingpong
-- Concepto principal: CTE
USE campuslands_mysql;

-- 1. Consulta utilizando Common Table Expressions (CTE)
WITH cte_resumen AS (
    SELECT 
        p.id_club,
        p.nombre AS entidad_principal,
        COUNT(s.id_jugador) AS total_elementos,
        AVG(s.id_club) AS promedio_metrica
    FROM clubes_pingpong p
    INNER JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
    GROUP BY p.id_club, p.nombre
)
SELECT * FROM cte_resumen
WHERE promedio_metrica > (SELECT AVG(promedio_metrica) FROM cte_resumen)
ORDER BY promedio_metrica DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_jugador) AS cantidad_registros,
    AVG(s.id_club) AS promedio_categoria,
    (AVG(s.id_club) - (SELECT AVG(id_club) FROM jugadores_pingpong)) AS diferencia_vs_global
FROM clubes_pingpong p
INNER JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
GROUP BY p.id_club, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre AS nombre_destacado,
    p.nombre AS origen,
    s.id_club AS metrica_maxima
FROM jugadores_pingpong s
INNER JOIN clubes_pingpong p ON s.mano_habil = p.id_club
ORDER BY s.id_club DESC
LIMIT 3;
