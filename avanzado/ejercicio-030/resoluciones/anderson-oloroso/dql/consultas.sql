USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE streamers_equipo SET ingresos_mes = ingresos_mes + 500.00 WHERE streamer_id = 1;
INSERT INTO transmisiones_stream (streamer_id, titulo_stream, espectadores_pico, horas_duracion) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE streamers_equipo SET ingresos_mes = 0.00 WHERE streamer_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT streamer_id, nickname_streamer, plataforma, ingresos_mes,
       ROW_NUMBER() OVER (PARTITION BY plataforma ORDER BY ingresos_mes DESC) AS ranking_categoria
FROM streamers_equipo;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT streamer_id, SUM(horas_duracion) AS total_movimientos
    FROM transmisiones_stream
    GROUP BY streamer_id
)
SELECT t1.nickname_streamer, t1.ingresos_mes, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM streamers_equipo t1
LEFT JOIN cte_resumen c ON t1.streamer_id = c.streamer_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nickname_streamer, t1.estado, t2.titulo_stream, t2.horas_duracion, t2.fecha_registro
FROM streamers_equipo t1
INNER JOIN transmisiones_stream t2 ON t1.streamer_id = t2.streamer_id
ORDER BY t2.fecha_registro DESC;
