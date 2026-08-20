USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.servicio_id, t1.nombre_servicio, t1.categoria, t2.cliente, t2.estado_orden, t2.monto_total
FROM servicios_taller t1
INNER JOIN ordenes_taller t2 ON t1.servicio_id = t2.servicio_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_servicio, COUNT(t2.orden_id) AS total_relacionados
FROM servicios_taller t1
LEFT JOIN ordenes_taller t2 ON t1.servicio_id = t2.servicio_id
GROUP BY t1.servicio_id, t1.nombre_servicio;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_servicio, AVG(t2.monto_total) AS promedio_score
FROM servicios_taller t1
INNER JOIN ordenes_taller t2 ON t1.servicio_id = t2.servicio_id
GROUP BY t1.servicio_id, t1.nombre_servicio
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT cliente, estado_orden, monto_total
FROM ordenes_taller
WHERE monto_total > (SELECT AVG(monto_total) FROM ordenes_taller);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_servicios_taller AS
SELECT t1.nombre_servicio, t1.categoria, t2.cliente, t2.monto_total
FROM servicios_taller t1
INNER JOIN ordenes_taller t2 ON t1.servicio_id = t2.servicio_id;

SELECT * FROM vista_reporte_servicios_taller;
