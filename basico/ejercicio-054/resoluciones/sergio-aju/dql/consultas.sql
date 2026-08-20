USE campuslands_mysql;

-- 1. Consultar el estado actual de las inspecciones válidas tras las eliminaciones controladas, ordenadas por resistencia
SELECT 
    codigo_inspeccion,
    nombre_soldador,
    proceso_soldadura,
    material_base,
    resistencia_traccion_mpa,
    resultado_inspeccion
FROM inspecciones_soldadura
ORDER BY resistencia_traccion_mpa DESC;

-- 2. Reporte analítico agrupado por proceso de soldadura: Cantidad de registros activos, longitud media de cordón y resistencia promedio
SELECT 
    proceso_soldadura,
    COUNT(*) AS total_inspecciones_activas,
    ROUND(AVG(longitud_cordon_cm), 2) AS longitud_media_cordon_cm,
    ROUND(AVG(resistencia_traccion_mpa), 2) AS resistencia_promedio_mpa
FROM inspecciones_soldadura
GROUP BY proceso_soldadura
ORDER BY resistencia_promedio_mpa DESC;

-- 3. Análisis de rendimiento agrupado por el resultado de la inspección actual
SELECT 
    resultado_inspeccion,
    COUNT(*) AS cantidad_registros,
    MAX(resistencia_traccion_mpa) AS maxima_resistencia_mpa
FROM inspecciones_soldadura
GROUP BY resultado_inspeccion
ORDER BY cantidad_registros DESC;

-- 4. Top 3 de cordones de soldadura con mayor resistencia a la tracción tras la depuración de la base de datos
SELECT 
    codigo_inspeccion,
    nombre_soldador,
    proceso_soldadura,
    material_base,
    resistencia_traccion_mpa,
    resultado_inspeccion
FROM inspecciones_soldadura
ORDER BY resistencia_traccion_mpa DESC
LIMIT 3;

-- 5. Consulta analítica de eficiencia (resistencia por centímetro de cordón) para evaluar la calidad estructural remanente
SELECT 
    codigo_inspeccion,
    nombre_soldador,
    proceso_soldadura,
    longitud_cordon_cm,
    resistencia_traccion_mpa,
    ROUND((resistencia_traccion_mpa / longitud_cordon_cm), 2) AS indice_resistencia_por_cm
FROM inspecciones_soldadura
ORDER BY indice_resistencia_por_cm DESC;