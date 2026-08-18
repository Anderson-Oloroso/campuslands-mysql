USE campuslands_mysql;

SELECT
    nombre AS estudiante,
    curso,
    nivel,
    promedio
FROM estudiantes
WHERE estado = 'activo'
ORDER BY nombre;

SELECT
    nombre AS estudiante,
    curso,
    nivel,
    promedio
FROM estudiantes
WHERE estado = 'inactivo'
ORDER BY nombre;

SELECT
    COUNT(*) AS total_estudiantes_activos
FROM estudiantes
WHERE estado = 'activo';

SELECT
    nombre AS estudiante,
    curso,
    promedio
FROM estudiantes
WHERE estado = 'activo'
  AND promedio > 90
ORDER BY promedio DESC;

SELECT
    estado,
    COUNT(*) AS total_estudiantes
FROM estudiantes
GROUP BY estado
ORDER BY total_estudiantes DESC;

SELECT
    ROUND(AVG(promedio), 2) AS promedio_general_activos
FROM estudiantes
WHERE estado = 'activo';


SELECT
    nombre AS estudiante,
    nivel,
    promedio
FROM estudiantes
WHERE estado = 'activo'
  AND curso = 'SQL'
ORDER BY promedio DESC;