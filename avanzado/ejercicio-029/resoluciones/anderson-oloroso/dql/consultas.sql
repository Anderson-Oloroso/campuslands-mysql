USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE accesorios_market SET precio_unitario = precio_unitario + 500.00 WHERE accesorio_id = 1;
INSERT INTO ventas_accesorios (accesorio_id, comprador, cantidad, calificacion_servicio) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE accesorios_market SET precio_unitario = 0.00 WHERE accesorio_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT accesorio_id, nombre_producto, categoria, precio_unitario,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY precio_unitario DESC) AS ranking_categoria
FROM accesorios_market;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT accesorio_id, SUM(calificacion_servicio) AS total_movimientos
    FROM ventas_accesorios
    GROUP BY accesorio_id
)
SELECT t1.nombre_producto, t1.precio_unitario, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM accesorios_market t1
LEFT JOIN cte_resumen c ON t1.accesorio_id = c.accesorio_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_producto, t1.estado, t2.comprador, t2.calificacion_servicio, t2.fecha_registro
FROM accesorios_market t1
INNER JOIN ventas_accesorios t2 ON t1.accesorio_id = t2.accesorio_id
ORDER BY t2.fecha_registro DESC;
