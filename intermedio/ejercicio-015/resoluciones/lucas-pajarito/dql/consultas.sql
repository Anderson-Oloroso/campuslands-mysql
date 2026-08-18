USE basico_biblioteca_gamer;

-- Consulta 1: Listar todas las categorías registradas
SELECT * FROM categoria_juegos_015;

-- Consulta 2: Obtener los nombres de todos los juegos registrados
SELECT nombre FROM juegos_015;

-- Consulta 3: Listar creadores/estudios ordenados alfabéticamente
SELECT nombre FROM creadores_015 
ORDER BY nombre ASC;

-- Consulta 4: Filtrar juegos que pertenecen a la categoría 1 (RPG de Acción)
SELECT * FROM juegos_015 
WHERE categoria_juego_015 = 1;

-- Consulta 5: Obtener los registros de librería con más de 100,000 descargas
SELECT * FROM libreria_juegos_015 
WHERE cantidad_descargas > 100000;

-- Consulta 6: Contar el total de creadores registrados
SELECT COUNT(*) AS total_creadores FROM creadores_015;

-- Consulta 7: Top 3 juegos con mayor cantidad de descargas en la librería
SELECT * FROM libreria_juegos_015 
ORDER BY cantidad_descargas DESC 
LIMIT 3;

-- Consulta 8: Calcular el promedio general de descargas registradas
SELECT AVG(cantidad_descargas) AS promedio_descargas FROM libreria_juegos_015;