-- DQL: Consultas relacionales utilizando JOINs entre entidad principal, tabla puente y catálogo
USE campuslands_mysql;

-- 1. Listado completo de películas con sus subgéneros concatenados usando GROUP_CONCAT
SELECT 
    p.pelicula_id,
    p.titulo,
    p.director,
    p.calificacion_imdb,
    GROUP_CONCAT(s.nombre_subgenero SEPARATOR ', ') AS subgeneros
FROM peliculas_catalogo p
INNER JOIN pelicula_subgenero ps ON p.pelicula_id = ps.pelicula_id
INNER JOIN subgeneros_terror s ON ps.subgenero_id = s.subgenero_id
GROUP BY p.pelicula_id, p.titulo, p.director, p.calificacion_imdb
ORDER BY p.calificacion_imdb DESC;

-- 2. Conteo de películas e IMDb promedio por subgénero
SELECT 
    s.nombre_subgenero,
    COUNT(ps.pelicula_id) AS total_peliculas,
    ROUND(AVG(p.calificacion_imdb), 2) AS promedio_imdb
FROM subgeneros_terror s
INNER JOIN pelicula_subgenero ps ON s.subgenero_id = ps.subgenero_id
INNER JOIN peliculas_catalogo p ON ps.pelicula_id = p.pelicula_id
GROUP BY s.subgenero_id, s.nombre_subgenero
ORDER BY total_peliculas DESC;

-- 3. Búsqueda de películas asociadas al subgénero 'Sobrenatural'
SELECT 
    p.titulo,
    p.director,
    p.anio_estreno,
    p.calificacion_imdb
FROM peliculas_catalogo p
INNER JOIN pelicula_subgenero ps ON p.pelicula_id = ps.pelicula_id
INNER JOIN subgeneros_terror s ON ps.subgenero_id = s.subgenero_id
WHERE s.nombre_subgenero = 'Sobrenatural';

-- 4. Películas que combinan más de un subgénero asignado
SELECT 
    p.titulo,
    COUNT(ps.subgenero_id) AS total_subgeneros_asignados
FROM peliculas_catalogo p
INNER JOIN pelicula_subgenero ps ON p.pelicula_id = ps.pelicula_id
GROUP BY p.pelicula_id, p.titulo
HAVING COUNT(ps.subgenero_id) > 1
ORDER BY total_subgeneros_asignados DESC;

-- 5. Subgéneros con una calificación promedio en sus películas superior a 7.5
SELECT 
    s.nombre_subgenero,
    ROUND(AVG(p.calificacion_imdb), 2) AS promedio_calificacion
FROM subgeneros_terror s
INNER JOIN pelicula_subgenero ps ON s.subgenero_id = ps.subgenero_id
INNER JOIN peliculas_catalogo p ON ps.pelicula_id = p.pelicula_id
GROUP BY s.subgenero_id, s.nombre_subgenero
HAVING AVG(p.calificacion_imdb) >= 7.5;
