USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE ilustraciones_digitales SET horas_trabajo = horas_trabajo + 500.00 WHERE ilustracion_id = 1;
INSERT INTO capas_ilustracion (ilustracion_id, nombre_capa, opacidad_porcentaje, modo_fusion) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE ilustraciones_digitales SET horas_trabajo = 0.00 WHERE ilustracion_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT ilustracion_id, titulo_obra, estilo_arte, horas_trabajo,
       ROW_NUMBER() OVER (PARTITION BY estilo_arte ORDER BY horas_trabajo DESC) AS ranking_categoria
FROM ilustraciones_digitales;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT ilustracion_id, SUM(modo_fusion) AS total_movimientos
    FROM capas_ilustracion
    GROUP BY ilustracion_id
)
SELECT t1.titulo_obra, t1.horas_trabajo, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM ilustraciones_digitales t1
LEFT JOIN cte_resumen c ON t1.ilustracion_id = c.ilustracion_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.titulo_obra, t1.estado, t2.nombre_capa, t2.modo_fusion, t2.fecha_registro
FROM ilustraciones_digitales t1
INNER JOIN capas_ilustracion t2 ON t1.ilustracion_id = t2.ilustracion_id
ORDER BY t2.fecha_registro DESC;
