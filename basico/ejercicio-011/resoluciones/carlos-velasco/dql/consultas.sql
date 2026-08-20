-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    nombre,
    edad,
    categoria,
    ranking,
    estado
FROM jugadores;

SELECT
    nombre,
    categoria,
    ranking
FROM jugadores
WHERE estado='Activo';

SELECT
    nombre,
    ranking
FROM jugadores
ORDER BY ranking ASC;

SELECT
    categoria,
    COUNT(*) AS total_jugadores
FROM jugadores
GROUP BY categoria;

SELECT
    nombre,
    edad
FROM jugadores
WHERE edad>=18;

DESCRIBE jugadores;