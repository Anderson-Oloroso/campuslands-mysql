USE formulas_quimicas_db;

-- 1. Contar el número total de fórmulas químicas registradas en el laboratorio
SELECT COUNT(*) AS total_formulas_registradas
FROM formulas_quimicas;

-- 2. Calcular el total acumulado de volumen en mililitros y el costo total de producción de todas las fórmulas
SELECT 
    SUM(cantidad_mililitros) AS volumen_total_ml,
    CONCAT('$', FORMAT(SUM(costo_produccion_usd), 2)) AS costo_total_produccion_usd
FROM formulas_quimicas;

-- 3. Agrupar por categoría química para contar cuántas fórmulas existen en cada una y sumar sus costos respectivos
SELECT 
    categoria_quimica,
    COUNT(*) AS cantidad_formulas,
    CONCAT('$', FORMAT(SUM(costo_produccion_usd), 2)) AS costo_acumulado_categoria
FROM formulas_quimicas
GROUP BY categoria_quimica
ORDER BY cantidad_formulas DESC;

-- 4. Contar y sumar los costos acumulados filtrando únicamente aquellas fórmulas con nivel de toxicidad 'alto' o 'critico'
SELECT 
    nivel_toxicidad,
    COUNT(*) AS total_formulas_peligrosas,
    CONCAT('$', FORMAT(SUM(costo_produccion_usd), 2)) AS inversion_formulas_peligrosas
FROM formulas_quimicas
WHERE nivel_toxicidad IN ('alto', 'critico')
GROUP BY nivel_toxicidad;

-- 5. Reporte analítico avanzado agrupado por categoría: total de fórmulas, volumen total acumulado y costo promedio ponderado
SELECT 
    categoria_quimica,
    COUNT(*) AS total_compuestos,
    SUM(cantidad_mililitros) AS volumen_acumulado_ml,
    CONCAT('$', FORMAT(SUM(costo_produccion_usd), 2)) AS costo_total_usd,
    CONCAT('$', FORMAT(AVG(costo_produccion_usd), 2)) AS costo_promedio_usd
FROM formulas_quimicas
GROUP BY categoria_quimica
ORDER BY SUM(costo_produccion_usd) DESC;