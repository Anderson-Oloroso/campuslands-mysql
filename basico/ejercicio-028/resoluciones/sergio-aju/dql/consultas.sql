USE campuslands_mysql;

-- 1. Filtrar estudiantes que se encuentran estrictamente en estado 'activo' ordenados por promedio de mayor a menor
SELECT nombre_completo, correo, programa_estudio, promedio_general, fecha_inscripcion 
FROM estudiantes_academia 
WHERE estado = 'activo'
ORDER BY promedio_general DESC;

-- 2. Resumen por estado de los estudiantes: Conteo total y promedio general por cada categoría de estado
SELECT estado, COUNT(*) AS total_estudiantes, AVG(promedio_general) AS promedio_por_estado
FROM estudiantes_academia
GROUP BY estado
ORDER BY total_estudiantes DESC;

-- 3. Filtrar estudiantes que no están activos (agrupando pausados, graduados y retirados) ordenados por fecha de inscripción
SELECT nombre_completo, programa_estudio, estado, fecha_inscripcion 
FROM estudiantes_academia 
WHERE estado IN ('pausado', 'graduado', 'retirado')
ORDER BY fecha_inscripcion ASC;

-- 4. Top 3 estudiantes con mejor promedio general sin importar su estado actual
SELECT nombre_completo, programa_estudio, promedio_general, estado 
FROM estudiantes_academia 
ORDER BY promedio_general DESC 
LIMIT 3;

-- 5. Filtrar estudiantes activos del programa de Backend o FullStack ordenados alfabéticamente
SELECT nombre_completo, programa_estudio, promedio_general, estado 
FROM estudiantes_academia 
WHERE estado = 'activo' AND programa_estudio IN ('Backend', 'FullStack')
ORDER BY nombre_completo ASC;