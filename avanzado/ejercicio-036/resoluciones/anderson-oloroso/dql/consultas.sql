USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE autos_hiperdeportivos SET precio_usd = precio_usd + 500.00 WHERE auto_id = 1;
INSERT INTO pruebas_velocidad (auto_id, pista, velocidad_max, tiempo_lap) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE autos_hiperdeportivos SET precio_usd = 0.00 WHERE auto_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT auto_id, marca, modelo, precio_usd,
       ROW_NUMBER() OVER (PARTITION BY modelo ORDER BY precio_usd DESC) AS ranking_categoria
FROM autos_hiperdeportivos;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT auto_id, SUM(tiempo_lap) AS total_movimientos
    FROM pruebas_velocidad
    GROUP BY auto_id
)
SELECT t1.marca, t1.precio_usd, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM autos_hiperdeportivos t1
LEFT JOIN cte_resumen c ON t1.auto_id = c.auto_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.marca, t1.estado, t2.pista, t2.tiempo_lap, t2.fecha_registro
FROM autos_hiperdeportivos t1
INNER JOIN pruebas_velocidad t2 ON t1.auto_id = t2.auto_id
ORDER BY t2.fecha_registro DESC;
