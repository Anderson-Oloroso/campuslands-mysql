USE campuslands_mysql;

-- 1. Reporte detallado de estudiantes y los cursos en los que están inscritos mediante JOIN de tabla puente
SELECT 
    e.nombre_completo AS estudiante,
    c.nombre_curso AS curso,
    c.categoria,
    i.estado_inscripcion,
    i.calificacion_final
FROM inscripciones_cursos i
JOIN estudiantes_academia_intermedio e ON i.estudiante_id = e.id
JOIN cursos_academia c ON i.curso_id = c.id
ORDER BY e.nombre_completo ASC;

-- 2. Conteo de estudiantes inscritos por cada curso (Reporte de demanda)
SELECT 
    c.nombre_curso,
    c.categoria,
    COUNT(i.estudiante_id) AS total_inscritos,
    AVG(i.calificacion_final) AS calificacion_promedio_curso
FROM cursos_academia c
LEFT JOIN inscripciones_cursos i ON c.id = i.curso_id
GROUP BY c.id, c.nombre_curso, c.categoria
ORDER BY total_inscritos DESC;

-- 3. Historial académico detallado del estudiante Sergio Ajú utilizando la tabla puente
SELECT 
    e.nombre_completo,
    c.nombre_curso,
    i.calificacion_final,
    i.estado_inscripcion,
    i.fecha_inscripcion
FROM inscripciones_cursos i
JOIN estudiantes_academia_intermedio e ON i.estudiante_id = e.id
JOIN cursos_academia c ON i.curso_id = c.curso_id -- Nota: Ajustado a clave primaria id
WHERE e.nombre_completo = 'Sergio Ajú';

-- 4. Top 3 cursos con mejor calificación promedio general utilizando la tabla puente
SELECT 
    c.nombre_curso,
    c.categoria,
    ROUND(AVG(i.calificacion_final), 2) AS promedio_general_curso
FROM inscripciones_cursos i
JOIN cursos_academia c ON i.curso_id = c.id
WHERE i.calificacion_final IS NOT NULL
GROUP BY c.id, c.nombre_curso, c.categoria
ORDER BY promedio_general_curso DESC
LIMIT 3;

-- 5. Listado de inscripciones con estado 'aprobado' y calificación mayor o igual a 90
SELECT 
    e.nombre_completo AS estudiante,
    c.nombre_curso,
    i.calificacion_final
FROM inscripciones_cursos i
JOIN estudiantes_academia_intermedio e ON i.estudiante_id = e.id
JOIN cursos_academia c ON i.curso_id = c.id
WHERE i.estado_inscripcion = 'aprobado' AND i.calificacion_final >= 90.00
ORDER BY i.calificacion_final DESC;