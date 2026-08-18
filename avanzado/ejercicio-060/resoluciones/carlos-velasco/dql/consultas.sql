USE campuslands_mysql;

-- Consulta 1:
-- Integrantes activos de Twitch.
SELECT
    id_integrante,
    nombre,
    usuario_streaming,
    plataforma,
    rol,
    seguidores
FROM equipo_streaming
WHERE plataforma = 'Twitch'
  AND estado = 'activo'
ORDER BY seguidores DESC;


-- Consulta 2:
-- Top 5 integrantes con mayor cantidad de seguidores.
SELECT
    nombre,
    usuario_streaming,
    plataforma,
    seguidores
FROM equipo_streaming
ORDER BY seguidores DESC
LIMIT 5;


-- Consulta 3:
-- Cantidad de integrantes activos por plataforma.
SELECT
    plataforma,
    COUNT(*) AS total_integrantes
FROM equipo_streaming
WHERE estado = 'activo'
GROUP BY plataforma
ORDER BY total_integrantes DESC;


-- Consulta 4:
-- Promedio de horas de streaming por rol.
SELECT
    rol,
    COUNT(*) AS total_integrantes,
    ROUND(AVG(horas_stream_mes), 2) AS promedio_horas_mes
FROM equipo_streaming
GROUP BY rol
ORDER BY promedio_horas_mes DESC;


-- Consulta 5:
-- Plataformas cuyos integrantes activos superan en promedio
-- las 45 horas de streaming mensuales.
SELECT
    plataforma,
    COUNT(*) AS total_integrantes,
    ROUND(AVG(horas_stream_mes), 2) AS promedio_horas_mes
FROM equipo_streaming
WHERE estado = 'activo'
GROUP BY plataforma
HAVING AVG(horas_stream_mes) > 45
ORDER BY promedio_horas_mes DESC;


-- Consulta 6:
-- Analisis del plan de ejecucion para una consulta optimizada
-- mediante el indice compuesto plataforma + estado.
EXPLAIN
SELECT
    id_integrante,
    nombre,
    usuario_streaming,
    plataforma,
    rol,
    seguidores
FROM equipo_streaming
WHERE plataforma = 'Twitch'
  AND estado = 'activo';


-- Consulta 7:
-- Analisis del plan de ejecucion para ordenar por seguidores.
EXPLAIN
SELECT
    nombre,
    usuario_streaming,
    plataforma,
    seguidores
FROM equipo_streaming
ORDER BY seguidores DESC
LIMIT 5;


-- Consulta 8:
-- Analisis del plan de ejecucion para filtrar por rol.
EXPLAIN
SELECT
    nombre,
    usuario_streaming,
    rol,
    estado
FROM equipo_streaming
WHERE rol = 'streamer'
  AND estado = 'activo';