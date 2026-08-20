USE campuslands_mysql;

-- 1. Mostrar los estudiantes inscritos en cada curso.
SELECT
    c.nombre AS curso,
    e.nombre AS estudiante,
    i.fecha_inscripcion,
    i.estado AS estado_inscripcion
FROM inscripciones AS i
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
ORDER BY c.nombre, e.nombre;


-- 2. Mostrar los cursos de cada estudiante.
SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    c.categoria,
    i.estado AS estado_inscripcion
FROM inscripciones AS i
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
ORDER BY e.nombre, c.nombre;


-- 3. Contar cuántos estudiantes tiene cada curso.
SELECT
    c.id_curso,
    c.nombre AS curso,
    COUNT(i.id_estudiante) AS total_estudiantes
FROM cursos AS c
LEFT JOIN inscripciones AS i
    ON c.id_curso = i.id_curso
GROUP BY
    c.id_curso,
    c.nombre
ORDER BY total_estudiantes DESC;


-- 4. Mostrar los estudiantes que están inscritos
-- en más de un curso.
SELECT
    e.id_estudiante,
    e.nombre AS estudiante,
    COUNT(i.id_curso) AS total_cursos
FROM estudiantes AS e
INNER JOIN inscripciones AS i
    ON e.id_estudiante = i.id_estudiante
WHERE i.estado = 'activa'
GROUP BY
    e.id_estudiante,
    e.nombre
HAVING COUNT(i.id_curso) > 1
ORDER BY total_cursos DESC;


-- 5. Mostrar únicamente las inscripciones activas
-- de estudiantes activos en cursos activos.
SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    c.categoria,
    i.fecha_inscripcion
FROM inscripciones AS i
INNER JOIN estudiantes AS e
    ON i.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON i.id_curso = c.id_curso
WHERE e.estado = 'activo'
  AND c.estado = 'activo'
  AND i.estado = 'activa'
ORDER BY i.fecha_inscripcion ASC;