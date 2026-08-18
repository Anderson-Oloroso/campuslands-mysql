USE campuslands_mysql;

SELECT
    nombre AS estudiante,
    JSON_UNQUOTE(JSON_EXTRACT(perfil_json, '$.nivel')) AS nivel,
    JSON_UNQUOTE(JSON_EXTRACT(perfil_json, '$.modalidad')) AS modalidad,
    JSON_EXTRACT(perfil_json, '$.horas_estudio') AS horas_estudio
FROM estudiantes
WHERE estado = 'activo'
ORDER BY horas_estudio DESC;

SELECT
    nombre AS estudiante,
    JSON_EXTRACT(perfil_json, '$.tecnologias') AS tecnologias
FROM estudiantes
WHERE JSON_CONTAINS(
    perfil_json,
    '"SQL"',
    '$.tecnologias'
)
ORDER BY estudiante;


SELECT
    AVG(
        CAST(
            JSON_UNQUOTE(
                JSON_EXTRACT(perfil_json, '$.horas_estudio')
            ) AS DECIMAL(5,2)
        )
    ) AS promedio_horas_estudio
FROM estudiantes
WHERE estado = 'activo';


SELECT
    nombre AS estudiante,
    JSON_LENGTH(
        JSON_EXTRACT(perfil_json, '$.tecnologias')
    ) AS total_tecnologias
FROM estudiantes
WHERE estado = 'activo'
ORDER BY total_tecnologias DESC, estudiante;

SELECT
    tecnologia,
    COUNT(*) AS total_estudiantes
FROM estudiantes e
JOIN JSON_TABLE(
    e.perfil_json,
    '$.tecnologias[*]'
    COLUMNS (
        tecnologia VARCHAR(50) PATH '$'
    )
) AS tecnologias_json
WHERE e.estado = 'activo'
GROUP BY tecnologia
ORDER BY total_estudiantes DESC, tecnologia;

SELECT
    nombre AS estudiante,
    JSON_UNQUOTE(JSON_EXTRACT(perfil_json, '$.nivel')) AS nivel,
    JSON_EXTRACT(perfil_json, '$.horas_estudio') AS horas_estudio
FROM estudiantes
WHERE JSON_UNQUOTE(
          JSON_EXTRACT(perfil_json, '$.nivel')
      ) = 'avanzado'
  AND CAST(
        JSON_UNQUOTE(
            JSON_EXTRACT(perfil_json, '$.horas_estudio')
        ) AS UNSIGNED
      ) >= 25
ORDER BY horas_estudio DESC;