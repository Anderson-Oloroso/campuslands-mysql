SELECT titulo, artista, genero FROM canciones WHERE estado = 'activo';
SELECT titulo, artista, reproducciones 
FROM canciones 
ORDER BY reproducciones DESC 
LIMIT 3;

SELECT genero, AVG(duracion_segundos) AS promedio_segundos 
FROM canciones 
GROUP BY genero;

SELECT genero, COUNT(*) AS total_canciones 
FROM canciones 
WHERE estado = 'activo' 
GROUP BY genero;