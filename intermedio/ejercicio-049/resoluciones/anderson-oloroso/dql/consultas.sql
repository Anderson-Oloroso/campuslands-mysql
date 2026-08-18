USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.salto_id, t1.instructor, t1.modalidad, t2.paracaidista, t2.tiempo_caida_libre_seg, t2.calificacion_aterrizaje
FROM saltos_paracaidismo t1
INNER JOIN bitacora_saltos t2 ON t1.salto_id = t2.salto_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.instructor, COUNT(t2.bitacora_id) AS total_relacionados
FROM saltos_paracaidismo t1
LEFT JOIN bitacora_saltos t2 ON t1.salto_id = t2.salto_id
GROUP BY t1.salto_id, t1.instructor;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.instructor, AVG(t2.calificacion_aterrizaje) AS promedio_score
FROM saltos_paracaidismo t1
INNER JOIN bitacora_saltos t2 ON t1.salto_id = t2.salto_id
GROUP BY t1.salto_id, t1.instructor
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT paracaidista, tiempo_caida_libre_seg, calificacion_aterrizaje
FROM bitacora_saltos
WHERE calificacion_aterrizaje > (SELECT AVG(calificacion_aterrizaje) FROM bitacora_saltos);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_saltos_paracaidismo AS
SELECT t1.instructor, t1.modalidad, t2.paracaidista, t2.calificacion_aterrizaje
FROM saltos_paracaidismo t1
INNER JOIN bitacora_saltos t2 ON t1.salto_id = t2.salto_id;

SELECT * FROM vista_reporte_saltos_paracaidismo;
