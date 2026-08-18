USE campuslands_mysql;

SELECT
    e.nombre AS estudiante,
    c.nombre AS curso,
    ec.fecha_inscripcion
FROM estudiante_curso ec
INNER JOIN estudiantes e
    ON ec.id_estudiante = e.id_estudiante
INNER JOIN cursos c
    ON ec.id_curso = c.id_curso
WHERE e.estado = 'activo'
ORDER BY e.nombre, ec.fecha_inscripcion;


SELECT
    e.nombre AS estudiante,
    COUNT(ec.id_curso) AS total_cursos
FROM estudiantes e
INNER JOIN estudiante_curso ec
    ON e.id_estudiante = ec.id_estudiante
WHERE e.estado = 'activo'
GROUP BY e.id_estudiante, e.nombre
ORDER BY total_cursos DESC, estudiante;

SELECT
    c.nombre AS curso,
    COUNT(ec.id_estudiante) AS total_estudiantes
FROM cursos c
INNER JOIN estudiante_curso ec
    ON c.id_curso = ec.id_curso
GROUP BY c.id_curso, c.nombre
ORDER BY total_estudiantes DESC, curso
LIMIT 5;



SELECT
    c.categoria,
    COUNT(*) AS total_cursos,
    AVG(c.puntaje) AS promedio_puntaje
FROM cursos c
WHERE c.estado = 'activo'
GROUP BY c.categoria
ORDER BY promedio_puntaje DESC;

SELECT
    e.nombre AS estudiante,
    COUNT(ec.id_curso) AS total_cursos
FROM estudiantes e
INNER JOIN estudiante_curso ec
    ON e.id_estudiante = ec.id_estudiante
GROUP BY e.id_estudiante, e.nombre
HAVING COUNT(ec.id_curso) > 1
ORDER BY total_cursos DESC, estudiante;