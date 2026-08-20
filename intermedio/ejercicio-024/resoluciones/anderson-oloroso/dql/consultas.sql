USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.trabajo_id, t1.tipo_soldadura, t1.material_base, t2.inspector, t2.resultado_prueba, t2.nivel_defecto
FROM trabajos_soldadura t1
INNER JOIN inspecciones_soldadura t2 ON t1.trabajo_id = t2.trabajo_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.tipo_soldadura, COUNT(t2.inspeccion_id) AS total_relacionados
FROM trabajos_soldadura t1
LEFT JOIN inspecciones_soldadura t2 ON t1.trabajo_id = t2.trabajo_id
GROUP BY t1.trabajo_id, t1.tipo_soldadura;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.tipo_soldadura, AVG(t2.nivel_defecto) AS promedio_score
FROM trabajos_soldadura t1
INNER JOIN inspecciones_soldadura t2 ON t1.trabajo_id = t2.trabajo_id
GROUP BY t1.trabajo_id, t1.tipo_soldadura
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT inspector, resultado_prueba, nivel_defecto
FROM inspecciones_soldadura
WHERE nivel_defecto > (SELECT AVG(nivel_defecto) FROM inspecciones_soldadura);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_trabajos_soldadura AS
SELECT t1.tipo_soldadura, t1.material_base, t2.inspector, t2.nivel_defecto
FROM trabajos_soldadura t1
INNER JOIN inspecciones_soldadura t2 ON t1.trabajo_id = t2.trabajo_id;

SELECT * FROM vista_reporte_trabajos_soldadura;
