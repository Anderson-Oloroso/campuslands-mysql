USE campuslands_mysql;

SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;

SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;

SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;

SELECT
    nombre_formula AS formula,
    formula_molecular AS formula_molecular,
    cantidad_muestras AS muestras,
    costo_estimado AS costo
FROM formulas_quimicas
WHERE estado = 'activa'
ORDER BY costo_estimado DESC
LIMIT 5;

SELECT
    nombre_formula AS formula,
    categoria,
    cantidad_muestras AS muestras,
    costo_estimado AS costo
FROM formulas_quimicas
WHERE cantidad_muestras >= 20
ORDER BY cantidad_muestras DESC;

SELECT
    estado,
    COUNT(*) AS total_formulas,
    SUM(costo_estimado) AS costo_total
FROM formulas_quimicas
GROUP BY estado
ORDER BY costo_total DESC;