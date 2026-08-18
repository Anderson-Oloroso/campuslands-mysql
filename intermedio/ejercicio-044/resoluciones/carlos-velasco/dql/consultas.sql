USE campuslands_mysql;

-- 1. Mostrar todas las peliculas disponibles en la vista.
SELECT
    id_pelicula,
    titulo,
    saga,
    anio_estreno,
    puntuacion
FROM vw_peliculas_ciencia_ficcion
ORDER BY anio_estreno ASC;


-- 2. Mostrar las peliculas activas ordenadas de mayor a menor puntuacion.
SELECT
    titulo,
    saga,
    puntuacion
FROM vw_peliculas_ciencia_ficcion
ORDER BY puntuacion DESC;


-- 3. Obtener las peliculas con puntuacion igual o superior a 8.8.
SELECT
    titulo,
    saga,
    puntuacion
FROM vw_peliculas_ciencia_ficcion
WHERE puntuacion >= 8.8
ORDER BY puntuacion DESC;


-- 4. Contar cuantas peliculas activas existen por saga.
SELECT
    saga,
    COUNT(*) AS total_peliculas
FROM vw_peliculas_ciencia_ficcion
GROUP BY saga
ORDER BY total_peliculas DESC;


-- 5. Calcular la puntuacion promedio de las peliculas activas por saga.
SELECT
    saga,
    COUNT(*) AS total_peliculas,
    ROUND(AVG(puntuacion), 2) AS puntuacion_promedio
FROM vw_peliculas_ciencia_ficcion
GROUP BY saga
ORDER BY puntuacion_promedio DESC;


-- 6. Mostrar las tres peliculas activas con mayor puntuacion.
SELECT
    titulo,
    saga,
    puntuacion
FROM vw_peliculas_ciencia_ficcion
ORDER BY puntuacion DESC
LIMIT 3;