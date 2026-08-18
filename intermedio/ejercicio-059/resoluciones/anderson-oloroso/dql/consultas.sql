USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.accesorio_id, t1.nombre_producto, t1.categoria, t2.comprador, t2.cantidad, t2.calificacion_servicio
FROM accesorios_market t1
INNER JOIN ventas_accesorios t2 ON t1.accesorio_id = t2.accesorio_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_producto, COUNT(t2.venta_id) AS total_relacionados
FROM accesorios_market t1
LEFT JOIN ventas_accesorios t2 ON t1.accesorio_id = t2.accesorio_id
GROUP BY t1.accesorio_id, t1.nombre_producto;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_producto, AVG(t2.calificacion_servicio) AS promedio_score
FROM accesorios_market t1
INNER JOIN ventas_accesorios t2 ON t1.accesorio_id = t2.accesorio_id
GROUP BY t1.accesorio_id, t1.nombre_producto
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT comprador, cantidad, calificacion_servicio
FROM ventas_accesorios
WHERE calificacion_servicio > (SELECT AVG(calificacion_servicio) FROM ventas_accesorios);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_accesorios_market AS
SELECT t1.nombre_producto, t1.categoria, t2.comprador, t2.calificacion_servicio
FROM accesorios_market t1
INNER JOIN ventas_accesorios t2 ON t1.accesorio_id = t2.accesorio_id;

SELECT * FROM vista_reporte_accesorios_market;
