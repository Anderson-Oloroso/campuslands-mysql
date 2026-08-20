USE campuslands_mysql;

-- 1. Reporte General de Fórmulas y Reactivos Integrados
SELECT 
    f.codigo_formula,
    f.nombre_formula,
    CONCAT(q.nombre, ' ', q.apellido) AS quimico_responsable,
    q.codigo_colegiado,
    f.ph_objetivo,
    f.estado,
    COUNT(df.reactivo_id) AS total_reactivos_empleados
FROM formulas_quimicas f
INNER JOIN quimicos_analistas q ON f.quimico_id = q.id
LEFT JOIN detalle_formulas df ON f.id = df.formula_id
GROUP BY f.id, f.codigo_formula, f.nombre_formula, q.nombre, q.apellido, q.codigo_colegiado, f.ph_objetivo, f.estado
ORDER BY total_reactivos_empleados DESC;

-- 2. Verificación de Reactivos Críticos que requieren refrigeración y su uso en Fórmulas Aprobadas
SELECT 
    r.codigo_reactivo,
    r.numero_cas,
    r.nombre_quimico,
    r.stock_gramos,
    f.codigo_formula,
    f.nombre_formula
FROM reactivos r
INNER JOIN detalle_formulas df ON r.id = df.reactivo_id
INNER JOIN formulas_quimicas f ON df.formula_id = f.id
WHERE r.requiere_refrigeracion = TRUE 
  AND f.estado = 'Aprobada';

-- 3. Búsqueda directa por restricción UNIQUE de número CAS
SELECT 
    r.numero_cas,
    r.nombre_quimico,
    r.pureza_porcentaje,
    r.stock_gramos,
    IFNULL(COUNT(df.formula_id), 0) AS presencia_en_formulas
FROM reactivos r
LEFT JOIN detalle_formulas df ON r.id = df.reactivo_id
WHERE r.numero_cas = '64-17-5'
GROUP BY r.id, r.numero_cas, r.nombre_quimico, r.pureza_porcentaje, r.stock_gramos;

-- 4. Secuencia ordenada de adición de reactivos para la fórmula 'FORM-2026-D1'
SELECT 
    f.codigo_formula,
    f.nombre_formula,
    df.orden_adicion,
    r.nombre_quimico,
    r.numero_cas,
    df.concentración_proporción,
    df.unidad_medida
FROM formulas_quimicas f
INNER JOIN detalle_formulas df ON f.id = df.formula_id
INNER JOIN reactivos r ON df.reactivo_id = r.id
WHERE f.codigo_formula = 'FORM-2026-D1'
ORDER BY df.orden_adicion ASC;

-- 5. Resumen de Fórmulas por estado e inversión total de pureza de reactivos
SELECT 
    f.estado,
    COUNT(DISTINCT f.id) AS cantidad_formulas,
    ROUND(AVG(f.ph_objetivo), 2) AS ph_promedio,
    ROUND(AVG(r.pureza_porcentaje), 2) AS pureza_promedio_reactivos
FROM formulas_quimicas f
INNER JOIN detalle_formulas df ON f.id = df.formula_id
INNER JOIN reactivos r ON df.reactivo_id = r.id
GROUP BY f.estado
ORDER BY cantidad_formulas DESC;