USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE platillos_urbanos SET precio = precio + 500.00 WHERE platillo_id = 1;
INSERT INTO pedidos_platillos (platillo_id, numero_mesa, cantidad, subtotal) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE platillos_urbanos SET precio = 0.00 WHERE platillo_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT platillo_id, nombre_platillo, categoria, precio,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY precio DESC) AS ranking_categoria
FROM platillos_urbanos;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT platillo_id, SUM(subtotal) AS total_movimientos
    FROM pedidos_platillos
    GROUP BY platillo_id
)
SELECT t1.nombre_platillo, t1.precio, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM platillos_urbanos t1
LEFT JOIN cte_resumen c ON t1.platillo_id = c.platillo_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_platillo, t1.estado, t2.numero_mesa, t2.subtotal, t2.fecha_registro
FROM platillos_urbanos t1
INNER JOIN pedidos_platillos t2 ON t1.platillo_id = t2.platillo_id
ORDER BY t2.fecha_registro DESC;
