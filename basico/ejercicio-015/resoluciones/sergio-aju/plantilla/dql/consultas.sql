-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_015;

SELECT j.titulo, p.nombre AS plataforma, j.precio 
FROM juegos j
INNER JOIN plataformas p ON j.plataforma_id = p.id
ORDER BY j.precio DESC 
LIMIT 3;

SELECT j.titulo, p.nombre AS plataforma, j.genero, j.precio 
FROM juegos j
INNER JOIN plataformas p ON j.plataforma_id = p.id;