USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE modelos_3d SET software_creacion = software_creacion + 500.00 WHERE modelo_id = 1;
INSERT INTO renders_animacion (modelo_id, resolucion, tiempo_render_min, formato_salida) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE modelos_3d SET software_creacion = 0.00 WHERE modelo_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT modelo_id, nombre_modelo, tipo_geometria, software_creacion,
       ROW_NUMBER() OVER (PARTITION BY tipo_geometria ORDER BY software_creacion DESC) AS ranking_categoria
FROM modelos_3d;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT modelo_id, SUM(formato_salida) AS total_movimientos
    FROM renders_animacion
    GROUP BY modelo_id
)
SELECT t1.nombre_modelo, t1.software_creacion, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM modelos_3d t1
LEFT JOIN cte_resumen c ON t1.modelo_id = c.modelo_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_modelo, t1.estado, t2.resolucion, t2.formato_salida, t2.fecha_registro
FROM modelos_3d t1
INNER JOIN renders_animacion t2 ON t1.modelo_id = t2.modelo_id
ORDER BY t2.fecha_registro DESC;
