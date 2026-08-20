USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.streamer_id, t1.nickname_streamer, t1.plataforma, t2.titulo_stream, t2.espectadores_pico, t2.horas_duracion
FROM streamers_equipo t1
INNER JOIN transmisiones_stream t2 ON t1.streamer_id = t2.streamer_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nickname_streamer, COUNT(t2.transmision_id) AS total_relacionados
FROM streamers_equipo t1
LEFT JOIN transmisiones_stream t2 ON t1.streamer_id = t2.streamer_id
GROUP BY t1.streamer_id, t1.nickname_streamer;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nickname_streamer, AVG(t2.horas_duracion) AS promedio_score
FROM streamers_equipo t1
INNER JOIN transmisiones_stream t2 ON t1.streamer_id = t2.streamer_id
GROUP BY t1.streamer_id, t1.nickname_streamer
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT titulo_stream, espectadores_pico, horas_duracion
FROM transmisiones_stream
WHERE horas_duracion > (SELECT AVG(horas_duracion) FROM transmisiones_stream);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_streamers_equipo AS
SELECT t1.nickname_streamer, t1.plataforma, t2.titulo_stream, t2.horas_duracion
FROM streamers_equipo t1
INNER JOIN transmisiones_stream t2 ON t1.streamer_id = t2.streamer_id;

SELECT * FROM vista_reporte_streamers_equipo;
