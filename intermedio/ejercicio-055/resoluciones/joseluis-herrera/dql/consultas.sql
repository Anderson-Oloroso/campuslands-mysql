USE campuslands_mysql;

SELECT
    id_formula,
    codigo_formula,
    nombre_formula,
    compuesto_principal,
    categoria,
    estado
FROM formulas_quimicas
ORDER BY codigo_formula;

SELECT
    codigo_formula,
    nombre_formula,
    categoria,
    cantidad_muestras
FROM formulas_quimicas
WHERE estado = 'activa'
ORDER BY cantidad_muestras DESC;

SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;

SELECT
    codigo_formula,
    nombre_formula,
    compuesto_principal,
    cantidad_reactivo
FROM formulas_quimicas
WHERE cantidad_reactivo > 200
ORDER BY cantidad_reactivo DESC;

SELECT
    estado,
    COUNT(*) AS total_formulas,
    SUM(cantidad_reactivo) AS reactivo_total
FROM formulas_quimicas
GROUP BY estado
ORDER BY reactivo_total DESC;

SELECT
    codigo_formula,
    nombre_formula,
    categoria,
    fecha_registro
FROM formulas_quimicas
WHERE codigo_formula LIKE 'FQ-00%'
ORDER BY fecha_registro ASC;