USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por horas_trabajo descendentemente
SELECT ilustracion_id, titulo_obra, estilo_arte, software, horas_trabajo, estado
FROM ilustraciones_digitales
ORDER BY horas_trabajo DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT ilustracion_id, titulo_obra, estilo_arte, horas_trabajo
FROM ilustraciones_digitales
WHERE estado = 'Activo';

-- 3. Agrupar por estilo_arte y calcular total y promedio de horas_trabajo
SELECT estilo_arte, COUNT(*) AS total_registros, AVG(horas_trabajo) AS promedio_valor
FROM ilustraciones_digitales
GROUP BY estilo_arte
ORDER BY promedio_valor DESC;

-- 4. Filtrar por horas_trabajo mayor a 2000
SELECT ilustracion_id, titulo_obra, estilo_arte, horas_trabajo
FROM ilustraciones_digitales
WHERE horas_trabajo > 2000.00
ORDER BY horas_trabajo ASC;

-- 5. Seleccionar los 5 mejores registros según horas_trabajo
SELECT ilustracion_id, titulo_obra, estilo_arte, horas_trabajo
FROM ilustraciones_digitales
ORDER BY horas_trabajo DESC
LIMIT 5;
