-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;


SELECT * FROM jugadores_esport;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM jugadores_esports
GROUP BY categoria
ORDER BY promedio DESC;
