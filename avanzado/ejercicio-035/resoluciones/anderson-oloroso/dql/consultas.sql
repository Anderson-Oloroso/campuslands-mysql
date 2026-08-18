USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE servicios_taller SET costo_base = costo_base + 500.00 WHERE servicio_id = 1;
INSERT INTO ordenes_taller (servicio_id, cliente, estado_orden, monto_total) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE servicios_taller SET costo_base = 0.00 WHERE servicio_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT servicio_id, nombre_servicio, categoria, costo_base,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY costo_base DESC) AS ranking_categoria
FROM servicios_taller;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT servicio_id, SUM(monto_total) AS total_movimientos
    FROM ordenes_taller
    GROUP BY servicio_id
)
SELECT t1.nombre_servicio, t1.costo_base, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM servicios_taller t1
LEFT JOIN cte_resumen c ON t1.servicio_id = c.servicio_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_servicio, t1.estado, t2.cliente, t2.monto_total, t2.fecha_registro
FROM servicios_taller t1
INNER JOIN ordenes_taller t2 ON t1.servicio_id = t2.servicio_id
ORDER BY t2.fecha_registro DESC;
