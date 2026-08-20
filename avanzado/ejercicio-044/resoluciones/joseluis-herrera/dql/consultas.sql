USE campuslands_mysql;

SELECT
    id_mision,
    nombre,
    categoria,
    nivel,
    puntaje,
    estado,
    fecha_inicio,
    fecha_fin
FROM misiones
WHERE estado = 'activa'
ORDER BY fecha_fin ASC;

SELECT
    categoria,
    COUNT(*) AS total_misiones,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio,
    MAX(puntaje) AS puntaje_maximo
FROM misiones
GROUP BY categoria
ORDER BY puntaje_promedio DESC;

SELECT
    id_mision,
    nombre,
    categoria,
    nivel,
    puntaje
FROM misiones
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    nombre,
    categoria,
    nivel,
    puntaje,
    estado
FROM misiones
WHERE nivel >= 8
  AND puntaje >= 90
ORDER BY puntaje DESC;

SELECT
    estado,
    COUNT(*) AS total_misiones,
    ROUND(AVG(puntaje), 2) AS puntaje_promedio
FROM misiones
GROUP BY estado
ORDER BY total_misiones DESC;

SELECT
    nombre,
    categoria,
    puntaje
FROM misiones
WHERE puntaje > (
    SELECT AVG(puntaje)
    FROM misiones
)
ORDER BY puntaje DESC;

SELECT
    EVENT_NAME AS evento,
    STATUS AS estado_evento,
    EVENT_TYPE AS tipo_evento,
    INTERVAL_VALUE AS intervalo,
    INTERVAL_FIELD AS unidad
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql'
  AND EVENT_NAME = 'actualizar_estado_misiones';

SELECT
    id_bitacora,
    nombre_evento,
    fecha_ejecucion,
    misiones_actualizadas
FROM bitacora_eventos
ORDER BY fecha_ejecucion DESC;