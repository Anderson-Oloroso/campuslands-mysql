SELECT titulo, director, subgenero, puntaje 
FROM peliculas 
WHERE estado = 'Disponible';

SELECT titulo, puntaje, subgenero 
FROM peliculas 
WHERE estado != 'Proximamente' 
ORDER BY puntaje DESC 
LIMIT 3;

SELECT subgenero, ROUND(AVG(puntaje), 2) AS puntaje_promedio, COUNT(*) AS total_peliculas
FROM peliculas 
GROUP BY subgenero;