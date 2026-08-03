-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    p.titulo,
    p.anio_estreno,
    g.nombre AS genero
FROM peliculas p
INNER JOIN pelicula_genero pg
ON p.id = pg.pelicula_id
INNER JOIN generos g
ON pg.genero_id = g.id
WHERE g.nombre = 'Terror';

SELECT
    g.nombre AS genero,
    COUNT(pg.pelicula_id) AS total_peliculas
FROM generos g
LEFT JOIN pelicula_genero pg
ON g.id = pg.genero_id
GROUP BY g.id, g.nombre
ORDER BY total_peliculas DESC;

SELECT
    p.titulo,
    COUNT(pg.genero_id) AS cantidad_generos
FROM peliculas p
INNER JOIN pelicula_genero pg
ON p.id = pg.pelicula_id
GROUP BY p.id, p.titulo
HAVING COUNT(pg.genero_id) > 1; 

SELECT
    titulo,
    anio_estreno,
    estado
FROM peliculas
ORDER BY anio_estreno DESC;
