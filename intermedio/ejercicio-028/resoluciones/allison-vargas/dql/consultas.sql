USE academia_puente_db;

-- Consulta 1: Listado detallado de estudiantes y los cursos en los que están inscritos usando INNER JOIN
SELECT 
    e.nombre_completo AS 'Estudiante',
    c.nombre_curso AS 'Curso Inscrito',
    c.categoria AS 'Categoría',
    i.estado_inscripcion AS 'Estado de Inscripción'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
ORDER BY e.nombre_completo ASC;

-- Consulta 2: Conteo de estudiantes inscritos por cada curso (Reporte de demanda)
SELECT 
    c.nombre_curso AS 'Curso',
    c.categoria AS 'Categoría',
    COUNT(i.id_estudiante) AS 'Total Estudiantes Inscritos'
FROM cursos c
LEFT JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso, c.categoria
ORDER BY 'Total Estudiantes Inscritos' DESC;

-- Consulta 3: Top 3 de cursos con mayor recaudación estimada según sus inscripciones y costos
SELECT 
    c.nombre_curso AS 'Curso Destacado',
    COUNT(i.id_estudiante) AS 'Inscripciones',
    SUM(c.costo) AS 'Recaudación Total ($)'
FROM cursos c
JOIN inscripciones i ON c.id_curso = i.id_curso
GROUP BY c.id_curso, c.nombre_curso
ORDER BY 'Recaudación Total ($)' DESC
LIMIT 3;

-- Consulta 4: Filtrar inscripciones cuyo estado sea 'Completado' mostrando fecha y costo
SELECT 
    e.nombre_completo AS 'Estudiante',
    c.nombre_curso AS 'Curso Finalizado',
    i.fecha_inscripcion AS 'Fecha de Ingreso',
    c.costo AS 'Inversión'
FROM inscripciones i
JOIN estudiantes e ON i.id_estudiante = e.id_estudiante
JOIN cursos c ON i.id_curso = c.id_curso
WHERE i.estado_inscripcion = 'Completado'
ORDER BY i.fecha_inscripcion DESC;

-- Consulta 5: Resumen agrupado por el estado de la inscripción y costo promedio asociado
SELECT 
    i.estado_inscripcion AS 'Estado de la Matrícula',
    COUNT(*) AS 'Cantidad de Registros',
    AVG(c.costo) AS 'Costo Promedio del Curso'
FROM inscripciones i
JOIN cursos c ON i.id_curso = c.id_curso
GROUP BY i.estado_inscripcion
ORDER BY Cantidad DESC;
