USE campuslands_mysql;

-- 1. Mostrar todas las películas con sus géneros.
SELECT
    p.titulo AS pelicula,
    p.director,
    GROUP_CONCAT(g.nombre ORDER BY g.nombre SEPARATOR ', ') AS generos
FROM peliculas AS p
INNER JOIN pelicula_genero AS pg
    ON p.id_pelicula = pg.id_pelicula
INNER JOIN generos AS g
    ON pg.id_genero = g.id_genero
GROUP BY
    p.id_pelicula,
    p.titulo,
    p.director
ORDER BY p.titulo;


-- 2. Obtener las películas clasificadas como terror sobrenatural.
SELECT
    p.titulo AS pelicula,
    p.anio_estreno,
    p.calificacion
FROM peliculas AS p
INNER JOIN pelicula_genero AS pg
    ON p.id_pelicula = pg.id_pelicula
INNER JOIN generos AS g
    ON pg.id_genero = g.id_genero
WHERE g.nombre = 'Terror sobrenatural'
ORDER BY p.calificacion DESC;


-- 3. Contar cuántas películas tiene cada género.
SELECT
    g.nombre AS genero,
    COUNT(pg.id_pelicula) AS total_peliculas
FROM generos AS g
LEFT JOIN pelicula_genero AS pg
    ON g.id_genero = pg.id_genero
GROUP BY
    g.id_genero,
    g.nombre
ORDER BY total_peliculas DESC, g.nombre;


-- 4. Mostrar las películas que pertenecen a más de un género.
SELECT
    p.titulo AS pelicula,
    COUNT(pg.id_genero) AS cantidad_generos
FROM peliculas AS p
INNER JOIN pelicula_genero AS pg
    ON p.id_pelicula = pg.id_pelicula
GROUP BY
    p.id_pelicula,
    p.titulo
HAVING COUNT(pg.id_genero) > 1
ORDER BY cantidad_generos DESC, p.titulo;


-- 5. Obtener el ranking de películas disponibles por calificación.
SELECT
    p.titulo AS pelicula,
    p.anio_estreno AS estreno,
    p.calificacion AS calificacion,
    p.estado
FROM peliculas AS p
WHERE p.estado = 'disponible'
ORDER BY p.calificacion DESC, p.titulo
LIMIT 5;