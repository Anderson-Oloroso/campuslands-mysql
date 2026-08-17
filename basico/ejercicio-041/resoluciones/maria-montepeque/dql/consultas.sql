USE campuslands_mysql;

-- 1. Jugadores activos ordenados por ranking
SELECT nombre, categoria, ranking_puntos
FROM jugadores_pingpong_basico
WHERE estado = 'activo'
ORDER BY ranking_puntos DESC;

-- 2. Jugadores de una categoria especifica
SELECT nombre, ranking_puntos, partidos_ganados
FROM jugadores_pingpong_basico
WHERE categoria = 'avanzado';

-- 3. Jugadores con ranking alto (1800 o mas)
SELECT nombre, categoria, ranking_puntos
FROM jugadores_pingpong_basico
WHERE ranking_puntos >= 1800
ORDER BY ranking_puntos DESC;

-- 4. Ranking promedio por categoria
SELECT categoria, COUNT(*) AS total_jugadores, AVG(ranking_puntos) AS ranking_promedio
FROM jugadores_pingpong_basico
GROUP BY categoria
ORDER BY ranking_promedio DESC;

-- 5. Top 3 jugadores con mas partidos ganados
SELECT nombre, categoria, partidos_ganados
FROM jugadores_pingpong_basico
ORDER BY partidos_ganados DESC
LIMIT 3;

-- 6. Cantidad de jugadores por estado
SELECT estado, COUNT(*) AS total
FROM jugadores_pingpong_basico
GROUP BY estado
ORDER BY total DESC;
