-- DQL: Consultas de análisis sobre los saltos insertados
USE campuslands_mysql;

-- 1. Listado general de saltos ordenados por fecha
SELECT 
    codigo_salto,
    paracaidista_nombre,
    modalidad,
    altura_pies,
    costo_usd,
    estado
FROM registro_saltos_basico
ORDER BY fecha_salto DESC;

-- 2. Conteo de saltos e ingresos totales agrupados por modalidad
SELECT 
    modalidad,
    COUNT(*) AS total_saltos,
    ROUND(SUM(costo_usd), 2) AS ingresos_totales_usd
FROM registro_saltos_basico
WHERE estado = 'completado'
GROUP BY modalidad
ORDER BY total_saltos DESC;

-- 3. Saltos realizados a alturas superiores o iguales a 12,000 pies
SELECT 
    codigo_salto,
    paracaidista_nombre,
    modalidad,
    altura_pies
FROM registro_saltos_basico
WHERE altura_pies >= 12000 AND estado = 'completado'
ORDER BY altura_pies DESC;

-- 4. Promedio de costo y altura por estado del salto
SELECT 
    estado,
    COUNT(*) AS cantidad_registros,
    ROUND(AVG(costo_usd), 2) AS costo_promedio,
    ROUND(AVG(altura_pies), 0) AS altura_promedio_pies
FROM registro_saltos_basico
GROUP BY estado;

-- 5. Top 3 de saltos de mayor valor económico
SELECT 
    codigo_salto,
    paracaidista_nombre,
    modalidad,
    costo_usd
FROM registro_saltos_basico
ORDER BY costo_usd DESC
LIMIT 3;
