USE ejercicio_14_adv;

-- Verificar que el Event Scheduler esté habilitado
SHOW VARIABLES LIKE 'event_scheduler';

-- Habilitar el Event Scheduler
SET GLOBAL event_scheduler = ON;

-- =====================================================
-- Evento 1: Registrar misiones completadas antiguas
-- =====================================================

DELIMITER //

CREATE EVENT IF NOT EXISTS archive_completed_missions
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    INSERT INTO mission_logs (mission_id, log_message)
    SELECT
        mission_id,
        CONCAT(
            'Automatic review: mission ',
            mission_name,
            ' remains completed.'
        )
    FROM missions
    WHERE status = 'Completed'
      AND mission_date < CURRENT_DATE - INTERVAL 30 DAY;
END //

DELIMITER ;


-- =====================================================
-- Evento 2: Registrar un mensaje periódico del sistema
-- =====================================================

DELIMITER //

CREATE EVENT IF NOT EXISTS system_mission_report
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 DAY
DO
BEGIN
    INSERT INTO mission_logs (mission_id, log_message)
    SELECT
        mission_id,
        'Automatic system verification performed.'
    FROM missions
    WHERE mission_id = (
        SELECT MIN(mission_id)
        FROM missions
    );
END //

DELIMITER ;


-- =====================================================
-- Consultas de verificación
-- =====================================================

SHOW EVENTS;

SELECT
    log_id,
    mission_id,
    log_message,
    created_at
FROM mission_logs
ORDER BY created_at DESC;

-- Ver información específica de los eventos
SELECT
    EVENT_NAME,
    STATUS,
    EVENT_TYPE,
    INTERVAL_VALUE,
    INTERVAL_FIELD
FROM information_schema.EVENTS
WHERE EVENT_SCHEMA = 'sci_fi_saga_events';