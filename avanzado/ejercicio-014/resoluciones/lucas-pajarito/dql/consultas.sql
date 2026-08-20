-- ============================================================
-- ACTIVAR EVENT SCHEDULER
-- ============================================================

SET GLOBAL event_scheduler = ON;

-- ============================================================
-- CREACION DEL EVENTO
-- ============================================================
-- El evento se ejecuta diariamente.
-- Registra en el historial cuantos registros activos existen.

CREATE EVENT evento_revision_saga_014
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
INSERT INTO historial_eventos_014
(cantidad_registros, descripcion)
SELECT
    COUNT(*),
    'Revision automatica de registros activos de la saga'
FROM intermedio_ejercicio_014
WHERE estado = 'activo';

-- ============================================================
-- CONSULTAS DE VERIFICACION
-- ============================================================

-- 1. Consultar todos los registros de la tabla principal

SELECT
    id,
    nombre,
    categoria,
    puntaje,
    estado,
    creado_en
FROM intermedio_ejercicio_014
ORDER BY id;

-- 2. Consultar solamente registros activos

SELECT
    id,
    nombre,
    categoria,
    puntaje,
    estado
FROM intermedio_ejercicio_014
WHERE estado = 'activo'
ORDER BY puntaje DESC;

-- 3. Consultar registros en revision

SELECT
    id,
    nombre,
    categoria,
    puntaje,
    estado
FROM intermedio_ejercicio_014
WHERE estado = 'revision'
ORDER BY puntaje DESC;

-- 4. Consultar cantidad de registros por estado

SELECT
    estado,
    COUNT(*) AS cantidad
FROM intermedio_ejercicio_014
GROUP BY estado
ORDER BY cantidad DESC;

-- 5. Consultar promedio de puntaje

SELECT
    ROUND(AVG(puntaje), 2) AS promedio_puntaje
FROM intermedio_ejercicio_014;

-- 6. Consultar eventos existentes

SHOW EVENTS
FROM campuslands_mysql;

-- 7. Consultar informacion especifica del evento

SELECT
    EVENT_NAME,
    EVENT_TYPE,
    STATUS,
    EXECUTE_AT,
    INTERVAL_VALUE,
    INTERVAL_FIELD
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'campuslands_mysql'
AND EVENT_NAME = 'evento_revision_saga_014';

