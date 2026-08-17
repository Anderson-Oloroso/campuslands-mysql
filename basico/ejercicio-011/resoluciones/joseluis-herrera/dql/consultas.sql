

SELECT * FROM jugadores
WHERE categoria = 'Sub-18'
ORDER BY puntos_ranking DESC;

SELECT j.nombre, COUNT(p.partido_id) AS total_partidos
	FROM jugadores j
	LEFT JOIN partidos p ON j.jugador_id = p.jugador_1_id OR j.jugador_id = p.jugador_2_id
	GROUP BY j.jugador_id, j.nombre;

SELECT partido_id, jugador_1_id, puntos_j1, jugador_2_id,
	puntos_j2,
	(puntos_j1 + puntos_j2) AS total_puntos
	FROM partidos
	ORDER BY total_puntos DESC
	LIMIT 1;