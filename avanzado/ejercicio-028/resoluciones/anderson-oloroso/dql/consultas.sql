USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE cursos_tech SET precio_curso = precio_curso + 500.00 WHERE curso_id = 1;
INSERT INTO estudiantes_tech (curso_id, nombre_estudiante, email, promedio_nota) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE cursos_tech SET precio_curso = 0.00 WHERE curso_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT curso_id, nombre_curso, area, precio_curso,
       ROW_NUMBER() OVER (PARTITION BY area ORDER BY precio_curso DESC) AS ranking_categoria
FROM cursos_tech;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT curso_id, SUM(promedio_nota) AS total_movimientos
    FROM estudiantes_tech
    GROUP BY curso_id
)
SELECT t1.nombre_curso, t1.precio_curso, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM cursos_tech t1
LEFT JOIN cte_resumen c ON t1.curso_id = c.curso_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_curso, t1.estado, t2.nombre_estudiante, t2.promedio_nota, t2.fecha_registro
FROM cursos_tech t1
INNER JOIN estudiantes_tech t2 ON t1.curso_id = t2.curso_id
ORDER BY t2.fecha_registro DESC;
