-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

START TRANSACTION;


SELECT nombre, puntaje FROM jugadores_esports WHERE estado = 'activo';

SELECT COUNT(*) FROM jugadores_esports;

COMMIT;