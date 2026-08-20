USE campuslands_mysql;

-- 1. Reporte de formulas aprobadas y el total de reactivos involucrados
SELECT 
    f.codigo_formula,
    f.nombre_producto,
    f.aplicacion,
    f.ph_objetivo,
    COUNT(c.reactivo_id) AS total_ingredientes_activos,
    SUM(c.concentracion_pct) AS porcentaje_total_mezcla
FROM formulas_quimicas f
LEFT JOIN componentes_formula c ON f.id = c.formula_id
WHERE f.estado = 'Aprobado'
GROUP BY f.id, f.codigo_formula, f.nombre_producto, f.aplicacion, f.ph_objetivo
ORDER BY total_ingredientes_activos DESC;

-- 2. Reactivos con riesgo 'Alto' o 'Crítico' y su disponibilidad en stock
SELECT 
    nombre_quimico,
    formula_molecular,
    numero_cas,
    nivel_riesgo,
    FORMAT(stock_gramos, 2) AS stock_disponible_g,
    nivel_pureza_pct
FROM reactivos
WHERE nivel_riesgo IN ('Alto', 'Crítico')
ORDER BY stock_gramos ASC;

-- 3. Análisis de control de calidad: Filtrar ensayos con observaciones o no conformes
SELECT 
    r.nombre_quimico,
    a.lote_codigo,
    a.ph_medido,
    a.impurezas_ppm,
    a.resultado AS estado_analisis,
    a.fecha_analisis
FROM analisis_reactivos a
JOIN reactivos r ON a.reactivo_id = r.id
WHERE a.resultado != 'Conforme'
ORDER BY a.fecha_analisis DESC;

-- 4. Promedio de pH y temperatura por aplicación industrial/farmacéutica
SELECT 
    aplicacion,
    COUNT(*) AS total_formulas,
    ROUND(AVG(ph_objetivo), 2) AS ph_promedio,
    ROUND(AVG(temperatura_mezcla_c), 2) AS temp_promedio_c
FROM formulas_quimicas
GROUP BY aplicacion
ORDER BY total_formulas DESC;

-- 5. Ranking Top de reactivos más utilizados en la preparación de fórmulas
SELECT 
    r.nombre_quimico,
    r.formula_molecular,
    COUNT(c.formula_id) AS numero_de_formulas_que_lo_usan,
    ROUND(AVG(c.concentracion_pct), 2) AS concentracion_promedio_pct
FROM reactivos r
JOIN componentes_formula c ON r.reactivo_id = c.reactivo_id
GROUP BY r.id, r.nombre_quimico, r.formula_molecular
ORDER BY numero_de_formulas_que_lo_usan DESC;