USE campuslands_mysql;

-- 1. Consultar todas las formulas registradas.
SELECT
    formula_id,
    nombre,
    formula,
    categoria,
    cantidad_muestras,
    estado
FROM formulas_quimicas
ORDER BY formula_id;


-- 2. Consultar las formulas activas.
SELECT
    formula_id,
    nombre,
    formula,
    categoria,
    cantidad_muestras
FROM formulas_quimicas
WHERE estado = 'activa'
ORDER BY nombre ASC;


-- 3. Consultar las formulas de una categoria especifica.
SELECT
    formula_id,
    nombre,
    formula,
    categoria
FROM formulas_quimicas
WHERE categoria = 'Acido'
ORDER BY nombre ASC;


-- 4. Contar las formulas registradas por categoria.
SELECT
    categoria,
    COUNT(*) AS total_formulas
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;


-- 5. Mostrar las formulas que tienen mas de 8 muestras.
SELECT
    formula_id,
    nombre,
    formula,
    cantidad_muestras
FROM formulas_quimicas
WHERE cantidad_muestras > 8
ORDER BY cantidad_muestras DESC;


-- 6. Verificar que no existan formulas duplicadas.
SELECT
    formula,
    COUNT(*) AS cantidad_registros
FROM formulas_quimicas
GROUP BY formula
HAVING COUNT(*) > 1;