USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.auto_id, t1.marca, t1.modelo, t2.pista, t2.velocidad_max, t2.tiempo_lap
FROM autos_hiperdeportivos t1
INNER JOIN pruebas_velocidad t2 ON t1.auto_id = t2.auto_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.marca, COUNT(t2.prueba_id) AS total_relacionados
FROM autos_hiperdeportivos t1
LEFT JOIN pruebas_velocidad t2 ON t1.auto_id = t2.auto_id
GROUP BY t1.auto_id, t1.marca;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.marca, AVG(t2.tiempo_lap) AS promedio_score
FROM autos_hiperdeportivos t1
INNER JOIN pruebas_velocidad t2 ON t1.auto_id = t2.auto_id
GROUP BY t1.auto_id, t1.marca
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT pista, velocidad_max, tiempo_lap
FROM pruebas_velocidad
WHERE tiempo_lap > (SELECT AVG(tiempo_lap) FROM pruebas_velocidad);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_autos_hiperdeportivos AS
SELECT t1.marca, t1.modelo, t2.pista, t2.tiempo_lap
FROM autos_hiperdeportivos t1
INNER JOIN pruebas_velocidad t2 ON t1.auto_id = t2.auto_id;

SELECT * FROM vista_reporte_autos_hiperdeportivos;
