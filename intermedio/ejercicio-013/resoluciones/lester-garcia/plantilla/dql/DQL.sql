USE  ejercicio_13_int;
-- peliculas y sus actores
SELECT
    p.titulo AS pelicula,
    a.nombre AS actor,
    pa.personaje
FROM pelicula_actores pa
INNER JOIN peliculas p
    ON pa.id_pelicula = p.id_pelicula
INNER JOIN actores a
    ON pa.id_actor = a.id_actor
ORDER BY p.titulo, a.nombre;
-- Actores que participan en mas de una pelicula
SELECT
    a.nombre AS actor,
    COUNT(pa.id_pelicula) AS peliculas_participadas
FROM actores a
INNER JOIN pelicula_actores pa
    ON a.id_actor = pa.id_actor
GROUP BY
    a.id_actor,
    a.nombre
HAVING COUNT(pa.id_pelicula) > 1
ORDER BY peliculas_participadas DESC;

-- Cantidad de actores por pelicula
SELECT
    p.titulo AS pelicula,
    COUNT(pa.id_actor) AS cantidad_actores
FROM peliculas p
INNER JOIN pelicula_actores pa
    ON p.id_pelicula = pa.id_pelicula
GROUP BY
    p.id_pelicula,
    p.titulo
ORDER BY cantidad_actores DESC;

-- Reporte completo de peliculas
SELECT
    p.titulo AS pelicula,
    p.anio_estreno,
    d.nombre AS director,
    g.nombre AS genero,
    a.nombre AS actor,
    pa.personaje
FROM peliculas p
INNER JOIN pelicula_directores pd
    ON p.id_pelicula = pd.id_pelicula
INNER JOIN directores d
    ON pd.id_director = d.id_director
INNER JOIN pelicula_generos pg
    ON p.id_pelicula = pg.id_pelicula
INNER JOIN generos g
    ON pg.id_genero = g.id_genero
INNER JOIN pelicula_actores pa
    ON p.id_pelicula = pa.id_pelicula
INNER JOIN actores a
    ON pa.id_actor = a.id_actor
ORDER BY
    p.titulo,
    a.nombre;
    


