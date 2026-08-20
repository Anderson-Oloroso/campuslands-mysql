USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE niveles_aventura SET puntos_recompensa = puntos_recompensa + 500.00 WHERE nivel_id = 1;
INSERT INTO logros_nivel (nivel_id, titulo_logro, puntos_gamerscore, desbloqueado) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE niveles_aventura SET puntos_recompensa = 0.00 WHERE nivel_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT nivel_id, nombre_nivel, mundo, puntos_recompensa,
       ROW_NUMBER() OVER (PARTITION BY mundo ORDER BY puntos_recompensa DESC) AS ranking_categoria
FROM niveles_aventura;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT nivel_id, SUM(desbloqueado) AS total_movimientos
    FROM logros_nivel
    GROUP BY nivel_id
)
SELECT t1.nombre_nivel, t1.puntos_recompensa, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM niveles_aventura t1
LEFT JOIN cte_resumen c ON t1.nivel_id = c.nivel_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_nivel, t1.estado, t2.titulo_logro, t2.desbloqueado, t2.fecha_registro
FROM niveles_aventura t1
INNER JOIN logros_nivel t2 ON t1.nivel_id = t2.nivel_id
ORDER BY t2.fecha_registro DESC;
