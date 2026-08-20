USE campuslands_mysql;

-- 1. Reporte de Estudiantes Multi-Bootcamp (Consulta sobre Tabla Puente 'matriculas_bootcamp')
SELECT 
    e.id AS estudiante_id,
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    e.email,
    COUNT(mb.bootcamp_id) AS total_bootcamps_inscritos,
    GROUP_CONCAT(b.nombre_bootcamp SEPARATOR ' | ') AS bootcamps_enrolados,
    ROUND(AVG(mb.porcentaje_asistencia), 2) AS asistencia_promedio
FROM estudiantes e
INNER JOIN matriculas_bootcamp mb ON e.id = mb.estudiante_id
INNER JOIN bootcamps b ON mb.bootcamp_id = b.id
GROUP BY e.id, e.nombre, e.apellido, e.email
HAVING total_bootcamps_inscritos >= 1
ORDER BY total_bootcamps_inscritos DESC, asistencia_promedio DESC;

-- 2. Rendimiento Académico: Promedio de Calificaciones por Bootcamp usando las Tablas Puente
SELECT 
    b.nombre_bootcamp,
    b.nivel,
    COUNT(DISTINCT ep.estudiante_id) AS estudiantes_con_entregas,
    COUNT(ep.id) AS total_proyectos_evaluados,
    ROUND(AVG(ep.calificacion), 2) AS promedio_general_bootcamp,
    MAX(ep.calificacion) AS nota_maxima,
    MIN(ep.calificacion) AS nota_minima
FROM bootcamps b
INNER JOIN modulos m ON b.id = m.bootcamp_id
INNER JOIN proyectos p ON m.id = p.modulo_id
INNER JOIN entregas_proyectos ep ON p.id = ep.proyecto_id
WHERE ep.estado_entrega = 'Calificado'
GROUP BY b.id, b.nombre_bootcamp, b.nivel
ORDER BY promedio_general_bootcamp DESC;

-- 3. Carga Horaria y Costo Incurridos por Mentoría (Relación Mentores M:N Módulos)
SELECT 
    CONCAT(m.nombre, ' ', m.apellido) AS mentor,
    m.especialidad,
    COUNT(am.modulo_id) AS modulos_asignados,
    SUM(am.horas_asignadas) AS total_horas_docencia,
    m.tarifa_hora,
    (SUM(am.horas_asignadas) * m.tarifa_hora) AS costo_total_mentoria
FROM mentores m
INNER JOIN asignacion_mentores am ON m.id = am.mentor_id
GROUP BY m.id, m.nombre, m.apellido, m.especialidad, m.tarifa_hora
ORDER BY costo_total_mentoria DESC;

-- 4. Kpi de Calificaciones de Proyectos por Estudiante (Detalle de entregas)
SELECT 
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    p.titulo_proyecto,
    m.nombre_modulo,
    b.nombre_bootcamp,
    ep.calificacion,
    ep.estado_entrega,
    DATE_FORMAT(ep.fecha_entrega, '%Y-%m-%d %H:%i') AS fecha_hora_entrega
FROM entregas_proyectos ep
INNER JOIN estudiantes e ON ep.estudiante_id = e.id
INNER JOIN proyectos p ON ep.proyecto_id = p.id
INNER JOIN modulos m ON p.modulo_id = m.id
INNER JOIN bootcamps b ON m.bootcamp_id = b.id
ORDER BY ep.calificacion DESC;

-- 5. Ranking Top 3 Estudiantes con Mayor Calificación Promedio Global
SELECT 
    CONCAT(e.nombre, ' ', e.apellido) AS estudiante,
    e.email,
    e.estado,
    COUNT(ep.id) AS proyectos_entregados,
    ROUND(AVG(ep.calificacion), 2) AS promedio_global
FROM estudiantes e
INNER JOIN entregas_proyectos ep ON e.id = ep.estudiante_id
WHERE ep.estado_entrega = 'Calificado'
GROUP BY e.id, e.nombre, e.apellido, e.email, e.estado
ORDER BY promedio_global DESC
LIMIT 3;