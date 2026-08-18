USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE prendas_ropa SET precio = precio + 500.00 WHERE prenda_id = 1;
INSERT INTO ventas_prendas (prenda_id, cliente, unidades_vendidas, monto_total) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE prendas_ropa SET precio = 0.00 WHERE prenda_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT prenda_id, nombre_prenda, categoria, precio,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY precio DESC) AS ranking_categoria
FROM prendas_ropa;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT prenda_id, SUM(monto_total) AS total_movimientos
    FROM ventas_prendas
    GROUP BY prenda_id
)
SELECT t1.nombre_prenda, t1.precio, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM prendas_ropa t1
LEFT JOIN cte_resumen c ON t1.prenda_id = c.prenda_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_prenda, t1.estado, t2.cliente, t2.monto_total, t2.fecha_registro
FROM prendas_ropa t1
INNER JOIN ventas_prendas t2 ON t1.prenda_id = t2.prenda_id
ORDER BY t2.fecha_registro DESC;
