USE campuslands_mysql;

-- 1. Conteo total de fórmulas y suma total de volumen agrupado por tipo de compuesto (Uso de COUNT y SUM)
SELECT tipo_compuesto, COUNT(*) AS total_formulas, SUM(volumen_ml) AS volumen_total_ml
FROM basico_ejercicio_025
GROUP BY tipo_compuesto
ORDER BY volumen_total_ml DESC;

-- 2. Conteo de fórmulas activas por cada tipo de compuesto
SELECT tipo_compuesto, COUNT(*) AS formulas_activas, SUM(volumen_ml) AS volumen_activo_ml
FROM basico_ejercicio_025
WHERE estado = 'activo'
GROUP BY tipo_compuesto
ORDER BY formulas_activas DESC;

-- 3. Suma total de volumen acumulado según el estado de las fórmulas
SELECT estado, COUNT(*) AS cantidad_formulas, SUM(volumen_ml) AS suma_volumen_ml
FROM basico_ejercicio_025
GROUP BY estado
ORDER BY suma_volumen_ml DESC;

-- 4. Top 3 fórmulas químicas con mayor volumen registrado sin importar su estado
SELECT nombre_formula, tipo_compuesto, volumen_ml 
FROM basico_ejercicio_025 
ORDER BY volumen_ml DESC 
LIMIT 3;

-- 5. Listado general de fórmulas ordenadas alfabéticamente por nombre
SELECT nombre_formula, tipo_compuesto, volumen_ml, estado 
FROM basico_ejercicio_025 
ORDER BY nombre_formula ASC;