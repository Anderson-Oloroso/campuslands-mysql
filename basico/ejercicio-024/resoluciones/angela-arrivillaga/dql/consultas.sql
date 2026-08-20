USE soldadura_industrial_db;

-- SECCIÓN DE ELIMINACIONES CONTROLADAS (DELETE)

-- 1. Eliminar registros de soldadura marcados con estado 'obsoleto' (limpieza inicial de datos históricos descartados)
DELETE FROM registros_soldadura
WHERE estado_cordon = 'obsoleto';

-- 2. Eliminar cordones que presentaron fallas críticas con una calidad de inspección menor al 50.00%
DELETE FROM registros_soldadura
WHERE calidad_inspeccion_pct < 50.00;

-- 3. Eliminar de manera específica un registro erróneo identificado por su código único de cordón ('COR-005')
DELETE FROM registros_soldadura
WHERE codigo_cordon = 'COR-005';


-- SECCIÓN DE CONSULTAS DE VERIFICACIÓN Y REPORTE (SELECT)

-- 4. Consultar los registros activos restantes ordenados por porcentaje de calidad de inspección de mayor a menor
SELECT codigo_cordon, proceso_soldadura, tipo_material, amperaje_usado, CONCAT(calidad_inspeccion_pct, '%') AS calidad_inspeccion, estado_cordon
FROM registros_soldadura
ORDER BY calidad_inspeccion_pct DESC;

-- 5. Resumen estadístico final de los cordones aprobados y en revisión tras las operaciones de eliminación controlada
SELECT estado_cordon, COUNT(*) AS total_cordones, CONCAT(ROUND(AVG(calidad_inspeccion_pct), 2), '%') AS promedio_calidad
FROM registros_soldadura
GROUP BY estado_cordon
ORDER BY promedio_calidad DESC;