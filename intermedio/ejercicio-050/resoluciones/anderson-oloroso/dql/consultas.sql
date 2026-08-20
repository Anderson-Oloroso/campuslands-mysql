USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.tatuaje_id, t1.nombre_diseno, t1.estilo, t2.nombre_cliente, t2.tatuador, t2.horas_duracion
FROM tatuajes_estudio t1
INNER JOIN citas_tatuajes t2 ON t1.tatuaje_id = t2.tatuaje_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_diseno, COUNT(t2.cita_id) AS total_relacionados
FROM tatuajes_estudio t1
LEFT JOIN citas_tatuajes t2 ON t1.tatuaje_id = t2.tatuaje_id
GROUP BY t1.tatuaje_id, t1.nombre_diseno;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_diseno, AVG(t2.horas_duracion) AS promedio_score
FROM tatuajes_estudio t1
INNER JOIN citas_tatuajes t2 ON t1.tatuaje_id = t2.tatuaje_id
GROUP BY t1.tatuaje_id, t1.nombre_diseno
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_cliente, tatuador, horas_duracion
FROM citas_tatuajes
WHERE horas_duracion > (SELECT AVG(horas_duracion) FROM citas_tatuajes);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_tatuajes_estudio AS
SELECT t1.nombre_diseno, t1.estilo, t2.nombre_cliente, t2.horas_duracion
FROM tatuajes_estudio t1
INNER JOIN citas_tatuajes t2 ON t1.tatuaje_id = t2.tatuaje_id;

SELECT * FROM vista_reporte_tatuajes_estudio;
