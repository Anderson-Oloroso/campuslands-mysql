USE campuslands_mysql;

SELECT
    COUNT(*) AS total_formulas
FROM formulas_quimicas;

SELECT
    id,
    codigo_formula AS codigo,
    nombre_formula AS formula,
    compuesto,
    categoria,
    cantidad_muestras AS muestras,
    costo_muestra AS costo,
    estado
FROM formulas_quimicas
ORDER BY id;

SELECT
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas;

SELECT
    SUM(cantidad_muestras * costo_muestra) AS valor_total_muestras
FROM formulas_quimicas;

SELECT
    estado,
    COUNT(*) AS total_formulas
FROM formulas_quimicas
GROUP BY estado
ORDER BY total_formulas DESC;


SELECT
    categoria,
    COUNT(*) AS total_formulas,
    SUM(cantidad_muestras) AS total_muestras
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_muestras DESC;

SELECT
    codigo_formula AS codigo,
    nombre_formula AS formula
FROM formulas_quimicas
ORDER BY codigo_formula;