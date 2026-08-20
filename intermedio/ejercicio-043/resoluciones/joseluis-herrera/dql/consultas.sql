USE campuslands_mysql;

SELECT
    p.titulo AS pelicula,
    a.nombre AS actor,
    pa.personaje
FROM pelicula_actor pa
INNER JOIN peliculas p
    ON pa.id_pelicula = p.id_pelicula
INNER JOIN actores a
    ON pa.id_actor = a.id_actor
ORDER BY p.titulo, a.nombre;

SELECT
    p.titulo AS pelicula,
    COUNT(pa.id_actor) AS total_actores
FROM peliculas p
INNER JOIN pelicula_actor pa
    ON p.id_pelicula = pa.id_pelicula
GROUP BY p.id_pelicula, p.titulo
ORDER BY total_actores DESC, pelicula;

SELECT
    a.nombre AS actor,
    COUNT(pa.id_pelicula) AS peliculas_participadas
FROM actores a
INNER JOIN pelicula_actor pa
    ON a.id_actor = pa.id_actor
GROUP BY a.id_actor, a.nombre
ORDER BY peliculas_participadas DESC, actor;

SELECT
    p.titulo AS pelicula,
    p.subgenero AS genero,
    a.nombre AS actor,
    pa.personaje
FROM peliculas p
INNER JOIN pelicula_actor pa
    ON p.id_pelicula = pa.id_pelicula
INNER JOIN actores a
    ON pa.id_actor = a.id_actor
WHERE p.estado = 'disponible'
ORDER BY p.titulo, a.nombre;