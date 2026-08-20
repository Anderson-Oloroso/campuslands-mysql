USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE personajes_scifi SET nivel_poder = nivel_poder + 500.00 WHERE personaje_id = 1;
INSERT INTO misiones_scifi (personaje_id, nombre_mision, dificultad, recompensa) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE personajes_scifi SET nivel_poder = 0.00 WHERE personaje_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT personaje_id, nombre_personaje, especie, nivel_poder,
       ROW_NUMBER() OVER (PARTITION BY especie ORDER BY nivel_poder DESC) AS ranking_categoria
FROM personajes_scifi;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT personaje_id, SUM(recompensa) AS total_movimientos
    FROM misiones_scifi
    GROUP BY personaje_id
)
SELECT t1.nombre_personaje, t1.nivel_poder, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM personajes_scifi t1
LEFT JOIN cte_resumen c ON t1.personaje_id = c.personaje_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_personaje, t1.estado, t2.nombre_mision, t2.recompensa, t2.fecha_registro
FROM personajes_scifi t1
INNER JOIN misiones_scifi t2 ON t1.personaje_id = t2.personaje_id
ORDER BY t2.fecha_registro DESC;
