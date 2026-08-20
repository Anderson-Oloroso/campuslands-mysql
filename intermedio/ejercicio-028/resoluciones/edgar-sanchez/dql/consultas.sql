-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT 
    c.curso_id,
    c.codigo_curso,
    c.nombre_curso,
    c.nivel,
    COUNT(DISTINCT mc.estudiante_id) AS total_estudiantes_matriculados,
    SUM(CASE WHEN mc.estado_matricula = 'Activo' THEN 1 ELSE 0 END) AS estudiantes_activos,
    COALESCE(SUM(mc.monto_pagado_usd), 0.00) AS ingresos_totales_usd
FROM cursos c
LEFT JOIN matriculas_cursos mc ON c.curso_id = mc.curso_id
GROUP BY c.curso_id, c.codigo_curso, c.nombre_curso, c.nivel
ORDER BY ingresos_totales_usd DESC;

SELECT 
    e.estudiante_id,
    e.nombre_estudiante,
    e.correo,
    COUNT(mc.curso_id) AS total_cursos_inscritos,
    GROUP_CONCAT(DISTINCT c.nombre_curso ORDER BY c.nombre_curso ASC SEPARATOR '; ') AS cursos_matriculados,
    COALESCE(SUM(mc.monto_pagado_usd), 0.00) AS total_invertido_usd
FROM estudiantes e
INNER JOIN matriculas_cursos mc ON e.estudiante_id = mc.estudiante_id
INNER JOIN cursos c ON mc.curso_id = c.curso_id
GROUP BY e.estudiante_id, e.nombre_estudiante, e.correo
HAVING total_cursos_inscritos >= 2
ORDER BY total_invertido_usd DESC;