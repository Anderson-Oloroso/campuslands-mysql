-- DQL: Consultas de verificación e indicadores de efectividad
USE campuslands_mysql;

-- 1. Listado general de jugadores con efectividad calculada
SELECT 
    torneo_id,
    nombre_jugador,
    categoria,
    partidos_jugados,
    partidos_ganados,
    ROUND((partidos_ganados / partidos_jugados) * 100, 1) AS porcentaje_efectividad,
    puntos_ranking,
    estado
FROM torneos_pingpong
WHERE partidos_jugados > 0
ORDER BY porcentaje_efectividad DESC;

-- 2. Conteo de jugadores y promedio de ranking agrupado por categoría
SELECT 
    categoria,
    COUNT(torneo_id) AS total_jugadores,
    SUM(partidos_jugados) AS total_partidos,
    ROUND(AVG(puntos_ranking), 0) AS promedio_ranking
FROM torneos_pingpong
GROUP BY categoria;

-- 3. Jugadores destacados con un porcentaje de efectividad superior al 70%
SELECT 
    nombre_jugador,
    categoria,
    puntos_ranking
FROM torneos_pingpong
WHERE (partidos_ganados / partidos_jugados) >= 0.70;

-- 4. Distribución de atletas por estado de participación en el torneo
SELECT 
    estado,
    COUNT(*) AS total_atletas
FROM torneos_pingpong
GROUP BY estado
ORDER BY total_atletas DESC;

-- 5. Ranking Top 3 con mayor cantidad de puntos acumulados
SELECT 
    nombre_jugador,
    categoria,
    puntos_ranking,
    estado
FROM torneos_pingpong
ORDER BY puntos_ranking DESC
LIMIT 3;
