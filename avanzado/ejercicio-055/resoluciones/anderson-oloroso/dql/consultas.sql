USE campuslands_mysql;

-- 1. Transaccion controlada con COMMIT
START TRANSACTION;
UPDATE formulas_quimicas SET temperatura_optima = temperatura_optima + 500.00 WHERE formula_id = 1;
INSERT INTO reactivos_quimicos (formula_id, nombre_reactivo, concentracion_porcentaje, volumen_ml) VALUES (1, 'Transaccion Commit', 'Actualizacion', 500.00);
COMMIT;

-- 2. Transaccion de prueba con ROLLBACK
START TRANSACTION;
UPDATE formulas_quimicas SET temperatura_optima = 0.00 WHERE formula_id = 2;
ROLLBACK;

-- 3. Consulta utilizando Window Function ROW_NUMBER()
SELECT formula_id, nombre_formula, categoria, temperatura_optima,
       ROW_NUMBER() OVER (PARTITION BY categoria ORDER BY temperatura_optima DESC) AS ranking_categoria
FROM formulas_quimicas;

-- 4. Consulta utilizando Common Table Expression (CTE)
WITH cte_resumen AS (
    SELECT formula_id, SUM(volumen_ml) AS total_movimientos
    FROM reactivos_quimicos
    GROUP BY formula_id
)
SELECT t1.nombre_formula, t1.temperatura_optima, COALESCE(c.total_movimientos, 0) AS total_movimientos
FROM formulas_quimicas t1
LEFT JOIN cte_resumen c ON t1.formula_id = c.formula_id;

-- 5. Consulta final con INNER JOIN
SELECT t1.nombre_formula, t1.estado, t2.nombre_reactivo, t2.volumen_ml, t2.fecha_registro
FROM formulas_quimicas t1
INNER JOIN reactivos_quimicos t2 ON t1.formula_id = t2.formula_id
ORDER BY t2.fecha_registro DESC;
