USE campuslands_mysql;

-- 1. Mostrar los datos principales junto con información
-- extraída del documento JSON.
SELECT
    id_estudiante,
    nombre,
    email,
    estado,
    perfil_academico->>'$.nivel' AS nivel,
    perfil_academico->>'$.ciudad' AS ciudad,
    perfil_academico->>'$.curso_actual' AS curso_actual
FROM estudiantes
ORDER BY nombre;


-- 2. Obtener estudiantes cuyo promedio académico
-- sea superior a 90.
SELECT
    nombre,
    CAST(
        perfil_academico->>'$.promedio'
        AS DECIMAL(5,2)
    ) AS promedio
FROM estudiantes
WHERE CAST(
    perfil_academico->>'$.promedio'
    AS DECIMAL(5,2)
) > 90
ORDER BY promedio DESC;


-- 3. Contar estudiantes activos por nivel académico.
SELECT
    perfil_academico->>'$.nivel' AS nivel,
    COUNT(*) AS total_estudiantes
FROM estudiantes
WHERE estado = 'activo'
GROUP BY perfil_academico->>'$.nivel'
ORDER BY total_estudiantes DESC;


-- 4. Buscar estudiantes de Ciudad de Guatemala
-- utilizando un valor almacenado dentro del JSON.
SELECT
    nombre,
    email,
    perfil_academico->>'$.ciudad' AS ciudad,
    perfil_academico->>'$.curso_actual' AS curso_actual
FROM estudiantes
WHERE perfil_academico->>'$.ciudad' = 'Ciudad de Guatemala'
ORDER BY nombre;


-- 5. Mostrar estudiantes que poseen MySQL entre sus habilidades.
SELECT
    nombre,
    perfil_academico->>'$.nivel' AS nivel,
    perfil_academico->>'$.habilidades' AS habilidades
FROM estudiantes
WHERE JSON_CONTAINS(
    perfil_academico->'$.habilidades',
    '"MySQL"'
)
ORDER BY nombre;


-- 6. Ranking de estudiantes según su promedio académico.
SELECT
    nombre,
    perfil_academico->>'$.nivel' AS nivel,
    CAST(
        perfil_academico->>'$.promedio'
        AS DECIMAL(5,2)
    ) AS promedio,
    RANK() OVER (
        ORDER BY CAST(
            perfil_academico->>'$.promedio'
            AS DECIMAL(5,2)
        ) DESC
    ) AS posicion
FROM estudiantes
WHERE estado = 'activo'
ORDER BY posicion;


-- 7. Obtener el promedio académico general de los
-- estudiantes activos.
SELECT
    ROUND(
        AVG(
            CAST(
                perfil_academico->>'$.promedio'
                AS DECIMAL(5,2)
            )
        ),
        2
    ) AS promedio_general
FROM estudiantes
WHERE estado = 'activo';