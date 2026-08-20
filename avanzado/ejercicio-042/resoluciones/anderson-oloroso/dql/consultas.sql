USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE canciones_playlist SET reproducciones = reproducciones + 500.00 WHERE cancion_id = 1;
INSERT INTO detalles_playlist (cancion_id, nombre_playlist, orden_cancion, fecha_agregado) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE canciones_playlist SET reproducciones = 0.00 WHERE cancion_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT cancion_id, titulo_cancion, artista, reproducciones,
       ROW_NUMBER() OVER (PARTITION BY artista ORDER BY reproducciones DESC) AS ranking_categoria
FROM canciones_playlist;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT cancion_id, SUM(fecha_agregado) AS total_movimientos
    FROM detalles_playlist
    GROUP BY cancion_id
)
SELECT t1.titulo_cancion, t1.reproducciones, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM canciones_playlist t1
LEFT JOIN cte_resumen c ON t1.cancion_id = c.cancion_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.titulo_cancion, t1.estado, t2.nombre_playlist, t2.fecha_agregado, t2.fecha_registro
FROM canciones_playlist t1
INNER JOIN detalles_playlist t2 ON t1.cancion_id = t2.cancion_id
ORDER BY t2.fecha_registro DESC;
