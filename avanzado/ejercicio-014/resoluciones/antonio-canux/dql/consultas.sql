-- Consultas analiticas demostrando la administracion del Event Scheduler.
USE campuslands_mysql;

SHOW VARIABLES LIKE 'event_scheduler';

SHOW EVENTS FROM campuslands_mysql;

SELECT nave, faccion, estado, nivel_escudos 
    FROM avanzado_ejercicio_014_flota 
    ORDER BY nivel_escudos ASC;

SELECT EVENT_NAME, STATUS, EVENT_TYPE, INTERVAL_VALUE, INTERVAL_FIELD, EVENT_DEFINITION 
    FROM INFORMATION_SCHEMA.EVENTS 
    WHERE EVENT_SCHEMA = 'campuslands_mysql' AND EVENT_NAME = 'evt_avanz_014_recarga_escudos';

SELECT id, naves_operativas, naves_criticas, DATE_FORMAT(fecha_registro, '%Y-%m-%d %H:%i:%s') AS fecha_exacta 
    FROM avanzado_ejercicio_014_auditoria 
    ORDER BY fecha_registro DESC;