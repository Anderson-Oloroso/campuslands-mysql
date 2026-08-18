USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.equipo_id, t1.nombre_equipo, t1.region, t2.nombre_jugador, t2.rol, t2.kda
FROM equipos_moba t1
INNER JOIN jugadores_moba t2 ON t1.equipo_id = t2.equipo_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_equipo, COUNT(t2.jugador_id) AS total_relacionados
FROM equipos_moba t1
LEFT JOIN jugadores_moba t2 ON t1.equipo_id = t2.equipo_id
GROUP BY t1.equipo_id, t1.nombre_equipo;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_equipo, AVG(t2.kda) AS promedio_score
FROM equipos_moba t1
INNER JOIN jugadores_moba t2 ON t1.equipo_id = t2.equipo_id
GROUP BY t1.equipo_id, t1.nombre_equipo
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_jugador, rol, kda
FROM jugadores_moba
WHERE kda > (SELECT AVG(kda) FROM jugadores_moba);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_equipos_moba AS
SELECT t1.nombre_equipo, t1.region, t2.nombre_jugador, t2.kda
FROM equipos_moba t1
INNER JOIN jugadores_moba t2 ON t1.equipo_id = t2.equipo_id;

SELECT * FROM vista_reporte_equipos_moba;
