USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.jugador_id, t1.nickname, t1.rango, t2.mapa, t2.posicion_final, t2.bajas_partida
FROM jugadores_br t1
INNER JOIN partidas_br t2 ON t1.jugador_id = t2.jugador_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nickname, COUNT(t2.partida_id) AS total_relacionados
FROM jugadores_br t1
LEFT JOIN partidas_br t2 ON t1.jugador_id = t2.jugador_id
GROUP BY t1.jugador_id, t1.nickname;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nickname, AVG(t2.bajas_partida) AS promedio_score
FROM jugadores_br t1
INNER JOIN partidas_br t2 ON t1.jugador_id = t2.jugador_id
GROUP BY t1.jugador_id, t1.nickname
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT mapa, posicion_final, bajas_partida
FROM partidas_br
WHERE bajas_partida > (SELECT AVG(bajas_partida) FROM partidas_br);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_jugadores_br AS
SELECT t1.nickname, t1.rango, t2.mapa, t2.bajas_partida
FROM jugadores_br t1
INNER JOIN partidas_br t2 ON t1.jugador_id = t2.jugador_id;

SELECT * FROM vista_reporte_jugadores_br;
