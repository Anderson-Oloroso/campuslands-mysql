USE campuslands_mysql;

-- 1. Top 3 del ranking (usa el procedimiento)
CALL sp_top_jugadores_br(3);

-- 2. Resumen completo de un jugador especifico (usa el procedimiento)
CALL sp_resumen_jugador_br('GhostRunner');

-- 3. Tabla de puntos completa, ordenada de mayor a menor
SELECT nickname, plataforma, puntos_temporada
FROM jugadores_avanzado
ORDER BY puntos_temporada DESC;

-- 4. Historial de partidas con los puntos que otorgo cada una
SELECT j.nickname, p.posicion_final, p.kills, p.puntos_obtenidos
FROM partidas_avanzado p
INNER JOIN jugadores_avanzado j ON j.id_jugador = p.id_jugador
ORDER BY p.id_partida;

-- 5. Promedio de puntos obtenidos por partida, por jugador
SELECT j.nickname, ROUND(AVG(p.puntos_obtenidos), 1) AS puntos_promedio_por_partida
FROM partidas_avanzado p
INNER JOIN jugadores_avanzado j ON j.id_jugador = p.id_jugador
GROUP BY j.nickname
ORDER BY puntos_promedio_por_partida DESC;

-- 6. Verificar consistencia: la suma de puntos_obtenidos de cada
-- jugador debe coincidir con su puntos_temporada
SELECT j.nickname, j.puntos_temporada, SUM(p.puntos_obtenidos) AS suma_partidas
FROM jugadores_avanzado j
INNER JOIN partidas_avanzado p ON p.id_jugador = j.id_jugador
GROUP BY j.nickname, j.puntos_temporada;
