-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_014;

SELECT nombre, creado_en 
FROM basico_ejercicio_014
WHERE creado_en >= '1500-12-30'
ORDER BY nombre, creado_en;