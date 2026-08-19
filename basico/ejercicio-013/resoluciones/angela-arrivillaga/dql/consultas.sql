USE peliculas_miedo_db;

-- 1. Listado general de peliculas cuyo estado en el catalogo es 'disponible' ordenadas por calificacion IMDB
SELECT titulo, director, anio_estreno, subgenero, calificacion_imdb
FROM peliculas
WHERE estado_catalogo = 'disponible'
ORDER BY calificacion_imdb DESC;

-- 2. Conteo de peliculas agrupadas por su subgenero de terror
SELECT subgenero, COUNT(*) AS total_peliculas, ROUND(AVG(calificacion_imdb), 2) AS promedio_imdb
FROM peliculas
GROUP BY subgenero
ORDER BY total_peliculas DESC;

-- 3. Peliculas filtradas por diferentes estados del catalogo excluyendo las archivadas
SELECT titulo, subgenero, estado_catalogo, calificacion_imdb
FROM peliculas
WHERE estado_catalogo IN ('disponible', 'proximamente', 'agotado')
ORDER BY estado_catalogo ASC, calificacion_imdb DESC;

-- 4. Top 5 de peliculas mejor calificadas en todo el catalogo
SELECT titulo, director, calificacion_imdb, subgenero
FROM peliculas
ORDER BY calificacion_imdb DESC
LIMIT 5;

-- 5. Resumen estadistico y conteo global por cada estado disponible en el catalogo
SELECT estado_catalogo, COUNT(*) AS cantidad_titulos, MIN(anio_estreno) AS anio_mas_antiguo
FROM peliculas
GROUP BY estado_catalogo
ORDER BY cantidad_titulos DESC;