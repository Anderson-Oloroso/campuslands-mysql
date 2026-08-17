USE campuslands_mysql;

-- 1. Listado completo ordenado por genero
SELECT titulo, artista, genero, duracion_seg, favorita
FROM canciones_basico
ORDER BY genero, titulo;

-- 2. Canciones marcadas como favoritas
SELECT titulo, artista, genero
FROM canciones_basico
WHERE favorita = TRUE;

-- 3. Top 3 canciones con mas reproducciones
SELECT titulo, artista, reproducciones
FROM canciones_basico
ORDER BY reproducciones DESC
LIMIT 3;

-- 4. Duracion promedio por genero
SELECT genero, COUNT(*) AS total_canciones, AVG(duracion_seg) AS duracion_promedio
FROM canciones_basico
GROUP BY genero
ORDER BY duracion_promedio DESC;

-- 5. Cantidad de canciones favoritas por genero
SELECT genero, COUNT(*) AS favoritas
FROM canciones_basico
WHERE favorita = TRUE
GROUP BY genero
ORDER BY favoritas DESC;

-- 6. Canciones de un artista especifico
SELECT titulo, genero, anio_lanzamiento
FROM canciones_basico
WHERE artista = 'Mateo Rivas';
