-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM battle_royale;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM battle_royale
GROUP BY categoria
ORDER BY promedio DESC;