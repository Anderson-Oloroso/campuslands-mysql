USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE tatuajes_estudio SET precio = precio + 500.00 WHERE tatuaje_id = 1;
INSERT INTO citas_tatuajes (tatuaje_id, nombre_cliente, tatuador, horas_duracion) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE tatuajes_estudio SET precio = 0.00 WHERE tatuaje_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT tatuaje_id, nombre_diseno, estilo, precio,
       ROW_NUMBER() OVER (PARTITION BY estilo ORDER BY precio DESC) AS ranking_categoria
FROM tatuajes_estudio;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT tatuaje_id, SUM(horas_duracion) AS total_movimientos
    FROM citas_tatuajes
    GROUP BY tatuaje_id
)
SELECT t1.nombre_diseno, t1.precio, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM tatuajes_estudio t1
LEFT JOIN cte_resumen c ON t1.tatuaje_id = c.tatuaje_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_diseno, t1.estado, t2.nombre_cliente, t2.horas_duracion, t2.fecha_registro
FROM tatuajes_estudio t1
INNER JOIN citas_tatuajes t2 ON t1.tatuaje_id = t2.tatuaje_id
ORDER BY t2.fecha_registro DESC;
