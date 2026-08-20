USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE paquetes_turisitcos SET precio_persona = precio_persona + 500.00 WHERE paquete_id = 1;
INSERT INTO reservas_viajes (paquete_id, nombre_cliente, personas, estado_reserva) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE paquetes_turisitcos SET precio_persona = 0.00 WHERE paquete_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT paquete_id, destino, tipo_paquete, precio_persona,
       ROW_NUMBER() OVER (PARTITION BY tipo_paquete ORDER BY precio_persona DESC) AS ranking_categoria
FROM paquetes_turisitcos;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT paquete_id, SUM(estado_reserva) AS total_movimientos
    FROM reservas_viajes
    GROUP BY paquete_id
)
SELECT t1.destino, t1.precio_persona, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM paquetes_turisitcos t1
LEFT JOIN cte_resumen c ON t1.paquete_id = c.paquete_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.destino, t1.estado, t2.nombre_cliente, t2.estado_reserva, t2.fecha_registro
FROM paquetes_turisitcos t1
INNER JOIN reservas_viajes t2 ON t1.paquete_id = t2.paquete_id
ORDER BY t2.fecha_registro DESC;
