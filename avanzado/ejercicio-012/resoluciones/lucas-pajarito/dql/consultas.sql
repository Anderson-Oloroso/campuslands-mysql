-- Consultas base. Completa o reemplaza segun el enunciado.
USE playlist_musical_01;


SELECT id_cancion, titulo, SUM(reproducciones) AS total_reproducciones
FROM canciones_playlist_01 
GROUP BY id_cancion, titulo ; -- uso de SUM

SELECT CONCAT(id_cancion, '.',titulo) AS Caciones, SUM(reproducciones) AS total_reproducciones
FROM canciones_playlist_01 
GROUP BY id_cancion, titulo ; -- Mismo ejemplo con la diferencia a que se usa CONCAT.
