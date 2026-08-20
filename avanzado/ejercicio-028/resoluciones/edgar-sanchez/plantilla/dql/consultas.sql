SELECT 
    p.estudiante_id,
    p.nombre_estudiante,
    p.correo,
    JSON_EXTRACT(p.preferencias_json, '$.modalidad') AS modalidad_extract,
    p.preferencias_json->>'$.modalidad' AS modalidad_unquote,
    p.preferencias_json->>'$.horario_preferido' AS horario_preferido,
    p.habilidades_json
FROM perfiles_estudiantes p
WHERE JSON_CONTAINS(p.habilidades_json, '"SQL"') = 1;

SELECT 
    c.curso_id,
    c.nombre_curso,
    i.nombre_completo AS instructor,
    c.temario_json->>'$.proyecto_final' AS proyecto_final,
    JSON_LENGTH(c.temario_json, '$.modulos') AS cantidad_modulos,
    m.titulo_modulo,
    m.duracion_horas
FROM cursos_tecnicos c
INNER JOIN instructores i ON c.instructor_id = i.instructor_id,
JSON_TABLE(
    c.temario_json,
    '$.modulos[*]' COLUMNS (
        titulo_modulo VARCHAR(100) PATH '$.titulo',
        duracion_horas INT PATH '$.duracion_horas'
    )
) AS m;

SELECT 
    m.matricula_id,
    e.nombre_estudiante,
    c.nombre_curso,
    m.estado,
    CAST(m.metadatos_evaluacion_json->>'$.calificacion_final' AS DECIMAL(5,2)) AS calificacion_final,
    CAST(m.metadatos_evaluacion_json->>'$.asistencia_porcentaje' AS DECIMAL(5,2)) AS porcentaje_asistencia,
    (m.metadatos_evaluacion_json->>'$.certificable') = 'true' AS es_certificable
FROM matriculas_cursos m
INNER JOIN perfiles_estudiantes e ON m.estudiante_id = e.estudiante_id
INNER JOIN cursos_tecnicos c ON m.curso_id = c.curso_id
WHERE m.metadatos_evaluacion_json IS NOT NULL
  AND CAST(m.metadatos_evaluacion_json->>'$.asistencia_porcentaje' AS DECIMAL(5,2)) >= 80.00;


  SELECT 
    i.instructor_id,
    i.nombre_completo,
    i.especialidad,
    i.contacto_json->>'$.telefono' AS telefono_contacto,
    COALESCE(i.contacto_json->>'$.github', i.contacto_json->>'$.linkedin') AS red_profesional
FROM instructores i;

SELECT 
    ep.entrega_id,
    p.nombre_estudiante,
    c.nombre_curso,
    ep.titulo_proyecto,
    ep.detalles_entrega_json->>'$.repositorio_url' AS repositorio,
    ep.detalles_entrega_json->>'$.commit_hash' AS commit_ref,
    ep.fecha_entrega
FROM entregas_proyectos ep
INNER JOIN matriculas_cursos m ON ep.matricula_id = m.matricula_id
INNER JOIN perfiles_estudiantes p ON m.estudiante_id = p.estudiante_id
INNER JOIN cursos_tecnicos c ON m.curso_id = c.curso_id
ORDER BY ep.fecha_entrega DESC;