USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.platillo_id, t1.nombre_platillo, t1.categoria, t2.numero_mesa, t2.cantidad, t2.subtotal
FROM platillos_urbanos t1
INNER JOIN pedidos_platillos t2 ON t1.platillo_id = t2.platillo_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_platillo, COUNT(t2.pedido_id) AS total_relacionados
FROM platillos_urbanos t1
LEFT JOIN pedidos_platillos t2 ON t1.platillo_id = t2.platillo_id
GROUP BY t1.platillo_id, t1.nombre_platillo;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_platillo, AVG(t2.subtotal) AS promedio_score
FROM platillos_urbanos t1
INNER JOIN pedidos_platillos t2 ON t1.platillo_id = t2.platillo_id
GROUP BY t1.platillo_id, t1.nombre_platillo
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT numero_mesa, cantidad, subtotal
FROM pedidos_platillos
WHERE subtotal > (SELECT AVG(subtotal) FROM pedidos_platillos);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_platillos_urbanos AS
SELECT t1.nombre_platillo, t1.categoria, t2.numero_mesa, t2.subtotal
FROM platillos_urbanos t1
INNER JOIN pedidos_platillos t2 ON t1.platillo_id = t2.platillo_id;

SELECT * FROM vista_reporte_platillos_urbanos;
