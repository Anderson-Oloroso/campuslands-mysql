USE campuslands_mysql;

-- 1. promedio de calificacion por subgenero para peliculas disponibles
SELECT subgenero, AVG(calificacion) AS promedio_calificacion
FROM peliculas_miedo
WHERE estado = 'disponible'
GROUP BY subgenero;

-- 2. top 3 peliculas mejor calificadas
SELECT titulo, subgenero, calificacion
FROM peliculas_miedo
ORDER BY calificacion DESC
LIMIT 3;

-- 3. peliculas filtradas por un subgenero especifico
SELECT titulo, anio_estreno, calificacion
FROM peliculas_miedo
WHERE subgenero = 'psicologico';

-- 4. reporte de peliculas por estado
SELECT estado, COUNT(*) AS total
FROM peliculas_miedo
GROUP BY estado;

-- 5. peliculas estrenadas antes del ano 2000 ordenadas por calificacion
SELECT titulo, anio_estreno, calificacion
FROM peliculas_miedo
WHERE anio_estreno < 2000
ORDER BY calificacion DESC;