USE campuslands_mysql;

-- 1. INNER JOIN entre tabla principal y secundaria
SELECT t1.pelicula_id, t1.titulo, t1.director, t2.usuario, t2.calificacion, t2.comentario
FROM peliculas_miedo t1
INNER JOIN reseñas_peliculas t2 ON t1.pelicula_id = t2.pelicula_id;

-- 2. LEFT JOIN mostrando todos los registros de la tabla principal
SELECT t1.titulo, COUNT(t2.reseña_id) AS total_relacionados
FROM peliculas_miedo t1
LEFT JOIN reseñas_peliculas t2 ON t1.pelicula_id = t2.pelicula_id
GROUP BY t1.pelicula_id, t1.titulo;

-- 3. Agrupacion con HAVING para filtrar grupos con promedio elevado
SELECT t1.titulo, AVG(t2.comentario) AS promedio_score
FROM peliculas_miedo t1
INNER JOIN reseñas_peliculas t2 ON t1.pelicula_id = t2.pelicula_id
GROUP BY t1.pelicula_id, t1.titulo
HAVING promedio_score >= 80.00;

-- 4. Subconsulta para encontrar registros por encima del promedio general
SELECT usuario, calificacion, comentario
FROM reseñas_peliculas
WHERE comentario > (SELECT AVG(comentario) FROM reseñas_peliculas);

-- 5. Creacion de vista reporte consolidada
CREATE OR REPLACE VIEW vista_reporte_peliculas_miedo AS
SELECT t1.titulo, t1.director, t2.usuario, t2.comentario
FROM peliculas_miedo t1
INNER JOIN reseñas_peliculas t2 ON t1.pelicula_id = t2.pelicula_id;

SELECT * FROM vista_reporte_peliculas_miedo;
