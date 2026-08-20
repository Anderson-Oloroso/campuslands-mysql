USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.paquete_id, t1.destino, t1.tipo_paquete, t2.nombre_cliente, t2.personas, t2.estado_reserva
FROM paquetes_turisitcos t1
INNER JOIN reservas_viajes t2 ON t1.paquete_id = t2.paquete_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.destino, COUNT(t2.reserva_id) AS total_relacionados
FROM paquetes_turisitcos t1
LEFT JOIN reservas_viajes t2 ON t1.paquete_id = t2.paquete_id
GROUP BY t1.paquete_id, t1.destino;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.destino, AVG(t2.estado_reserva) AS promedio_score
FROM paquetes_turisitcos t1
INNER JOIN reservas_viajes t2 ON t1.paquete_id = t2.paquete_id
GROUP BY t1.paquete_id, t1.destino
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_cliente, personas, estado_reserva
FROM reservas_viajes
WHERE estado_reserva > (SELECT AVG(estado_reserva) FROM reservas_viajes);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_paquetes_turisitcos AS
SELECT t1.destino, t1.tipo_paquete, t2.nombre_cliente, t2.estado_reserva
FROM paquetes_turisitcos t1
INNER JOIN reservas_viajes t2 ON t1.paquete_id = t2.paquete_id;

SELECT * FROM vista_reporte_paquetes_turisitcos;
