-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;


SELECT * FROM skins_shooter;

SELECT precio_puntos, COUNT(1) AS total_registros, AVG(puntaje) AS promedio
FROM skins_shooter
GROUP BY precio_puntos
ORDER BY promedio ASC;