USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por costo_proyecto descendentemente
SELECT trabajo_id, tipo_soldadura, material_base, espesor_mm, costo_proyecto, estado
FROM trabajos_soldadura
ORDER BY costo_proyecto DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT trabajo_id, tipo_soldadura, material_base, costo_proyecto
FROM trabajos_soldadura
WHERE estado = 'Activo';

-- 3. Agrupar por material_base y calcular total y promedio de costo_proyecto
SELECT material_base, COUNT(*) AS total_registros, AVG(costo_proyecto) AS promedio_valor
FROM trabajos_soldadura
GROUP BY material_base
ORDER BY promedio_valor DESC;

-- 4. Filtrar por costo_proyecto mayor a 2000
SELECT trabajo_id, tipo_soldadura, material_base, costo_proyecto
FROM trabajos_soldadura
WHERE costo_proyecto > 2000.00
ORDER BY costo_proyecto ASC;

-- 5. Seleccionar los 5 mejores registros según costo_proyecto
SELECT trabajo_id, tipo_soldadura, material_base, costo_proyecto
FROM trabajos_soldadura
ORDER BY costo_proyecto DESC
LIMIT 5;
