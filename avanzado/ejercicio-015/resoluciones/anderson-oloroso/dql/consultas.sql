USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE videojuegos_biblioteca SET precio_alquiler = precio_alquiler + 500.00 WHERE juego_id = 1;
INSERT INTO prestamos_videojuegos (juego_id, usuario, dias_prestamo, estado_prestamo) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE videojuegos_biblioteca SET precio_alquiler = 0.00 WHERE juego_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT juego_id, titulo_juego, plataforma, precio_alquiler,
       ROW_NUMBER() OVER (PARTITION BY plataforma ORDER BY precio_alquiler DESC) AS ranking_categoria
FROM videojuegos_biblioteca;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT juego_id, SUM(estado_prestamo) AS total_movimientos
    FROM prestamos_videojuegos
    GROUP BY juego_id
)
SELECT t1.titulo_juego, t1.precio_alquiler, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM videojuegos_biblioteca t1
LEFT JOIN cte_resumen c ON t1.juego_id = c.juego_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.titulo_juego, t1.estado, t2.usuario, t2.estado_prestamo, t2.fecha_registro
FROM videojuegos_biblioteca t1
INNER JOIN prestamos_videojuegos t2 ON t1.juego_id = t2.juego_id
ORDER BY t2.fecha_registro DESC;
