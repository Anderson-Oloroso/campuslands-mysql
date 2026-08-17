USE db_pingpong;

SELECT nombre, nivel, partidos_ganados FROM jugadores ORDER BY partidos_ganados DESC;
SELECT nivel, COUNT(*) AS total_jugadores FROM jugadores GROUP BY nivel;
SELECT nombre, partidos_ganados, partidos_perdidos FROM jugadores WHERE estado = 'Activo' ORDER BY partidos_ganados DESC LIMIT 5;
SELECT nivel, AVG(partidos_ganados) AS promedio_victorias FROM jugadores GROUP BY nivel;
SELECT estado, COUNT(*) AS cantidad FROM jugadores GROUP BY estado;