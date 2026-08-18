USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por costo_base descendentemente
SELECT servicio_id, nombre_servicio, categoria, duracion_hrs, costo_base, estado
FROM servicios_taller
ORDER BY costo_base DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT servicio_id, nombre_servicio, categoria, costo_base
FROM servicios_taller
WHERE estado = 'Activo';

-- 3. Agrupar por categoria y calcular total y promedio de costo_base
SELECT categoria, COUNT(*) AS total_registros, AVG(costo_base) AS promedio_valor
FROM servicios_taller
GROUP BY categoria
ORDER BY promedio_valor DESC;

-- 4. Filtrar por costo_base mayor a 2000
SELECT servicio_id, nombre_servicio, categoria, costo_base
FROM servicios_taller
WHERE costo_base > 2000.00
ORDER BY costo_base ASC;

-- 5. Seleccionar los 5 mejores registros según costo_base
SELECT servicio_id, nombre_servicio, categoria, costo_base
FROM servicios_taller
ORDER BY costo_base DESC
LIMIT 5;
