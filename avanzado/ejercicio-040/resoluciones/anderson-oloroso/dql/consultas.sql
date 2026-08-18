USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE pilotos_carreras SET puntuacion = puntuacion + 500.00 WHERE piloto_id = 1;
INSERT INTO tiempos_carreras (piloto_id, circuito, posicion_salida, tiempo_segundos) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE pilotos_carreras SET puntuacion = 0.00 WHERE piloto_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT piloto_id, nombre_piloto, escuderia, puntuacion,
       ROW_NUMBER() OVER (PARTITION BY escuderia ORDER BY puntuacion DESC) AS ranking_categoria
FROM pilotos_carreras;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT piloto_id, SUM(tiempo_segundos) AS total_movimientos
    FROM tiempos_carreras
    GROUP BY piloto_id
)
SELECT t1.nombre_piloto, t1.puntuacion, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM pilotos_carreras t1
LEFT JOIN cte_resumen c ON t1.piloto_id = c.piloto_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_piloto, t1.estado, t2.circuito, t2.tiempo_segundos, t2.fecha_registro
FROM pilotos_carreras t1
INNER JOIN tiempos_carreras t2 ON t1.piloto_id = t2.piloto_id
ORDER BY t2.fecha_registro DESC;
