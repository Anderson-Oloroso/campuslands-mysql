USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.plano_id, t1.nombre_proyecto, t1.tipo_estructura, t2.nombre_elemento, t2.material, t2.costo_estimado
FROM planos_arquitectura t1
INNER JOIN elementos_edificio t2 ON t1.plano_id = t2.plano_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_proyecto, COUNT(t2.elemento_id) AS total_relacionados
FROM planos_arquitectura t1
LEFT JOIN elementos_edificio t2 ON t1.plano_id = t2.plano_id
GROUP BY t1.plano_id, t1.nombre_proyecto;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_proyecto, AVG(t2.costo_estimado) AS promedio_score
FROM planos_arquitectura t1
INNER JOIN elementos_edificio t2 ON t1.plano_id = t2.plano_id
GROUP BY t1.plano_id, t1.nombre_proyecto
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_elemento, material, costo_estimado
FROM elementos_edificio
WHERE costo_estimado > (SELECT AVG(costo_estimado) FROM elementos_edificio);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_planos_arquitectura AS
SELECT t1.nombre_proyecto, t1.tipo_estructura, t2.nombre_elemento, t2.costo_estimado
FROM planos_arquitectura t1
INNER JOIN elementos_edificio t2 ON t1.plano_id = t2.plano_id;

SELECT * FROM vista_reporte_planos_arquitectura;
