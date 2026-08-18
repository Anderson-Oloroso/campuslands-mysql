USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por puntos_ranking descendentemente
SELECT jugador_id, nombre_jugador, club, ranking_nacional, puntos_ranking, estado
FROM jugadores_pingpong
ORDER BY puntos_ranking DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT jugador_id, nombre_jugador, club, puntos_ranking
FROM jugadores_pingpong
WHERE estado = 'Activo';

-- 3. Agrupar por club y calcular total y promedio de puntos_ranking
SELECT club, COUNT(*) AS total_registros, AVG(puntos_ranking) AS promedio_valor
FROM jugadores_pingpong
GROUP BY club
ORDER BY promedio_valor DESC;

-- 4. Filtrar por puntos_ranking mayor a 2000
SELECT jugador_id, nombre_jugador, club, puntos_ranking
FROM jugadores_pingpong
WHERE puntos_ranking > 2000.00
ORDER BY puntos_ranking ASC;

-- 5. Seleccionar los 5 mejores registros según puntos_ranking
SELECT jugador_id, nombre_jugador, club, puntos_ranking
FROM jugadores_pingpong
ORDER BY puntos_ranking DESC
LIMIT 5;
