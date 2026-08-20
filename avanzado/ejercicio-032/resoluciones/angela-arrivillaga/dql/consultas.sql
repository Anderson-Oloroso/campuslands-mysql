USE campuslands_mysql;

-- 1. promedio de puntos de liga y total de victorias agrupados por rango
SELECT rango, AVG(puntos_liga) AS promedio_puntos, SUM(victorias_totales) AS total_victorias
FROM jugadores_br
WHERE estado != 'suspendido'
GROUP BY rango;

-- 2. top 3 jugadores con mayor puntaje de liga en el battle royale
SELECT gamertag, rango, puntos_liga, victorias_totales, estado
FROM jugadores_br
ORDER BY puntos_liga DESC
LIMIT 3;

-- 3. listado detallado de jugadores filtrados por un rango competitivo especifico
SELECT gamertag, puntos_liga, victorias_totales, estado
FROM jugadores_br
WHERE rango = 'Diamante'
ORDER BY puntos_liga DESC;

-- 4. reporte analítico de jugadores agrupados por estado actual con conteo y promedio de victorias
SELECT estado, COUNT(*) AS cantidad_jugadores, AVG(victorias_totales) AS promedio_victorias
FROM jugadores_br
GROUP BY estado;

-- 5. historial de partidas con información del jugador, desempeño y puntos obtenidos
SELECT j.gamertag, p.asesinatos, p.puesto_obtenido, p.puntos_ganados, p.fecha_partida
FROM partidas_br p
JOIN jugadores_br j ON p.jugador_id = j.id
ORDER BY p.fecha_partida DESC;