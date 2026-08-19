USE campuslands_mysql;

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    c.nivel,
    ec.fecha_inscripcion,
    ec.nota_final,
    ec.estado
FROM estudiante_curso AS ec
INNER JOIN estudiantes AS e
    ON ec.id_estudiante = e.id_estudiante
INNER JOIN cursos AS c
    ON ec.id_curso = c.id_curso
ORDER BY e.nombre, c.nombre;


SELECT
    e.nombre AS estudiante,
    COUNT(ec.id_curso) AS total_cursos,
    ROUND(AVG(ec.nota_final), 2) AS promedio_notas
FROM estudiantes AS e
INNER JOIN estudiante_curso AS ec
    ON e.id_estudiante = ec.id_estudiante
GROUP BY e.id_estudiante, e.nombre
ORDER BY total_cursos DESC, promedio_notas DESC;

SELECT
    c.nombre AS curso,
    c.nivel,
    COUNT(ec.id_estudiante) AS total_estudiantes,
    ROUND(AVG(ec.nota_final), 2) AS promedio_nota
FROM cursos AS c
INNER JOIN estudiante_curso AS ec
    ON c.id_curso = ec.id_curso
GROUP BY c.id_curso, c.nombre, c.nivel
ORDER BY total_estudiantes DESC, promedio_nota DESC;