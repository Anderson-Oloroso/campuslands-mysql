USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.cancion_id, t1.titulo_cancion, t1.artista, t2.nombre_playlist, t2.orden_cancion, t2.fecha_agregado
FROM canciones_playlist t1
INNER JOIN detalles_playlist t2 ON t1.cancion_id = t2.cancion_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.titulo_cancion, COUNT(t2.detalle_id) AS total_relacionados
FROM canciones_playlist t1
LEFT JOIN detalles_playlist t2 ON t1.cancion_id = t2.cancion_id
GROUP BY t1.cancion_id, t1.titulo_cancion;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.titulo_cancion, AVG(t2.fecha_agregado) AS promedio_score
FROM canciones_playlist t1
INNER JOIN detalles_playlist t2 ON t1.cancion_id = t2.cancion_id
GROUP BY t1.cancion_id, t1.titulo_cancion
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_playlist, orden_cancion, fecha_agregado
FROM detalles_playlist
WHERE fecha_agregado > (SELECT AVG(fecha_agregado) FROM detalles_playlist);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_canciones_playlist AS
SELECT t1.titulo_cancion, t1.artista, t2.nombre_playlist, t2.fecha_agregado
FROM canciones_playlist t1
INNER JOIN detalles_playlist t2 ON t1.cancion_id = t2.cancion_id;

SELECT * FROM vista_reporte_canciones_playlist;
