-- DQL: Consultas relacionales y análisis de rendimiento en sets de Ping-Pong
USE campuslands_mysql;

-- 1. Detalle completo de marcadores indicando al ganador de cada set
SELECT 
    marcador_id,
    jugador_local,
    jugador_visitante,
    CONCAT(puntos_local, ' - ', puntos_visitante) AS resultado_set,
    set_numero,
    CASE 
        WHEN puntos_local > puntos_visitante THEN jugador_local
        ELSE jugador_visitante
    END AS ganador_set,
    duracion_minutos
FROM marcadores_pingpong
ORDER BY marcador_id ASC;

-- 2. Conteo de sets disputados por desempate (Deuce / Ventaja con más de 11 puntos)
SELECT 
    categoria,
    COUNT(*) AS total_sets_deuce,
    ROUND(AVG(duracion_minutos), 2) AS duracion_promedio_min
FROM marcadores_pingpong
WHERE puntos_local > 11 OR puntos_visitante > 11
GROUP BY categoria;

-- 3. Promedio de puntos anotados por set agrupado por categoría
SELECT 
    categoria,
    COUNT(marcador_id) AS total_sets,
    ROUND(AVG(puntos_local + puntos_visitante), 1) AS promedio_puntos_por_set,
    ROUND(SUM(duracion_minutos), 1) AS tiempo_total_jugado_min
FROM marcadores_pingpong
GROUP BY categoria;

-- 4. Identificación de sets más disputados con menor diferencia de puntos
SELECT 
    jugador_local,
    jugador_visitante,
    puntos_local,
    puntos_visitante,
    ABS(puntos_local - puntos_visitante) AS diferencia_puntos,
    categoria
FROM marcadores_pingpong
WHERE ABS(puntos_local - puntos_visitante) = 2
ORDER BY duracion_minutos DESC;

-- 5. Consulta de validación para confirmar que no existan marcadores inválidos
SELECT 
    COUNT(*) AS marcadores_invalidos_detectados
FROM marcadores_pingpong
WHERE (puntos_local < 11 AND puntos_visitante < 11)
   OR ABS(puntos_local - puntos_visitante) < 2;
