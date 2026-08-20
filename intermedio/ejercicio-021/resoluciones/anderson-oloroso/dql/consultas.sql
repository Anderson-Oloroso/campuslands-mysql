USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.ilustracion_id, t1.titulo_obra, t1.estilo_arte, t2.nombre_capa, t2.opacidad_porcentaje, t2.modo_fusion
FROM ilustraciones_digitales t1
INNER JOIN capas_ilustracion t2 ON t1.ilustracion_id = t2.ilustracion_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.titulo_obra, COUNT(t2.capa_id) AS total_relacionados
FROM ilustraciones_digitales t1
LEFT JOIN capas_ilustracion t2 ON t1.ilustracion_id = t2.ilustracion_id
GROUP BY t1.ilustracion_id, t1.titulo_obra;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.titulo_obra, AVG(t2.modo_fusion) AS promedio_score
FROM ilustraciones_digitales t1
INNER JOIN capas_ilustracion t2 ON t1.ilustracion_id = t2.ilustracion_id
GROUP BY t1.ilustracion_id, t1.titulo_obra
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_capa, opacidad_porcentaje, modo_fusion
FROM capas_ilustracion
WHERE modo_fusion > (SELECT AVG(modo_fusion) FROM capas_ilustracion);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_ilustraciones_digitales AS
SELECT t1.titulo_obra, t1.estilo_arte, t2.nombre_capa, t2.modo_fusion
FROM ilustraciones_digitales t1
INNER JOIN capas_ilustracion t2 ON t1.ilustracion_id = t2.ilustracion_id;

SELECT * FROM vista_reporte_ilustraciones_digitales;
