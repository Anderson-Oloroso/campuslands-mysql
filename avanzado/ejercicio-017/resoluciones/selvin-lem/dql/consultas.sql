-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_017;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM avanzado_ejercicio_017
GROUP BY categoria
ORDER BY promedio DESC;