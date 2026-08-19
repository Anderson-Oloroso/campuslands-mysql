use academia_tech_json_db;

-- 1. consulta utilizando el operador de extraccion json (->) para filtrar evaluaciones con puntaje alto y mostrar preferencias de editor y tema
select 
    e.nombre_completo,
    ev.titulo_modulo,
    ev.puntaje_final,
    ev.configuracion_json ->> '$.editor' as editor_preferido,
    ev.configuracion_json ->> '$.tema' as tema_visual
from evaluaciones_estudiantes ev
join estudiantes e on ev.id_estudiante = e.id_estudiante
where ev.puntaje_final >= 90.00
order by ev.puntaje_final desc;

-- 2. consulta utilizando json_extract para obtener configuraciones especificas del sistema operativo de los estudiantes
select 
    e.nombre_completo,
    json_unquote(json_extract(ev.configuracion_json, '$.sistema')) as sistema_operativo,
    json_unquote(json_extract(ev.configuracion_json, '$.notificaciones')) as acepta_notificaciones
from evaluaciones_estudiantes ev
join estudiantes e on ev.id_estudiante = e.id_estudiante
order by sistema_operativo asc;

-- 3. consulta utilizando json_contains para buscar estudiantes que incluyan la habilidad especifica 'mysql' dentro de su campo competencias_json
select 
    e.nombre_completo,
    e.correo,
    ev.titulo_modulo,
    ev.puntaje_final
from evaluaciones_estudiantes ev
join estudiantes e on ev.id_estudiante = e.id_estudiante
where json_contains(ev.competencias_json, '"mysql"', '$[*].habilidad')
order by ev.puntaje_final desc;

-- 4. consulta utilizando json_length para auditar la cantidad de competencias registradas en el perfil json de cada evaluacion
select 
    e.nombre_completo,
    ev.titulo_modulo,
    json_length(ev.competencias_json) as total_competencias_registradas,
    ev.puntaje_final
from evaluaciones_estudiantes ev
join estudiantes e on ev.id_estudiante = e.id_estudiante
order by total_competencias_registradas desc, ev.puntaje_final desc;

-- 5. consulta resumen agrupada por ruta de aprendizaje mostrando el promedio de puntaje y extrayendo el tema visual mas comun desde el json de configuracion
select 
    r.nombre_ruta,
    r.nivel_dificultad,
    count(ev.id_evaluacion) as total_evaluaciones,
    round(avg(ev.puntaje_final), 2) as promedio_puntaje_ruta
from evaluaciones_estudiantes ev
join estudiantes e on ev.id_estudiante = e.id_estudiante
join rutas_aprendizaje r on e.id_ruta = r.id_ruta
group by r.id_ruta, r.nombre_ruta, r.nivel_dificultad
order by promedio_puntaje_ruta desc;