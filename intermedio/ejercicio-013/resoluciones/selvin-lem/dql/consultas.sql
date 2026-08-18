-- Consultas usando la tabla puente pelicula_genero.
USE campuslands_mysql;

-- 1. Listado de peliculas con sus generos, via tabla puente
SELECT p.titulo, p.anio_estreno, g.nombre AS genero
FROM peliculas_miedo p
INNER JOIN pelicula_genero pg ON pg.pelicula_id = p.id
INNER JOIN generos_miedo g ON g.id = pg.genero_id
ORDER BY p.titulo, g.nombre;

-- 2. Cantidad de peliculas por genero
SELECT g.nombre AS genero, COUNT(*) AS total_peliculas
FROM generos_miedo g
INNER JOIN pelicula_genero pg ON pg.genero_id = g.id
GROUP BY g.nombre
ORDER BY total_peliculas DESC;

-- 3. Peliculas con mas de un genero asignado
SELECT p.titulo, COUNT(*) AS cantidad_generos
FROM peliculas_miedo p
INNER JOIN pelicula_genero pg ON pg.pelicula_id = p.id
GROUP BY p.titulo
HAVING COUNT(*) > 1
ORDER BY cantidad_generos DESC;

-- 4. Peliculas del genero 'terror psicologico' ordenadas por duracion
SELECT p.titulo, p.duracion_min
FROM peliculas_miedo p
INNER JOIN pelicula_genero pg ON pg.pelicula_id = p.id
INNER JOIN generos_miedo g ON g.id = pg.genero_id
WHERE g.nombre = 'terror psicologico'
ORDER BY p.duracion_min DESC;

-- 5. Generos sin ninguna pelicula asignada (caso limite de la tabla puente)
SELECT g.nombre
FROM generos_miedo g
LEFT JOIN pelicula_genero pg ON pg.genero_id = g.id
WHERE pg.genero_id IS NULL;
