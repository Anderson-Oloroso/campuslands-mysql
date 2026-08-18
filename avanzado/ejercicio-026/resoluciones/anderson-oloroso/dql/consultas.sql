USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE personajes_rpg SET oro = oro + 500.00 WHERE personaje_id = 1;
INSERT INTO inventario_rpg (personaje_id, nombre_objeto, rareza, valor_oro) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE personajes_rpg SET oro = 0.00 WHERE personaje_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT personaje_id, nombre_personaje, clase, oro,
       ROW_NUMBER() OVER (PARTITION BY clase ORDER BY oro DESC) AS ranking_categoria
FROM personajes_rpg;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT personaje_id, SUM(valor_oro) AS total_movimientos
    FROM inventario_rpg
    GROUP BY personaje_id
)
SELECT t1.nombre_personaje, t1.oro, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM personajes_rpg t1
LEFT JOIN cte_resumen c ON t1.personaje_id = c.personaje_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_personaje, t1.estado, t2.nombre_objeto, t2.valor_oro, t2.fecha_registro
FROM personajes_rpg t1
INNER JOIN inventario_rpg t2 ON t1.personaje_id = t2.personaje_id
ORDER BY t2.fecha_registro DESC;
