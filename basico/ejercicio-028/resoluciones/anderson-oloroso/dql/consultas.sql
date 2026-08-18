USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por precio_curso descendentemente
SELECT curso_id, nombre_curso, area, duracion_semanas, precio_curso, estado
FROM cursos_tech
ORDER BY precio_curso DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT curso_id, nombre_curso, area, precio_curso
FROM cursos_tech
WHERE estado = 'Activo';

-- 3. Agrupar por area y calcular total y promedio de precio_curso
SELECT area, COUNT(*) AS total_registros, AVG(precio_curso) AS promedio_valor
FROM cursos_tech
GROUP BY area
ORDER BY promedio_valor DESC;

-- 4. Filtrar por precio_curso mayor a 2000
SELECT curso_id, nombre_curso, area, precio_curso
FROM cursos_tech
WHERE precio_curso > 2000.00
ORDER BY precio_curso ASC;

-- 5. Seleccionar los 5 mejores registros según precio_curso
SELECT curso_id, nombre_curso, area, precio_curso
FROM cursos_tech
ORDER BY precio_curso DESC
LIMIT 5;
