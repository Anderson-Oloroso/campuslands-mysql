USE campuslands_mysql;

-- 1. Seleccionar todos los registros ordenados por recaudacion descendentemente
SELECT pelicula_id, titulo, director, subgenero, recaudacion, estado
FROM peliculas_miedo
ORDER BY recaudacion DESC;

-- 2. Filtrar únicamente los registros en estado Activo
SELECT pelicula_id, titulo, director, recaudacion
FROM peliculas_miedo
WHERE estado = 'Activo';

-- 3. Agrupar por director y calcular total y promedio de recaudacion
SELECT director, COUNT(*) AS total_registros, AVG(recaudacion) AS promedio_valor
FROM peliculas_miedo
GROUP BY director
ORDER BY promedio_valor DESC;

-- 4. Filtrar por recaudacion mayor a 2000
SELECT pelicula_id, titulo, director, recaudacion
FROM peliculas_miedo
WHERE recaudacion > 2000.00
ORDER BY recaudacion ASC;

-- 5. Seleccionar los 5 mejores registros según recaudacion
SELECT pelicula_id, titulo, director, recaudacion
FROM peliculas_miedo
ORDER BY recaudacion DESC
LIMIT 5;
