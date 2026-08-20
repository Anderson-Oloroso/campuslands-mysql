-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_012;

SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM basico_ejercicio_012
GROUP BY categoria
ORDER BY promedio DESC;

SELECT * FROM basico_ejercicio_012
WHERE tiempo_reproduccion > 4.0;

SELECT c.nombre, a.nombre AS nombre_artista
FROM basico_ejercicio_012 b
JOIN categorias_12 c ON b.id_categoria = c.id
JOIN artistas a ON b.id_artista = a.id;