USE campuslands_mysql;


-- 1. Mostrar estudiantes y los cursos en los que están inscritos.
SELECT
    e.nombre_completo AS estudiante,
    c.nombre_curso AS curso,
    c.nivel,
    i.progreso,
    i.estado
FROM inscripciones AS i
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
ORDER BY e.nombre_completo, c.nombre_curso;


-- 2. Mostrar los cursos inscritos por cada estudiante activo.
SELECT
    e.nombre_completo AS estudiante,
    c.nombre_curso AS curso,
    i.progreso
FROM estudiantes AS e
INNER JOIN inscripciones AS i
    ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
WHERE e.estado = 'activo'
ORDER BY e.nombre_completo, i.progreso DESC;


-- 3. Contar cuántos estudiantes tiene cada curso.
SELECT
    c.nombre_curso AS curso,
    COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos AS c
LEFT JOIN inscripciones AS i
    ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso
ORDER BY total_estudiantes DESC;


-- 4. Calcular el progreso promedio de cada curso.
SELECT
    c.nombre_curso AS curso,
    COUNT(i.id_estudiante) AS estudiantes,
    ROUND(AVG(i.progreso), 2) AS progreso_promedio
FROM cursos AS c
INNER JOIN inscripciones AS i
    ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso
ORDER BY progreso_promedio DESC;


-- 5. Mostrar estudiantes inscritos en más de un curso.
SELECT
    e.nombre_completo AS estudiante,
    COUNT(i.id_curso) AS total_cursos
FROM estudiantes AS e
INNER JOIN inscripciones AS i
    ON e.id_estudiante = i.id_estudiante
GROUP BY e.id_estudiante, e.nombre_completo
HAVING COUNT(i.id_curso) > 1
ORDER BY total_cursos DESC;


-- 6. Mostrar cursos de nivel intermedio con sus estudiantes.
SELECT
    c.nombre_curso AS curso,
    e.nombre_completo AS estudiante,
    i.progreso
FROM cursos AS c
INNER JOIN inscripciones AS i
    ON c.id_curso = i.id_curso
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
WHERE c.nivel = 'intermedio'
ORDER BY c.nombre_curso, i.progreso DESC;


-- 7. Mostrar estudiantes con progreso superior al promedio
-- general de todas las inscripciones.
SELECT
    e.nombre_completo AS estudiante,
    c.nombre_curso AS curso,
    i.progreso
FROM inscripciones AS i
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
WHERE i.progreso > (
    SELECT AVG(progreso)
    FROM inscripciones
)
ORDER BY i.progreso DESC;


-- 8. Reporte general por nivel de curso.
SELECT
    c.nivel,
    COUNT(i.id_estudiante) AS total_inscripciones,
    ROUND(AVG(i.progreso), 2) AS progreso_promedio
FROM cursos AS c
INNER JOIN inscripciones AS i
    ON c.id_curso = i.id_curso
GROUP BY c.nivel
ORDER BY progreso_promedio DESC;