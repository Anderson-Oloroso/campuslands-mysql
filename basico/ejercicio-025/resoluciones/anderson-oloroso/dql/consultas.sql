USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por temperatura_optima descendentemente
SELECT formula_id, nombre_formula, categoria, nivel_riesgo, temperatura_optima, estado
FROM formulas_quimicas
ORDER BY temperatura_optima DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT formula_id, nombre_formula, categoria, temperatura_optima
FROM formulas_quimicas
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de temperatura_optima
SELECT categoria, COUNT(*) AS total_registros, AVG(temperatura_optima) AS promedio_valor
FROM formulas_quimicas
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por temperatura_optima mayor a 2000
SELECT formula_id, nombre_formula, categoria, temperatura_optima
FROM formulas_quimicas
WHERE temperatura_optima > 2000.00
ORDER BY temperatura_optima ASC;

-- 5. Seleccionar los 5 mejores registros según temperatura_optima
SELECT formula_id, nombre_formula, categoria, temperatura_optima
FROM formulas_quimicas
ORDER BY temperatura_optima DESC
LIMIT 5;
