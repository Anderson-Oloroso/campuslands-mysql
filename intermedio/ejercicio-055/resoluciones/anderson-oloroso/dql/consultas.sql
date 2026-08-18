USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.formula_id, t1.nombre_formula, t1.categoria, t2.nombre_reactivo, t2.concentracion_porcentaje, t2.volumen_ml
FROM formulas_quimicas t1
INNER JOIN reactivos_quimicos t2 ON t1.formula_id = t2.formula_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.nombre_formula, COUNT(t2.reactivo_id) AS total_relacionados
FROM formulas_quimicas t1
LEFT JOIN reactivos_quimicos t2 ON t1.formula_id = t2.formula_id
GROUP BY t1.formula_id, t1.nombre_formula;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.nombre_formula, AVG(t2.volumen_ml) AS promedio_score
FROM formulas_quimicas t1
INNER JOIN reactivos_quimicos t2 ON t1.formula_id = t2.formula_id
GROUP BY t1.formula_id, t1.nombre_formula
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT nombre_reactivo, concentracion_porcentaje, volumen_ml
FROM reactivos_quimicos
WHERE volumen_ml > (SELECT AVG(volumen_ml) FROM reactivos_quimicos);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_formulas_quimicas AS
SELECT t1.nombre_formula, t1.categoria, t2.nombre_reactivo, t2.volumen_ml
FROM formulas_quimicas t1
INNER JOIN reactivos_quimicos t2 ON t1.formula_id = t2.formula_id;

SELECT * FROM vista_reporte_formulas_quimicas;
