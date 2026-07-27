-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM Estudiantes 
WHERE estado = 'Activo';

SELECT 
    e.nombre AS estudiante,
    c.titulo AS curso,
    m.estado_matricula
FROM Matriculas m
JOIN Estudiantes e ON m.estudiante_id = e.estudiante_id
JOIN Cursos c ON m.curso_id = c.curso_id
WHERE m.estado_matricula = 'En Curso';
