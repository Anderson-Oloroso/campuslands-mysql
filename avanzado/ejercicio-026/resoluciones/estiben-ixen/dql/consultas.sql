-- Consultas Avanzadas para Ejercicio 026 - CTE para videojuego RPG
-- Concepto principal: CTE
USE campuslands_mysql;

-- 1. Consulta utilizando Common Table Expressions (CTE)
WITH cte_resumen AS (
    SELECT 
        p.id_clase,
        p.nombre_clase AS entidad_principal,
        COUNT(s.id_heroe) AS total_elementos,
        AVG(s.puntos_vida) AS promedio_metrica
    FROM clases_personaje_rpg p
    INNER JOIN heroes_rpg s ON p.id_clase = s.id_clase
    GROUP BY p.id_clase, p.nombre_clase
)
SELECT * FROM cte_resumen
WHERE promedio_metrica > (SELECT AVG(promedio_metrica) FROM cte_resumen)
ORDER BY promedio_metrica DESC;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre_clase AS categoria_principal,
    COUNT(s.id_heroe) AS cantidad_registros,
    AVG(s.puntos_vida) AS promedio_categoria,
    (AVG(s.puntos_vida) - (SELECT AVG(puntos_vida) FROM heroes_rpg)) AS diferencia_vs_global
FROM clases_personaje_rpg p
INNER JOIN heroes_rpg s ON p.id_clase = s.id_clase
GROUP BY p.id_clase, p.nombre_clase
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.nombre_heroe AS nombre_destacado,
    p.nombre_clase AS origen,
    s.puntos_vida AS metrica_maxima
FROM heroes_rpg s
INNER JOIN clases_personaje_rpg p ON s.id_clase = p.id_clase
ORDER BY s.puntos_vida DESC
LIMIT 3;
