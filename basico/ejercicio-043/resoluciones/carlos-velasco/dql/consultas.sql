USE campuslands_mysql;

-- 1. Mostrar todas las peliculas activas.
SELECT
    id_pelicula,
    titulo,
    director,
    subgenero,
    puntuacion,
    estado
FROM peliculas_miedo
WHERE estado = 'activa'
ORDER BY titulo;


-- 2. Mostrar todas las peliculas inactivas.
SELECT
    id_pelicula,
    titulo,
    director,
    subgenero,
    puntuacion,
    estado
FROM peliculas_miedo
WHERE estado = 'inactiva'
ORDER BY titulo;


-- 3. Mostrar peliculas activas con puntuacion igual o superior a 8.0.
SELECT
    titulo,
    subgenero,
    puntuacion,
    estado
FROM peliculas_miedo
WHERE estado = 'activa'
  AND puntuacion >= 8.0
ORDER BY puntuacion DESC;


-- 4. Contar peliculas activas e inactivas.
SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas_miedo
GROUP BY estado
ORDER BY total_peliculas DESC;


-- 5. Obtener el promedio de puntuacion de las peliculas activas.
SELECT
    COUNT(*) AS total_peliculas_activas,
    ROUND(AVG(puntuacion), 2) AS promedio_puntuacion
FROM peliculas_miedo
WHERE estado = 'activa';


-- 6. Mostrar las 5 peliculas activas con mayor puntuacion.
SELECT
    titulo,
    director,
    subgenero,
    puntuacion
FROM peliculas_miedo
WHERE estado = 'activa'
ORDER BY puntuacion DESC, titulo ASC
LIMIT 5;