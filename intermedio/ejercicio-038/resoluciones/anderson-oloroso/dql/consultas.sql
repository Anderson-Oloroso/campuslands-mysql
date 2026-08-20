USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.equipo_id, t1.nombre_equipo, t1.categoria, t2.nombre_jugador, t2.dorsal, t2.asistencias
FROM equipos_futsal t1
INNER JOIN jugadores_futsal t2 ON t1.equipo_id = t2.equipo_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_equipo, COUNT(t2.jugador_id) AS total_relacionados
FROM equipos_futsal t1
LEFT JOIN jugadores_futsal t2 ON t1.equipo_id = t2.equipo_id
GROUP BY t1.equipo_id, t1.nombre_equipo;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_equipo, AVG(t2.asistencias) AS promedio_score
FROM equipos_futsal t1
INNER JOIN jugadores_futsal t2 ON t1.equipo_id = t2.equipo_id
GROUP BY t1.equipo_id, t1.nombre_equipo
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_jugador, dorsal, asistencias
FROM jugadores_futsal
WHERE asistencias > (SELECT AVG(asistencias) FROM jugadores_futsal);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_equipos_futsal AS
SELECT t1.nombre_equipo, t1.categoria, t2.nombre_jugador, t2.asistencias
FROM equipos_futsal t1
INNER JOIN jugadores_futsal t2 ON t1.equipo_id = t2.equipo_id;

SELECT * FROM vista_reporte_equipos_futsal;
