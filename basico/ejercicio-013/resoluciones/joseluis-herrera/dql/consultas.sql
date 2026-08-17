USE campuslands_mysql;

SELECT
    titulo AS pelicula,
    categoria,
    puntaje
FROM peliculas_miedo
WHERE estado = 'activo'
ORDER BY titulo;

SELECT
    estado,
    COUNT(*) AS total_peliculas
FROM peliculas_miedo
GROUP BY estado;

SELECT
    categoria,
    COUNT(*) AS total,
    ROUND(AVG(puntaje), 2) AS promedio
FROM peliculas_miedo
WHERE estado = 'activo'
GROUP BY categoria
ORDER BY promedio DESC;

SELECT
    titulo AS pelicula,
    director,
    puntaje
FROM peliculas_miedo
ORDER BY puntaje DESC
LIMIT 5;

SELECT
    titulo AS pelicula,
    anio,
    puntaje
FROM peliculas_miedo
WHERE estado = 'activo'
  AND anio >= 2010
ORDER BY anio DESC;