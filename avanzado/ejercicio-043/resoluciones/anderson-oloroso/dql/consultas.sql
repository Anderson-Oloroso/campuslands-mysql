USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE peliculas_miedo SET recaudacion = recaudacion + 500.00 WHERE pelicula_id = 1;
INSERT INTO reseñas_peliculas (pelicula_id, usuario, calificacion, comentario) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE peliculas_miedo SET recaudacion = 0.00 WHERE pelicula_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT pelicula_id, titulo, director, recaudacion,
       ROW_NUMBER() OVER (PARTITION BY director ORDER BY recaudacion DESC) AS ranking_categoria
FROM peliculas_miedo;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT pelicula_id, SUM(comentario) AS total_movimientos
    FROM reseñas_peliculas
    GROUP BY pelicula_id
)
SELECT t1.titulo, t1.recaudacion, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM peliculas_miedo t1
LEFT JOIN cte_resumen c ON t1.pelicula_id = c.pelicula_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.titulo, t1.estado, t2.usuario, t2.comentario, t2.fecha_registro
FROM peliculas_miedo t1
INNER JOIN reseñas_peliculas t2 ON t1.pelicula_id = t2.pelicula_id
ORDER BY t2.fecha_registro DESC;
