USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE saltos_paracaidismo SET costo_salto = costo_salto + 500.00 WHERE salto_id = 1;
INSERT INTO bitacora_saltos (salto_id, paracaidista, tiempo_caida_libre_seg, calificacion_aterrizaje) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE saltos_paracaidismo SET costo_salto = 0.00 WHERE salto_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT salto_id, instructor, modalidad, costo_salto,
       ROW_NUMBER() OVER (PARTITION BY modalidad ORDER BY costo_salto DESC) AS ranking_categoria
FROM saltos_paracaidismo;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT salto_id, SUM(calificacion_aterrizaje) AS total_movimientos
    FROM bitacora_saltos
    GROUP BY salto_id
)
SELECT t1.instructor, t1.costo_salto, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM saltos_paracaidismo t1
LEFT JOIN cte_resumen c ON t1.salto_id = c.salto_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.instructor, t1.estado, t2.paracaidista, t2.calificacion_aterrizaje, t2.fecha_registro
FROM saltos_paracaidismo t1
INNER JOIN bitacora_saltos t2 ON t1.salto_id = t2.salto_id
ORDER BY t2.fecha_registro DESC;
