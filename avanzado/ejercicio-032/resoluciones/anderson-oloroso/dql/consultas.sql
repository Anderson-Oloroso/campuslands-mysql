USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE jugadores_br SET victorias = victorias + 500.00 WHERE jugador_id = 1;
INSERT INTO partidas_br (jugador_id, mapa, posicion_final, bajas_partida) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE jugadores_br SET victorias = 0.00 WHERE jugador_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT jugador_id, nickname, rango, victorias,
       ROW_NUMBER() OVER (PARTITION BY rango ORDER BY victorias DESC) AS ranking_categoria
FROM jugadores_br;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT jugador_id, SUM(bajas_partida) AS total_movimientos
    FROM partidas_br
    GROUP BY jugador_id
)
SELECT t1.nickname, t1.victorias, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM jugadores_br t1
LEFT JOIN cte_resumen c ON t1.jugador_id = c.jugador_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nickname, t1.estado, t2.mapa, t2.bajas_partida, t2.fecha_registro
FROM jugadores_br t1
INNER JOIN partidas_br t2 ON t1.jugador_id = t2.jugador_id
ORDER BY t2.fecha_registro DESC;
