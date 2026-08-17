USE campuslands_mysql;


-- ============================================================
-- CONSULTA 1
-- Listado general de misiones ordenadas por fecha de inicio.
-- ============================================================

SELECT
    id_mision,
    nombre,
    planeta_origen,
    comandante,
    nivel_riesgo,
    estado,
    fecha_inicio,
    fecha_fin
FROM misiones
ORDER BY fecha_inicio;


-- ============================================================
-- CONSULTA 2
-- Misiones activas agrupadas por nivel de riesgo.
-- ============================================================

SELECT
    nivel_riesgo,
    COUNT(*) AS total_misiones
FROM misiones
WHERE estado IN ('programada', 'en_curso')
GROUP BY nivel_riesgo
ORDER BY total_misiones DESC, nivel_riesgo;


-- ============================================================
-- CONSULTA 3
-- Misiones de mayor riesgo.
-- ============================================================

SELECT
    nombre,
    planeta_origen,
    comandante,
    nivel_riesgo,
    estado,
    fecha_fin
FROM misiones
WHERE nivel_riesgo IN ('alto', 'critico')
ORDER BY
    CASE nivel_riesgo
        WHEN 'critico' THEN 1
        WHEN 'alto' THEN 2
    END,
    fecha_fin;


-- ============================================================
-- CONSULTA 4
-- Misiones que ya deberian haber terminado.
--
-- Sirve para identificar registros que pueden ser procesados
-- por el Event Scheduler.
-- ============================================================

SELECT
    id_mision,
    nombre,
    estado,
    fecha_fin,
    TIMESTAMPDIFF(
        HOUR,
        fecha_fin,
        NOW()
    ) AS horas_desde_finalizacion
FROM misiones
WHERE fecha_fin <= NOW()
  AND estado IN ('programada', 'en_curso')
ORDER BY fecha_fin;


-- ============================================================
-- CONSULTA 5
-- Resumen de misiones por estado.
-- ============================================================

SELECT
    estado,
    COUNT(*) AS total_misiones,
    MIN(fecha_inicio) AS primera_mision,
    MAX(fecha_fin) AS ultima_fecha
FROM misiones
GROUP BY estado
ORDER BY total_misiones DESC;


-- ============================================================
-- CONSULTA 6
-- Duracion de cada mision en horas.
-- ============================================================

SELECT
    nombre,
    planeta_origen,
    nivel_riesgo,
    ROUND(
        TIMESTAMPDIFF(
            MINUTE,
            fecha_inicio,
            fecha_fin
        ) / 60,
        2
    ) AS duracion_horas
FROM misiones
ORDER BY duracion_horas DESC;


-- ============================================================
-- CONSULTA 7
-- Evidencia de las acciones realizadas por el Event Scheduler.
-- ============================================================

SELECT
    b.id_bitacora,
    m.nombre AS mision,
    m.estado,
    b.accion,
    b.fecha_ejecucion
FROM bitacora_eventos AS b
INNER JOIN misiones AS m
    ON m.id_mision = b.id_mision
ORDER BY b.fecha_ejecucion DESC;