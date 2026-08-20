USE campuslands_mysql;


-- 1. Mostrar todas las fórmulas registradas.
SELECT
    id_formula,
    codigo_formula,
    nombre_formula,
    compuesto,
    categoria,
    masa_molar,
    estado
FROM formulas_quimicas
ORDER BY id_formula ASC;


-- 2. Mostrar las fórmulas actualmente activas.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    categoria,
    masa_molar
FROM formulas_quimicas
WHERE estado = 'activa'
ORDER BY nombre_formula ASC;


-- 3. Mostrar fórmulas cuya masa molar sea superior a 50.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    masa_molar
FROM formulas_quimicas
WHERE masa_molar > 50
ORDER BY masa_molar DESC;


-- 4. Mostrar las fórmulas pertenecientes a la categoría Sales.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    masa_molar,
    estado
FROM formulas_quimicas
WHERE categoria = 'Sales'
ORDER BY masa_molar DESC;


-- 5. Mostrar las fórmulas que se encuentran en revisión.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    fecha_registro
FROM formulas_quimicas
WHERE estado = 'en_revision'
ORDER BY fecha_registro ASC;


-- 6. Mostrar las 5 fórmulas con mayor masa molar.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    masa_molar
FROM formulas_quimicas
ORDER BY masa_molar DESC
LIMIT 5;


-- 7. Mostrar un cálculo del doble de la masa molar
-- para cada fórmula.
SELECT
    codigo_formula,
    nombre_formula,
    compuesto,
    masa_molar,
    ROUND(masa_molar * 2, 3) AS doble_masa_molar
FROM formulas_quimicas
ORDER BY masa_molar DESC;