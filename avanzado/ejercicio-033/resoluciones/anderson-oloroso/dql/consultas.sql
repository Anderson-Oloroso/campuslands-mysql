USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE armas_shooter SET cadencia = cadencia + 500.00 WHERE arma_id = 1;
INSERT INTO skins_shooter (arma_id, nombre_skin, rareza, precio_puntos) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE armas_shooter SET cadencia = 0.00 WHERE arma_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT arma_id, nombre_arma, tipo_arma, cadencia,
       ROW_NUMBER() OVER (PARTITION BY tipo_arma ORDER BY cadencia DESC) AS ranking_categoria
FROM armas_shooter;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT arma_id, SUM(precio_puntos) AS total_movimientos
    FROM skins_shooter
    GROUP BY arma_id
)
SELECT t1.nombre_arma, t1.cadencia, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM armas_shooter t1
LEFT JOIN cte_resumen c ON t1.arma_id = c.arma_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_arma, t1.estado, t2.nombre_skin, t2.precio_puntos, t2.fecha_registro
FROM armas_shooter t1
INNER JOIN skins_shooter t2 ON t1.arma_id = t2.arma_id
ORDER BY t2.fecha_registro DESC;
