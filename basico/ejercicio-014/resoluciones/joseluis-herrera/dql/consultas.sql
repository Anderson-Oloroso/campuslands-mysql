USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno
FROM peliculas
ORDER BY fecha_estreno ASC;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE fecha_estreno >= '2000-01-01'
ORDER BY fecha_estreno ASC;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE estado = 'activo'
  AND fecha_estreno BETWEEN '1980-01-01' AND '2000-12-31'
ORDER BY fecha_estreno ASC;

SELECT
    saga,
    COUNT(*) AS total_peliculas
FROM peliculas
GROUP BY saga
ORDER BY total_peliculas DESC, saga;

SELECT
    titulo AS pelicula,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE fecha_estreno >= '2000-01-01'
ORDER BY puntaje DESC
LIMIT 5;