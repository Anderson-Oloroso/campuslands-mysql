-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

UPDATE renderizados_arquitectura 
SET estado = 'Aprobado' 
WHERE id_render = 3;

UPDATE renderizados_arquitectura 
SET resolucion = '4K', 
    precio = precio * 1.20 
WHERE motor_render = 'V-Ray' AND estado = 'Borrador';
