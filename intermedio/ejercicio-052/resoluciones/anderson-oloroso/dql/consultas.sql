USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.modelo_id, t1.nombre_modelo, t1.tipo_geometria, t2.resolucion, t2.tiempo_render_min, t2.formato_salida
FROM modelos_3d t1
INNER JOIN renders_animacion t2 ON t1.modelo_id = t2.modelo_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_modelo, COUNT(t2.render_id) AS total_relacionados
FROM modelos_3d t1
LEFT JOIN renders_animacion t2 ON t1.modelo_id = t2.modelo_id
GROUP BY t1.modelo_id, t1.nombre_modelo;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_modelo, AVG(t2.formato_salida) AS promedio_score
FROM modelos_3d t1
INNER JOIN renders_animacion t2 ON t1.modelo_id = t2.modelo_id
GROUP BY t1.modelo_id, t1.nombre_modelo
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT resolucion, tiempo_render_min, formato_salida
FROM renders_animacion
WHERE formato_salida > (SELECT AVG(formato_salida) FROM renders_animacion);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_modelos_3d AS
SELECT t1.nombre_modelo, t1.tipo_geometria, t2.resolucion, t2.formato_salida
FROM modelos_3d t1
INNER JOIN renders_animacion t2 ON t1.modelo_id = t2.modelo_id;

SELECT * FROM vista_reporte_modelos_3d;
