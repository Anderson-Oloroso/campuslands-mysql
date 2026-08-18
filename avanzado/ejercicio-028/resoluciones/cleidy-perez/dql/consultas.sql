SELECT 
    c.titulo AS curso,
    i.nombre AS instructor,
    i.especialidad,
    ai.rol
FROM cursos c
INNER JOIN asignacion_instructores ai ON c.id = ai.id_curso
INNER JOIN instructores i ON ai.id_instructor = i.id;

SELECT 
    e.nombre AS estudiante,
    c.titulo AS curso_matriculado,
    i.nombre AS instructor_titular
FROM estudiantes e
INNER JOIN matriculas m ON e.id = m.id_estudiante
INNER JOIN cursos c ON m.id_curso = c.id
INNER JOIN asignacion_instructores ai ON c.id = ai.id_curso
INNER JOIN instructores i ON ai.id_instructor = i.id
WHERE ai.rol = 'Titular';