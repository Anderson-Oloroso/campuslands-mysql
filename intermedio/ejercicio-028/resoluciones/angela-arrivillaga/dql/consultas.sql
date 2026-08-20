use academia_tech_db;

-- lista detallada de estudiantes inscritos en cursos con su respectivo estado
select e.nombre_completo, c.nombre_curso, ic.fecha_inscripcion, ic.estado_inscripcion
from estudiantes_cursos ic
join estudiantes e on ic.id_estudiante = e.id_estudiante
join cursos c on ic.id_curso = c.id_curso
order by e.nombre_completo asc;

-- reporte de calificaciones finales de estudiantes aprobados en cursos de la academia
select e.nombre_completo, c.nombre_curso, ic.calificacion_final
from estudiantes_cursos ic
join estudiantes e on ic.id_estudiante = e.id_estudiante
join cursos c on ic.id_curso = c.id_curso
where ic.estado_inscripcion = 'aprobado'
order by ic.calificacion_final desc;

-- promedio general de calificaciones y total de inscripciones agrupadas por curso
select 
    c.nombre_curso,
    count(ic.id_estudiante) as total_inscritos,
    round(avg(ic.calificacion_final), 2) as promedio_calificacion
from cursos c
left join estudiantes_cursos ic on c.id_curso = ic.id_curso
group by c.id_curso, c.nombre_curso
order by total_inscritos desc;

-- listado de estudiantes que tienen inscripciones activas cursando actualmente
select e.nombre_completo, c.nombre_curso, ic.fecha_inscripcion
from estudiantes_cursos ic
join estudiantes e on ic.id_estudiante = e.id_estudiante
join cursos c on ic.id_curso = c.id_curso
where ic.estado_inscripcion = 'cursando'
order by ic.fecha_inscripcion asc;

-- resumen analitico del total de ingresos generados por cada curso segun sus inscripciones
select 
    c.nombre_curso,
    count(ic.id_inscripcion) as total_estudiantes_pagados,
    c.costo_curso,
    (count(ic.id_inscripcion) * c.costo_curso) as ingresos_totales
from cursos c
left join estudiantes_cursos ic on c.id_curso = ic.id_curso
group by c.id_curso, c.nombre_curso, c.costo_curso
order by ingresos_totales desc;