USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.moto_id, t1.marca, t1.modelo, t2.tipo_servicio, t2.costo, t2.tecnico
FROM garaje_motos t1
INNER JOIN mantenimientos_motos t2 ON t1.moto_id = t2.moto_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.marca, COUNT(t2.mantenimiento_id) AS total_relacionados
FROM garaje_motos t1
LEFT JOIN mantenimientos_motos t2 ON t1.moto_id = t2.moto_id
GROUP BY t1.moto_id, t1.marca;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.marca, AVG(t2.tecnico) AS promedio_score
FROM garaje_motos t1
INNER JOIN mantenimientos_motos t2 ON t1.moto_id = t2.moto_id
GROUP BY t1.moto_id, t1.marca
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT tipo_servicio, costo, tecnico
FROM mantenimientos_motos
WHERE tecnico > (SELECT AVG(tecnico) FROM mantenimientos_motos);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_garaje_motos AS
SELECT t1.marca, t1.modelo, t2.tipo_servicio, t2.tecnico
FROM garaje_motos t1
INNER JOIN mantenimientos_motos t2 ON t1.moto_id = t2.moto_id;

SELECT * FROM vista_reporte_garaje_motos;
