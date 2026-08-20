USE campuslands_mysql;

-- 1. Filtrar y ordenar: Mostrar saltos completados con una altura superior a 12,000 pies ordenados de mayor a menor altura
SELECT 
    codigo_salto,
    nombre_paracaidista,
    tipo_salto,
    altura_pies,
    precio_usd,
    calificacion_experiencia
FROM saltos_paracaidismo
WHERE estado_salto = 'completado' AND altura_pies > 12000
ORDER BY altura_pies DESC;

-- 2. Reporte agrupado por tipo de salto: Calcular la cantidad de saltos, precio promedio y altura media por categoría
SELECT 
    tipo_salto,
    COUNT(*) AS total_saltos,
    ROUND(AVG(precio_usd), 2) AS precio_promedio,
    ROUND(AVG(altura_pies), 0) AS altura_media_pies
FROM saltos_paracaidismo
GROUP BY tipo_salto
ORDER BY total_saltos DESC;

-- 3. Análisis de ingresos generados por los saltos agrupados por estado actual
SELECT 
    estado_salto,
    COUNT(*) AS cantidad_registros,
    SUM(precio_usd) AS ingreso_total_estado
FROM saltos_paracaidismo
GROUP BY estado_salto
ORDER BY ingreso_total_estado DESC;

-- 4. Top 3 de saltos con mayor calificación de experiencia por parte de los paracaidistas
SELECT 
    codigo_salto,
    nombre_paracaidista,
    tipo_salto,
    calificacion_experiencia,
    estado_salto
FROM saltos_paracaidismo
ORDER BY calificacion_experiencia DESC, altura_pies DESC
LIMIT 3;

-- 5. Consulta analítica de saltos de alta gama (precio mayor a 300.00) que se encuentran completados o programados
SELECT 
    codigo_salto,
    nombre_paracaidista,
    tipo_salto,
    precio_usd,
    fecha_salto,
    estado_salto
FROM saltos_paracaidismo
WHERE precio_usd > 300.00 AND estado_salto IN ('completado', 'programado')
ORDER BY precio_usd DESC;