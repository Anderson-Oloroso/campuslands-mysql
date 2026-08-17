-- DQL: Consultas con filtrado estricto por estado de catálogo
USE campuslands_mysql;

-- 1. Películas en estado 'disponible' listas para reproducción ordenadas por calificación
SELECT 
    pelicula_id,
    titulo,
    director,
    subgenero,
    duracion_minutos,
    calificacion_imdb
FROM peliculas_miedo
WHERE estado = 'disponible'
ORDER BY calificacion_imdb DESC;

-- 2. Conteo de películas e IMDb promedio según su estado de publicación
SELECT 
    estado,
    COUNT(*) AS cantidad_titulos,
    ROUND(AVG(calificacion_imdb), 1) AS calificacion_promedio
FROM peliculas_miedo
GROUP BY estado
ORDER BY cantidad_titulos DESC;

-- 3. Búsqueda de películas no disponibles para catálogo general ('archivada' o 'restringida')
SELECT 
    titulo,
    director,
    subgenero,
    estado
FROM peliculas_miedo
WHERE estado IN ('archivada', 'restringida');

-- 4. Películas 'disponibles' con calificación igual o superior a 7.5
SELECT 
    titulo,
    subgenero,
    calificacion_imdb,
    duracion_minutos
FROM peliculas_miedo
WHERE estado = 'disponible' AND calificacion_imdb >= 7.5
ORDER BY calificacion_imdb DESC;

-- 5. Próximos estrenos ('proximamente') o agregados recientemente
SELECT 
    titulo,
    director,
    estado,
    fecha_adicion
FROM peliculas_miedo
WHERE estado = 'proximamente' OR fecha_adicion >= '2026-05-01';
