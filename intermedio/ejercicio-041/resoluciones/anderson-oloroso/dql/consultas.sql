USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.jugador_id, t1.nombre_jugador, t1.club, t2.torneo, t2.sets_ganados, t2.duracion_min
FROM jugadores_pingpong t1
INNER JOIN partidos_pingpong t2 ON t1.jugador_id = t2.jugador_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_jugador, COUNT(t2.partido_id) AS total_relacionados
FROM jugadores_pingpong t1
LEFT JOIN partidos_pingpong t2 ON t1.jugador_id = t2.jugador_id
GROUP BY t1.jugador_id, t1.nombre_jugador;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_jugador, AVG(t2.duracion_min) AS promedio_score
FROM jugadores_pingpong t1
INNER JOIN partidos_pingpong t2 ON t1.jugador_id = t2.jugador_id
GROUP BY t1.jugador_id, t1.nombre_jugador
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT torneo, sets_ganados, duracion_min
FROM partidos_pingpong
WHERE duracion_min > (SELECT AVG(duracion_min) FROM partidos_pingpong);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_jugadores_pingpong AS
SELECT t1.nombre_jugador, t1.club, t2.torneo, t2.duracion_min
FROM jugadores_pingpong t1
INNER JOIN partidos_pingpong t2 ON t1.jugador_id = t2.jugador_id;

SELECT * FROM vista_reporte_jugadores_pingpong;
