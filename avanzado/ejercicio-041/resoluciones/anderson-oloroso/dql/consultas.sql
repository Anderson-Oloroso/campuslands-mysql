USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE jugadores_pingpong SET puntos_ranking = puntos_ranking + 500.00 WHERE jugador_id = 1;
INSERT INTO partidos_pingpong (jugador_id, torneo, sets_ganados, duracion_min) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE jugadores_pingpong SET puntos_ranking = 0.00 WHERE jugador_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT jugador_id, nombre_jugador, club, puntos_ranking,
       ROW_NUMBER() OVER (PARTITION BY club ORDER BY puntos_ranking DESC) AS ranking_categoria
FROM jugadores_pingpong;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT jugador_id, SUM(duracion_min) AS total_movimientos
    FROM partidos_pingpong
    GROUP BY jugador_id
)
SELECT t1.nombre_jugador, t1.puntos_ranking, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM jugadores_pingpong t1
LEFT JOIN cte_resumen c ON t1.jugador_id = c.jugador_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_jugador, t1.estado, t2.torneo, t2.duracion_min, t2.fecha_registro
FROM jugadores_pingpong t1
INNER JOIN partidos_pingpong t2 ON t1.jugador_id = t2.jugador_id
ORDER BY t2.fecha_registro DESC;
