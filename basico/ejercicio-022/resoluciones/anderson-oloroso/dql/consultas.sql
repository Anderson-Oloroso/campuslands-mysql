USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por software_creacion descendentemente
SELECT modelo_id, nombre_modelo, tipo_geometria, numero_poligonos, software_creacion, estado
FROM modelos_3d
ORDER BY software_creacion DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT modelo_id, nombre_modelo, tipo_geometria, software_creacion
FROM modelos_3d
WHERE estado = 'Activo';

-- 3. Agrupar por tipo_geometria y calcular total y promedio de software_creacion
SELECT tipo_geometria, COUNT(*) AS total_registros, AVG(software_creacion) AS promedio_valor
FROM modelos_3d
GROUP BY tipo_geometria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por software_creacion mayor a 2000
SELECT modelo_id, nombre_modelo, tipo_geometria, software_creacion
FROM modelos_3d
WHERE software_creacion > 2000.00
ORDER BY software_creacion ASC;

-- 5. Seleccionar los 5 mejores registros según software_creacion
SELECT modelo_id, nombre_modelo, tipo_geometria, software_creacion
FROM modelos_3d
ORDER BY software_creacion DESC
LIMIT 5;
