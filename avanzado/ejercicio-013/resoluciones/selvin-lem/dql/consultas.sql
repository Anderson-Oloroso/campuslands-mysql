-- Ejercicio 013 (Intermedio) - tablas puente para catalogo de peliculas de miedo
-- Ejecutar despues de inserts.sql

USE campuslands_mysql;

-- 1. Listado de peliculas con sus actores y personajes
SELECT p.titulo, a.nombre_actor, r.personaje
FROM reparto_pelicula_actor r
INNER JOIN peliculs_miedo p ON r.id_pelicula = p.id_pelicula
INNER JOIN actores_miedo a ON r.id_actor = a.id_actor
ORDER BY p.titulo, a.nombre_actor;

-- 2. Actores que participan en mas de una pelicula
SELECT a.nombre_actor, COUNT(*) AS total_peliculas
FROM reparto_pelicula_actor r
INNER JOIN actores_miedo a ON r.id_actor = a.id_actor
GROUP BY a.nombre_actor
HAVING COUNT(*) > 1
ORDER BY total_peliculas DESC;

-- 3. Cantidad de actores por pelicula
SELECT p.titulo, COUNT(r.id_actor) AS total_actores
FROM peliculs_miedo p
LEFT JOIN reparto_pelicula_actor r ON p.id_pelicula = r.id_pelicula
GROUP BY p.titulo
ORDER BY total_actores DESC;

-- 4. Peliculas en las que participa un actor especifico (Renata Solano)
SELECT p.titulo, r.personaje
FROM reparto_pelicula_actor r
INNER JOIN peliculs_miedo p ON r.id_pelicula = p.id_pelicula
INNER JOIN actores_miedo a ON r.id_actor = a.id_actor
WHERE a.nombre_actor = 'Renata Solano';

-- 5. Personajes interpretados en una pelicula especifica (Mente Fragmentada)
SELECT a.nombre_actor, r.personaje
FROM reparto_pelicula_actor r
INNER JOIN actores_miedo a ON r.id_actor = a.id_actor
INNER JOIN peliculs_miedo p ON r.id_pelicula = p.id_pelicula
WHERE p.titulo = 'Mente Fragmentada';
