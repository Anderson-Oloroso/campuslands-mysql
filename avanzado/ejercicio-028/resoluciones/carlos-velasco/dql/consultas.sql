-- ============================================================
-- Ejercicio 028 - Consultas JSON
-- ============================================================

USE campuslands_mysql;


-- ============================================================
-- Consulta 1
-- Listar estudiantes activos mostrando información extraída
-- desde el documento JSON.
-- ============================================================

SELECT
    id_estudiante,
    nombre,
    JSON_UNQUOTE(JSON_EXTRACT(datos_academicos, '$.nivel')) AS nivel,
    JSON_UNQUOTE(JSON_EXTRACT(datos_academicos, '$.modalidad')) AS modalidad,
    JSON_EXTRACT(datos_academicos, '$.promedio') AS promedio
FROM estudiantes
WHERE estado = 'activo'
ORDER BY promedio DESC;


-- ============================================================
-- Consulta 2
-- Obtener estudiantes con promedio igual o superior a 4.5.
-- ============================================================

SELECT
    nombre,
    correo,
    datos_academicos ->> '$.nivel' AS nivel,
    datos_academicos ->> '$.promedio' AS promedio
FROM estudiantes
WHERE CAST(
    datos_academicos ->> '$.promedio'
    AS DECIMAL(3,1)
) >= 4.5
ORDER BY promedio DESC;


-- ============================================================
-- Consulta 3
-- Buscar estudiantes que utilizan MySQL.
-- ============================================================

SELECT
    id_estudiante,
    nombre,
    correo,
    datos_academicos ->> '$.nivel' AS nivel,
    datos_academicos ->> '$.tecnologias' AS tecnologias
FROM estudiantes
WHERE JSON_CONTAINS(
    datos_academicos -> '$.tecnologias',
    JSON_QUOTE('MySQL')
);


-- ============================================================
-- Consulta 4
-- Contar cuantas tecnologias conoce cada estudiante.
-- ============================================================

SELECT
    nombre,
    datos_academicos ->> '$.nivel' AS nivel,
    JSON_LENGTH(
        datos_academicos -> '$.tecnologias'
    ) AS cantidad_tecnologias
FROM estudiantes
ORDER BY cantidad_tecnologias DESC, nombre;


-- ============================================================
-- Consulta 5
-- Obtener el promedio general de los estudiantes activos.
-- ============================================================

SELECT
    COUNT(*) AS total_estudiantes,
    ROUND(
        AVG(
            CAST(
                datos_academicos ->> '$.promedio'
                AS DECIMAL(3,1)
            )
        ),
        2
    ) AS promedio_general
FROM estudiantes
WHERE estado = 'activo';


-- ============================================================
-- Consulta 6
-- Contar estudiantes activos agrupados por nivel academico.
-- ============================================================

SELECT
    datos_academicos ->> '$.nivel' AS nivel,
    COUNT(*) AS total_estudiantes,
    ROUND(
        AVG(
            CAST(
                datos_academicos ->> '$.promedio'
                AS DECIMAL(3,1)
            )
        ),
        2
    ) AS promedio_nivel
FROM estudiantes
WHERE estado = 'activo'
GROUP BY datos_academicos ->> '$.nivel'
ORDER BY promedio_nivel DESC;


-- ============================================================
-- Consulta 7
-- Mostrar un resumen JSON de cada estudiante.
-- ============================================================

SELECT
    nombre,
    JSON_OBJECT(
        'nivel', datos_academicos ->> '$.nivel',
        'promedio', datos_academicos ->> '$.promedio',
        'modalidad', datos_academicos ->> '$.modalidad'
    ) AS resumen_academico
FROM estudiantes
ORDER BY nombre;