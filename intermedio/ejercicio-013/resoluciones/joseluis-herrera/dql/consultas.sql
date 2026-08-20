USE campuslands_mysql;

SELECT
    p.titulo AS pelicula,
    a.nombre AS actor
FROM peliculas AS p
INNER JOIN pelicula_actor AS pa
    ON p.id = pa.pelicula_id
INNER JOIN actores AS a
    ON pa.actor_id = a.id
ORDER BY p.titulo, a.nombre;


SELECT
    p.titulo AS pelicula,
    COUNT(pa.actor_id) AS total_actores
FROM peliculas AS p
LEFT JOIN pelicula_actor AS pa
    ON p.id = pa.pelicula_id
GROUP BY p.id, p.titulo
ORDER BY total_actores DESC, p.titulo;


SELECT
    p.titulo AS pelicula,
    p.estado,
    a.nombre AS actor
FROM peliculas AS p
INNER JOIN pelicula_actor AS pa
    ON p.id = pa.pelicula_id
INNER JOIN actores AS a
    ON pa.actor_id = a.id
WHERE p.estado = 'activo'
ORDER BY p.titulo, a.nombre;


SELECT
    p.titulo AS pelicula,
    p.categoria,
    p.puntaje,
    COUNT(pa.actor_id) AS total_actores
FROM peliculas AS p
LEFT JOIN pelicula_actor AS pa
    ON p.id = pa.pelicula_id
WHERE p.estado = 'activo'
GROUP BY p.id, p.titulo, p.categoria, p.puntaje
ORDER BY p.puntaje DESC
LIMIT 5;

SELECT
    a.nombre AS actor,
    COUNT(pa.pelicula_id) AS total_peliculas
FROM actores AS a
INNER JOIN pelicula_actor AS pa
    ON a.id = pa.actor_id
GROUP BY a.id, a.nombre
HAVING COUNT(pa.pelicula_id) > 1
ORDER BY total_peliculas DESC;