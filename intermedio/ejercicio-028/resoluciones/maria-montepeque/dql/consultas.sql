USE campuslands_mysql;

-- 1. Estudiantes inscritos en "React desde Cero"
SELECT e.nombre, i.fecha_inscripcion, i.calificacion_final
FROM inscripciones_intermedio i
INNER JOIN estudiantes_intermedio e ON e.id_estudiante = i.id_estudiante
INNER JOIN cursos_intermedio c ON c.id_curso = i.id_curso
WHERE c.nombre_curso = 'React desde Cero';

-- 2. Cursos en los que esta inscrita Laura Gomez
SELECT c.nombre_curso, c.categoria, i.calificacion_final
FROM inscripciones_intermedio i
INNER JOIN cursos_intermedio c ON c.id_curso = i.id_curso
INNER JOIN estudiantes_intermedio e ON e.id_estudiante = i.id_estudiante
WHERE e.nombre = 'Laura Gomez';

-- 3. Cantidad de estudiantes inscritos por curso
SELECT c.nombre_curso, COUNT(*) AS total_estudiantes
FROM inscripciones_intermedio i
INNER JOIN cursos_intermedio c ON c.id_curso = i.id_curso
GROUP BY c.nombre_curso
ORDER BY total_estudiantes DESC;

-- 4. Cantidad de cursos por estudiante
SELECT e.nombre, COUNT(*) AS total_cursos
FROM inscripciones_intermedio i
INNER JOIN estudiantes_intermedio e ON e.id_estudiante = i.id_estudiante
GROUP BY e.nombre
ORDER BY total_cursos DESC;

-- 5. Estudiantes inscritos en mas de 2 cursos (GROUP BY + HAVING)
SELECT e.nombre, COUNT(*) AS total_cursos
FROM inscripciones_intermedio i
INNER JOIN estudiantes_intermedio e ON e.id_estudiante = i.id_estudiante
GROUP BY e.nombre
HAVING COUNT(*) > 2;

-- 6. Calificacion promedio por curso, solo inscripciones ya calificadas
SELECT c.nombre_curso, ROUND(AVG(i.calificacion_final), 2) AS calificacion_promedio
FROM inscripciones_intermedio i
INNER JOIN cursos_intermedio c ON c.id_curso = i.id_curso
WHERE i.calificacion_final IS NOT NULL
GROUP BY c.nombre_curso
ORDER BY calificacion_promedio DESC;
