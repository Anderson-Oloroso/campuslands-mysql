-- 1. Ver inscripciones con nombres
SELECT e.nombre AS estudiante, c.nombre AS curso, i.fecha
FROM `ejercicio-028-int_inscripciones` i
INNER JOIN `ejercicio-028-int-estudiantes` e ON i.estudiante_id = e.id
INNER JOIN `ejercicio-028-int-cursos` c ON i.curso_id = c.id;

-- 2. Cursos por estudiante
SELECT e.nombre, COUNT(i.curso_id) AS cursos
FROM `ejercicio-028-int-estudiantes` e
LEFT JOIN `ejercicio-028-int_inscripciones` i ON e.id = i.estudiante_id
GROUP BY e.id;

-- 3. Estudiantes por curso
SELECT c.nombre, COUNT(i.estudiante_id) AS estudiantes
FROM `ejercicio-028-int-cursos` c
LEFT JOIN `ejercicio-028-int_inscripciones` i ON c.id = i.curso_id
GROUP BY c.id;