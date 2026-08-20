USE campuslands_mysql;

-- 1. Extracción con inline path operator (->>) y filtro por atributo en JSON
SELECT 
    id,
    nombre,
    email,
    detalles_perfil->>'$.pais' AS pais,
    detalles_perfil->>'$.ingles' AS nivel_ingles,
    detalles_perfil->>'$.redes.github' AS usuario_github
FROM estudiantes
WHERE detalles_perfil->>'$.pais' = 'Guatemala';

-- 2. Búsqueda de elementos dentro de arrays JSON usando JSON_CONTAINS
SELECT 
    nombre,
    email,
    detalles_perfil->>'$.habilidades' AS lista_habilidades
FROM estudiantes
WHERE JSON_CONTAINS(detalles_perfil->'$.habilidades', '"SQL"');

-- 3. Extracción de valores numéricos anidados y ordenamiento
SELECT 
    e.nombre AS estudiante,
    b.titulo AS bootcamp,
    ep.nombre_proyecto,
    CAST(ep.metadatos_evaluacion->>'$.calificacion_final' AS UNSIGNED) AS nota_final,
    ep.metadatos_evaluacion->>'$.criterios.db_design' AS nota_diseno_bd,
    CASE 
        WHEN ep.metadatos_evaluacion->>'$.aprobado' = 'true' THEN 'Aprobado'
        ELSE 'Reprobado'
    END AS estado_entrega
FROM entregas_proyectos ep
JOIN estudiantes e ON ep.estudiante_id = e.id
JOIN bootcamps b ON ep.bootcamp_id = b.id
ORDER BY nota_final DESC;

-- 4. Construcción de respuestas JSON dinámicas (JSON_OBJECT y JSON_ARRAYAGG)
SELECT 
    b.titulo AS bootcamp,
    COUNT(ep.id) AS total_entregas,
    JSON_ARRAYAGG(
        JSON_OBJECT(
            'estudiante', e.nombre,
            'proyecto', ep.nombre_proyecto,
            'nota', CAST(ep.metadatos_evaluacion->>'$.calificacion_final' AS UNSIGNED)
        )
    ) AS resumen_entregas_json
FROM bootcamps b
JOIN entregas_proyectos ep ON b.id = ep.bootcamp_id
JOIN estudiantes e ON ep.estudiante_id = e.id
GROUP BY b.id, b.titulo;

-- 5. Mapeo de Arrays JSON a filas de tabla relacional usando JSON_TABLE
SELECT 
    b.titulo AS bootcamp,
    malla.modulo_nombre,
    malla.posicion + 1 AS numero_modulo
FROM bootcamps b,
JSON_TABLE(
    b.malla_curricular,
    '$.modulos[*]' COLUMNS (
        posicion FOR ORDINALITY,
        modulo_nombre VARCHAR(100) PATH '$'
    )
) AS malla;