USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE trabajos_soldadura SET costo_proyecto = costo_proyecto + 500.00 WHERE trabajo_id = 1;
INSERT INTO inspecciones_soldadura (trabajo_id, inspector, resultado_prueba, nivel_defecto) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE trabajos_soldadura SET costo_proyecto = 0.00 WHERE trabajo_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT trabajo_id, tipo_soldadura, material_base, costo_proyecto,
       ROW_NUMBER() OVER (PARTITION BY material_base ORDER BY costo_proyecto DESC) AS ranking_categoria
FROM trabajos_soldadura;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT trabajo_id, SUM(nivel_defecto) AS total_movimientos
    FROM inspecciones_soldadura
    GROUP BY trabajo_id
)
SELECT t1.tipo_soldadura, t1.costo_proyecto, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM trabajos_soldadura t1
LEFT JOIN cte_resumen c ON t1.trabajo_id = c.trabajo_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.tipo_soldadura, t1.estado, t2.inspector, t2.nivel_defecto, t2.fecha_registro
FROM trabajos_soldadura t1
INNER JOIN inspecciones_soldadura t2 ON t1.trabajo_id = t2.trabajo_id
ORDER BY t2.fecha_registro DESC;
