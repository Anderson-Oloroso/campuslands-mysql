USE campuslands_mysql;

-- 1. promedio de calificacion por estado de los libros publicados
SELECT estado, AVG(calificacion) AS promedio_calificacion
FROM saga_ciencia_ficcion
WHERE estado = 'publicado'
GROUP BY estado;

-- 2. top 3 libros mejor calificados de la saga
SELECT titulo, libro_numero, calificacion
FROM saga_ciencia_ficcion
WHERE estado = 'publicado'
ORDER BY calificacion DESC
LIMIT 3;

-- 3. libros lanzados antes del ano 1980 ordenados por fecha
SELECT titulo, libro_numero, fecha_lanzamiento
FROM saga_ciencia_ficcion
WHERE fecha_lanzamiento < '1980-01-01'
ORDER BY fecha_lanzamiento ASC;

-- 4. reporte de libros agrupados por su estado actual
SELECT estado, COUNT(*) AS total_libros
FROM saga_ciencia_ficcion
GROUP BY estado;

-- 5. busqueda de libros publicados despues de 1980 con calificacion superior a 8.5
SELECT titulo, libro_numero, fecha_lanzamiento, calificacion
FROM saga_ciencia_ficcion
WHERE fecha_lanzamiento > '1980-01-01' AND calificacion > 8.5
ORDER BY calificacion DESC;