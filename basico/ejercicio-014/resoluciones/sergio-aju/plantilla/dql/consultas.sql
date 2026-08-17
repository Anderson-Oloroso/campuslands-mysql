-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM basico_ejercicio_014;

SELECT titulo_pelicula, fecha_estreno, estado 
FROM entregas_saga 
ORDER BY fecha_estreno ASC;

SELECT titulo_pelicula, fecha_estreno, recaudacion_millones 
FROM entregas_saga 
WHERE fecha_estreno BETWEEN '2010-01-01' AND '2019-12-31'
ORDER BY fecha_estreno ASC;

SELECT titulo_pelicula, recaudacion_millones, fecha_estreno 
FROM entregas_saga 
ORDER BY recaudacion_millones DESC 
LIMIT 3;