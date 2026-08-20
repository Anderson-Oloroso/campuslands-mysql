-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

DELETE FROM trabajos_soldadura 
WHERE id_trabajo = 2;

DELETE FROM trabajos_soldadura 
WHERE defectuosa = TRUE AND estado_inspeccion = 'Rechazado';
