USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE planos_arquitectura SET presupuesto_usd = presupuesto_usd + 500.00 WHERE plano_id = 1;
INSERT INTO elementos_edificio (plano_id, nombre_elemento, material, costo_estimado) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE planos_arquitectura SET presupuesto_usd = 0.00 WHERE plano_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT plano_id, nombre_proyecto, tipo_estructura, presupuesto_usd,
       ROW_NUMBER() OVER (PARTITION BY tipo_estructura ORDER BY presupuesto_usd DESC) AS ranking_categoria
FROM planos_arquitectura;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT plano_id, SUM(costo_estimado) AS total_movimientos
    FROM elementos_edificio
    GROUP BY plano_id
)
SELECT t1.nombre_proyecto, t1.presupuesto_usd, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM planos_arquitectura t1
LEFT JOIN cte_resumen c ON t1.plano_id = c.plano_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_proyecto, t1.estado, t2.nombre_elemento, t2.costo_estimado, t2.fecha_registro
FROM planos_arquitectura t1
INNER JOIN elementos_edificio t2 ON t1.plano_id = t2.plano_id
ORDER BY t2.fecha_registro DESC;
