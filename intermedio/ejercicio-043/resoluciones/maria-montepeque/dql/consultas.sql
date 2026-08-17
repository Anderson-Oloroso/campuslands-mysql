USE campuslands_mysql;

-- 1. Actores en "El Legado Maldito"
SELECT a.nombre, r.personaje, r.papel_principal
FROM reparto_intermedio r
INNER JOIN actores_intermedio a ON a.id_actor = r.id_actor
INNER JOIN peliculas_intermedio p ON p.id_pelicula = r.id_pelicula
WHERE p.titulo = 'El Legado Maldito';

-- 2. Peliculas en las que actua Elena Vidal
SELECT p.titulo, p.subgenero, r.personaje
FROM reparto_intermedio r
INNER JOIN peliculas_intermedio p ON p.id_pelicula = r.id_pelicula
INNER JOIN actores_intermedio a ON a.id_actor = r.id_actor
WHERE a.nombre = 'Elena Vidal';

-- 3. Cantidad de actores por pelicula
SELECT p.titulo, COUNT(*) AS total_actores
FROM reparto_intermedio r
INNER JOIN peliculas_intermedio p ON p.id_pelicula = r.id_pelicula
GROUP BY p.titulo
ORDER BY total_actores DESC;

-- 4. Cantidad de peliculas por actor
SELECT a.nombre, COUNT(*) AS total_peliculas
FROM reparto_intermedio r
INNER JOIN actores_intermedio a ON a.id_actor = r.id_actor
GROUP BY a.nombre
ORDER BY total_peliculas DESC;

-- 5. Actores que han actuado en mas de 2 peliculas (GROUP BY + HAVING)
SELECT a.nombre, COUNT(*) AS total_peliculas
FROM reparto_intermedio r
INNER JOIN actores_intermedio a ON a.id_actor = r.id_actor
GROUP BY a.nombre
HAVING COUNT(*) > 2;

-- 6. Papeles principales de todo el catalogo
SELECT p.titulo, a.nombre, r.personaje
FROM reparto_intermedio r
INNER JOIN peliculas_intermedio p ON p.id_pelicula = r.id_pelicula
INNER JOIN actores_intermedio a ON a.id_actor = r.id_actor
WHERE r.papel_principal = TRUE
ORDER BY p.titulo;
