-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

CREATE EVENT evt_auditoria_sagas_inactivas
ON SCHEDULE EVERY 1 MINUTE
DO
INSERT INTO BitacoraMantenimiento (saga_id, accion)
SELECT saga_id, 'Verificacion de Estado: Inactiva'
FROM Sagas
WHERE estatus = 'Inactiva';

CREATE EVENT evt_limpieza_bitacora
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
DELETE FROM BitacoraMantenimiento
WHERE fecha_ejecucion < NOW() - INTERVAL 30 DAY;

SELECT * FROM Sagas;

SELECT * FROM BitacoraMantenimiento;