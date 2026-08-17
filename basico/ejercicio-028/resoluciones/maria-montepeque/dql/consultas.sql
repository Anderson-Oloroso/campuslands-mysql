USE campuslands_mysql;

-- 1. Estudiantes activos ordenados por progreso
SELECT nombre, programa, progreso_porcentaje
FROM estudiantes_basico
WHERE estado = 'activo'
ORDER BY progreso_porcentaje DESC;

-- 2. Estudiantes graduados
SELECT nombre, programa, fecha_inscripcion
FROM estudiantes_basico
WHERE estado = 'graduado';

-- 3. Estudiantes que no estan activos (pausados, retirados o graduados)
SELECT nombre, programa, estado
FROM estudiantes_basico
WHERE estado <> 'activo'
ORDER BY estado;

-- 4. Estudiantes activos o pausados con progreso menor al 50%
SELECT nombre, estado, progreso_porcentaje
FROM estudiantes_basico
WHERE estado IN ('activo', 'pausado') AND progreso_porcentaje < 50
ORDER BY progreso_porcentaje;

-- 5. Cantidad de estudiantes por estado
SELECT estado, COUNT(*) AS total
FROM estudiantes_basico
GROUP BY estado
ORDER BY total DESC;

-- 6. Progreso promedio de los estudiantes activos, por programa
SELECT programa, AVG(progreso_porcentaje) AS progreso_promedio
FROM estudiantes_basico
WHERE estado = 'activo'
GROUP BY programa
ORDER BY progreso_promedio DESC;
