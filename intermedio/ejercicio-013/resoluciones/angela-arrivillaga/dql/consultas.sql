USE peliculas_miedo_db;

-- 1. Reporte completo cruzando peliculas y categorias a traves de la tabla puente con formato detallado
SELECT p.codigo_pelicula, p.titulo, p.anio_estreno, c.nombre_categoria AS categoria_terror, p.calificacion_imdb, p.estado_pelicula
FROM peliculas p
JOIN pelicula_categoria pc ON p.id_pelicula = pc.id_pelicula
JOIN categorias_terror c ON pc.id_categoria = c.id_categoria
ORDER BY p.calificacion_imdb DESC;

-- 2. Reporte estadistico agrupado por categoria de terror calculando el total de peliculas, la calificacion promedio IMDb y duracion media
SELECT c.nombre_categoria AS categoria, COUNT(pc.id_pelicula) AS total_peliculas, ROUND(AVG(p.calificacion_imdb), 2) AS calificacion_promedio, ROUND(AVG(p.duracion_minutos), 1) AS duracion_media_min
FROM categorias_terror c
LEFT JOIN pelicula_categoria pc ON c.id_categoria = pc.id_categoria
LEFT JOIN peliculas p ON pc.id_pelicula = p.id_pelicula
GROUP BY c.id_categoria, c.nombre_categoria
ORDER BY total_peliculas DESC;

-- 3. Reporte filtrado de peliculas con calificacion IMDb mayor o igual a 7.5 ordenadas por su puntuacion de mayor a menor
SELECT p.codigo_pelicula, p.titulo, p.anio_estreno, p.calificacion_imdb, p.estado_pelicula
FROM peliculas p
WHERE p.calificacion_imdb >= 7.5
ORDER BY p.calificacion_imdb DESC;

-- 4. Top 5 de peliculas de miedo mejor calificadas en la plataforma de terror
SELECT p.codigo_pelicula, p.titulo, p.anio_estreno, p.calificacion_imdb, p.estado_pelicula
FROM peliculas p
ORDER BY p.calificacion_imdb DESC
LIMIT 5;

-- 5. Analisis de distribucion de peliculas agrupadas por su estado actual evaluando volumen y calificacion media
SELECT p.estado_pelicula, COUNT(*) AS cantidad_peliculas, ROUND(AVG(p.calificacion_imdb), 2) AS calificacion_media_estado
FROM peliculas p
GROUP BY p.estado_pelicula
ORDER BY cantidad_peliculas DESC;