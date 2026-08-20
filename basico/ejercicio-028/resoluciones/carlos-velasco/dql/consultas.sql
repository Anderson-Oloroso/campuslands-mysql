USE campuslands_mysql;

-- 1. Consultar todos los estudiantes activos.
SELECT
    nombre AS estudiante,
    curso,
    nivel,
    progreso,
    estado
FROM estudiantes_academia
WHERE estado = 'activo'
ORDER BY progreso DESC;


-- 2. Consultar estudiantes inactivos.
SELECT
    nombre AS estudiante,
    curso,
    nivel,
    progreso
FROM estudiantes_academia
WHERE estado = 'inactivo'
ORDER BY nombre ASC;


-- 3. Consultar estudiantes graduados.
SELECT
    nombre AS estudiante,
    curso,
    progreso,
    estado
FROM estudiantes_academia
WHERE estado = 'graduado'
ORDER BY progreso DESC;


-- 4. Consultar estudiantes activos con progreso superior al 80%.
SELECT
    nombre AS estudiante,
    curso,
    progreso
FROM estudiantes_academia
WHERE estado = 'activo'
  AND progreso > 80
ORDER BY progreso DESC;


-- 5. Obtener cantidad de estudiantes por estado.
SELECT
    estado,
    COUNT(*) AS total_estudiantes
FROM estudiantes_academia
GROUP BY estado
ORDER BY total_estudiantes DESC;