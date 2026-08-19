USE campuslands_mysql;

SELECT
    nombre AS curso,
    nivel,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.instructor')) AS instructor,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.modalidad')) AS modalidad,
    JSON_EXTRACT(informacion, '$.duracion_horas') AS duracion_horas
FROM cursos_academia
ORDER BY nombre;


SELECT
    nombre AS curso,
    categoria,
    nivel,
    precio,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.modalidad')) AS modalidad
FROM cursos_academia
WHERE estado = 'activo'
  AND JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.modalidad')) = 'virtual'
ORDER BY precio ASC;

SELECT
    nombre AS curso,
    categoria,
    nivel,
    JSON_UNQUOTE(JSON_EXTRACT(informacion, '$.instructor')) AS instructor
FROM cursos_academia
WHERE JSON_CONTAINS(
    JSON_EXTRACT(informacion, '$.tecnologias'),
    '"JavaScript"'
)
ORDER BY nivel, nombre;