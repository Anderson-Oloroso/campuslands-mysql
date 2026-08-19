USE playlist_musical_db;

-- 1. Reporte completo de canciones relacionando codigo, titulo, artista, genero musical, duracion formateada, reproducciones y estado
SELECT c.codigo_cancion, c.titulo_cancion, c.artista, g.nombre_genero AS genero, CONCAT(FLOOR(c.duracion_segundos / 60), 'm ', MOD(c.duracion_segundos, 60), 's') AS duracion, c.reproducciones, c.estado_cancion
FROM canciones_playlist c
JOIN generos_musicales g ON c.id_genero = g.id_genero
ORDER BY c.reproducciones DESC;

-- 2. Reporte estadistico agrupado por genero musical calculando la cantidad de canciones, reproducciones totales y duracion promedio
SELECT g.nombre_genero AS genero, COUNT(c.id_cancion) AS total_canciones, SUM(c.reproducciones) AS reproducciones_totales, ROUND(AVG(c.duracion_segundos), 1) AS duracion_promedio_seg
FROM generos_musicales g
LEFT JOIN canciones_playlist c ON g.id_genero = c.id_genero
GROUP BY g.id_genero, g.nombre_genero
ORDER BY reproducciones_totales DESC;

-- 3. Reporte filtrado de canciones marcadas como 'favorita' o 'activa' ordenadas de mayor a menor reproduccion
SELECT c.codigo_cancion, c.titulo_cancion, c.artista, g.nombre_genero AS genero, c.reproducciones, c.estado_cancion
FROM canciones_playlist c
JOIN generos_musicales g ON c.id_genero = g.id_genero
WHERE c.estado_cancion IN ('favorita', 'activa')
ORDER BY c.reproducciones DESC;

-- 4. Top 5 de canciones mas reproducidas en toda la plataforma de playlist musical
SELECT c.codigo_cancion, c.titulo_cancion, c.artista, g.nombre_genero AS genero, c.reproducciones, c.estado_cancion
FROM canciones_playlist c
JOIN generos_musicales g ON c.id_genero = g.id_genero
ORDER BY c.reproducciones DESC
LIMIT 5;

-- 5. Reporte de rendimiento por artista evaluando la cantidad de temas en playlist, la suma de reproducciones y el promedio de duracion
SELECT c.artista, COUNT(c.id_cancion) AS canciones_en_playlist, SUM(c.reproducciones) AS reproducciones_artista, ROUND(AVG(c.duracion_segundos), 1) AS promedio_duracion_seg
FROM canciones_playlist c
GROUP BY c.artista
ORDER BY reproducciones_artista DESC;