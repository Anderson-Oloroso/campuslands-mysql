USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.piloto_id, t1.nombre_piloto, t1.escuderia, t2.circuito, t2.posicion_salida, t2.tiempo_segundos
FROM pilotos_carreras t1
INNER JOIN tiempos_carreras t2 ON t1.piloto_id = t2.piloto_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_piloto, COUNT(t2.tiempo_id) AS total_relacionados
FROM pilotos_carreras t1
LEFT JOIN tiempos_carreras t2 ON t1.piloto_id = t2.piloto_id
GROUP BY t1.piloto_id, t1.nombre_piloto;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_piloto, AVG(t2.tiempo_segundos) AS promedio_score
FROM pilotos_carreras t1
INNER JOIN tiempos_carreras t2 ON t1.piloto_id = t2.piloto_id
GROUP BY t1.piloto_id, t1.nombre_piloto
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT circuito, posicion_salida, tiempo_segundos
FROM tiempos_carreras
WHERE tiempo_segundos > (SELECT AVG(tiempo_segundos) FROM tiempos_carreras);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_pilotos_carreras AS
SELECT t1.nombre_piloto, t1.escuderia, t2.circuito, t2.tiempo_segundos
FROM pilotos_carreras t1
INNER JOIN tiempos_carreras t2 ON t1.piloto_id = t2.piloto_id;

SELECT * FROM vista_reporte_pilotos_carreras;
