USE campuslands_mysql;

-- 1. Listado de formulas con su codigo unico
SELECT id_formula, codigo_formula, nombre_compuesto, categoria, estado_fisico
FROM formulas_quimicas_intermedio
ORDER BY codigo_formula;

-- 2. Evidencia de que 'L-001' se repite entre formulas distintas (permitido)
SELECT f.codigo_formula, l.numero_lote, l.cantidad_producida
FROM lotes_formula_intermedio l
INNER JOIN formulas_quimicas_intermedio f ON f.id_formula = l.id_formula
WHERE l.numero_lote = 'L-001'
ORDER BY f.codigo_formula;

-- 3. Cantidad total producida por formula
SELECT f.codigo_formula, f.nombre_compuesto, SUM(l.cantidad_producida) AS total_producido
FROM lotes_formula_intermedio l
INNER JOIN formulas_quimicas_intermedio f ON f.id_formula = l.id_formula
GROUP BY f.codigo_formula, f.nombre_compuesto
ORDER BY total_producido DESC;

-- 4. Formulas por categoria
SELECT categoria, COUNT(*) AS total_formulas
FROM formulas_quimicas_intermedio
GROUP BY categoria
ORDER BY total_formulas DESC;

-- 5. Lotes producidos por cada formula, ordenados por fecha
SELECT f.codigo_formula, l.numero_lote, l.fecha_produccion
FROM lotes_formula_intermedio l
INNER JOIN formulas_quimicas_intermedio f ON f.id_formula = l.id_formula
ORDER BY f.codigo_formula, l.fecha_produccion;

-- 6. Formula con mayor produccion acumulada
SELECT f.codigo_formula, f.nombre_compuesto, SUM(l.cantidad_producida) AS total_producido
FROM lotes_formula_intermedio l
INNER JOIN formulas_quimicas_intermedio f ON f.id_formula = l.id_formula
GROUP BY f.codigo_formula, f.nombre_compuesto
ORDER BY total_producido DESC
LIMIT 1;

-- Notas de validacion manual (verificadas al preparar esta resolucion):
--   INSERT INTO formulas_quimicas_intermedio (codigo_formula, nombre_compuesto, categoria, estado_fisico)
--   VALUES ('H2SO4', 'Otro nombre', 'acido', 'liquido');
--   -> ERROR 1062 (23000): Duplicate entry 'H2SO4' for key
--      'formulas_quimicas_intermedio.codigo_formula'
--
--   INSERT INTO lotes_formula_intermedio (id_formula, numero_lote, cantidad_producida, fecha_produccion)
--   VALUES (1, 'L-001', 10.00, '2026-03-01');
--   -> ERROR 1062 (23000): Duplicate entry '1-L-001' for key
--      'lotes_formula_intermedio.uq_lotes_formula_intermedio_lote'
-- (no se ejecutan aqui para no interrumpir el script).
