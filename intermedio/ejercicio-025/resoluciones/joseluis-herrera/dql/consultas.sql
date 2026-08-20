USE campuslands_mysql;

SELECT
    id,
    codigo_formula,
    nombre_formula,
    compuesto,
    categoria,
    cantidad_muestras,
    costo_muestra,
    estado
FROM formulas_quimicas
ORDER BY id;

SELECT
    codigo_formula AS codigo,
    nombre_formula AS formula,
    compuesto,
    categoria,
    estado
FROM formulas_quimicas
WHERE codigo_formula = 'FQ-005';


SELECT
    codigo_formula AS codigo,
    nombre_formula AS formula,
    compuesto,
    categoria
FROM formulas_quimicas
WHERE compuesto = 'NaCl';


SELECT
    codigo_formula,
    COUNT(*) AS cantidad
FROM formulas_quimicas
GROUP BY codigo_formula
HAVING COUNT(*) > 1;

SELECT
    compuesto,
    COUNT(*) AS cantidad
FROM formulas_quimicas
GROUP BY compuesto
HAVING COUNT(*) > 1;

SELECT
    codigo_formula AS codigo,
    nombre_formula AS formula,
    categoria,
    cantidad_muestras AS muestras,
    estado
FROM formulas_quimicas
WHERE estado = 'activa'
ORDER BY cantidad_muestras DESC;

SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;