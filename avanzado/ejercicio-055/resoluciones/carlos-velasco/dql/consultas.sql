USE campuslands_mysql;

-- 1. Consultar todas las formulas registradas.
SELECT
    id_formula,
    nombre,
    formula_quimica,
    categoria,
    masa_molar,
    estado,
    fecha_registro
FROM formulas_quimicas
ORDER BY id_formula;

-- 2. Consultar las formulas actualmente activas.
SELECT
    nombre,
    formula_quimica,
    categoria,
    masa_molar
FROM formulas_quimicas
WHERE estado = 'activo'
ORDER BY nombre ASC;

-- 3. Obtener las formulas con masa molar superior a 50.
SELECT
    nombre,
    formula_quimica,
    masa_molar
FROM formulas_quimicas
WHERE masa_molar > 50
ORDER BY masa_molar DESC;

-- 4. Obtener cantidad y masa molar promedio por categoria.
SELECT
    categoria,
    COUNT(*) AS total_formulas,
    ROUND(AVG(masa_molar), 3) AS masa_molar_promedio
FROM formulas_quimicas
GROUP BY categoria
ORDER BY total_formulas DESC;

-- 5. Obtener las cinco formulas con mayor masa molar.
SELECT
    nombre,
    formula_quimica,
    categoria,
    masa_molar
FROM formulas_quimicas
ORDER BY masa_molar DESC
LIMIT 5;

-- 6. Verificar cantidad total de registros antes de realizar el backup.
SELECT
    COUNT(*) AS total_registros
FROM formulas_quimicas;

-- 7. Identificar formulas activas e inactivas para validar el estado de los datos.
SELECT
    estado,
    COUNT(*) AS total_formulas
FROM formulas_quimicas
GROUP BY estado
ORDER BY estado;