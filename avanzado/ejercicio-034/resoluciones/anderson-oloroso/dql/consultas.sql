USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE garaje_motos SET precio = precio + 500.00 WHERE moto_id = 1;
INSERT INTO mantenimientos_motos (moto_id, tipo_servicio, costo, tecnico) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE garaje_motos SET precio = 0.00 WHERE moto_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT moto_id, marca, modelo, precio,
       ROW_NUMBER() OVER (PARTITION BY modelo ORDER BY precio DESC) AS ranking_categoria
FROM garaje_motos;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT moto_id, SUM(tecnico) AS total_movimientos
    FROM mantenimientos_motos
    GROUP BY moto_id
)
SELECT t1.marca, t1.precio, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM garaje_motos t1
LEFT JOIN cte_resumen c ON t1.moto_id = c.moto_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.marca, t1.estado, t2.tipo_servicio, t2.tecnico, t2.fecha_registro
FROM garaje_motos t1
INNER JOIN mantenimientos_motos t2 ON t1.moto_id = t2.moto_id
ORDER BY t2.fecha_registro DESC;
