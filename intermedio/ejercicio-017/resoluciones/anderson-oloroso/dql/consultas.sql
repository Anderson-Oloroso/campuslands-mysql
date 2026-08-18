USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.prenda_id, t1.nombre_prenda, t1.categoria, t2.cliente, t2.unidades_vendidas, t2.monto_total
FROM prendas_ropa t1
INNER JOIN ventas_prendas t2 ON t1.prenda_id = t2.prenda_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_prenda, COUNT(t2.venta_id) AS total_relacionados
FROM prendas_ropa t1
LEFT JOIN ventas_prendas t2 ON t1.prenda_id = t2.prenda_id
GROUP BY t1.prenda_id, t1.nombre_prenda;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_prenda, AVG(t2.monto_total) AS promedio_score
FROM prendas_ropa t1
INNER JOIN ventas_prendas t2 ON t1.prenda_id = t2.prenda_id
GROUP BY t1.prenda_id, t1.nombre_prenda
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT cliente, unidades_vendidas, monto_total
FROM ventas_prendas
WHERE monto_total > (SELECT AVG(monto_total) FROM ventas_prendas);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_prendas_ropa AS
SELECT t1.nombre_prenda, t1.categoria, t2.cliente, t2.monto_total
FROM prendas_ropa t1
INNER JOIN ventas_prendas t2 ON t1.prenda_id = t2.prenda_id;

SELECT * FROM vista_reporte_prendas_ropa;
