USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE peleadores_kickboxing SET victorias_ko = victorias_ko + 500.00 WHERE peleador_id = 1;
INSERT INTO combates_kickboxing (peleador_id, evento, resultado, round_final) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE peleadores_kickboxing SET victorias_ko = 0.00 WHERE peleador_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT peleador_id, nombre_peleador, categoria_peso, victorias_ko,
       ROW_NUMBER() OVER (PARTITION BY categoria_peso ORDER BY victorias_ko DESC) AS ranking_categoria
FROM peleadores_kickboxing;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT peleador_id, SUM(round_final) AS total_movimientos
    FROM combates_kickboxing
    GROUP BY peleador_id
)
SELECT t1.nombre_peleador, t1.victorias_ko, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM peleadores_kickboxing t1
LEFT JOIN cte_resumen c ON t1.peleador_id = c.peleador_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_peleador, t1.estado, t2.evento, t2.round_final, t2.fecha_registro
FROM peleadores_kickboxing t1
INNER JOIN combates_kickboxing t2 ON t1.peleador_id = t2.peleador_id
ORDER BY t2.fecha_registro DESC;
