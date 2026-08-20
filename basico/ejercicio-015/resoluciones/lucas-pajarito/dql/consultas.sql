
-- 5. Consultas Básicas

-- Consulta 1: Listar todas las categorías
SELECT * FROM categoria_juegos_015;

-- Consulta 2: Obtener solo los nombres de los juegos
SELECT nombre FROM juegos_015;

-- Consulta 3: Mostrar creadores en orden alfabético
SELECT nombre FROM creadores_015 
ORDER BY nombre ASC;

-- Consulta 4: Filtrar juegos por una categoría específica
SELECT * FROM juegos_015 
WHERE categoria_juego_015 = 1;

-- Consulta 5: Filtrar registros con más de 100,000 descargas
SELECT * FROM libreria_juegos_015 
WHERE cantidad_descargas > 100000;

-- Consulta 6: Contar el total de creadores
SELECT COUNT(*) AS total_creadores FROM creadores_015;

-- Consulta 7: Top 3 juegos más descargados
SELECT * FROM libreria_juegos_015 
ORDER BY cantidad_descargas DESC 
LIMIT 3;

-- Consulta 8: Promedio general de descargas
SELECT AVG(cantidad_descargas) AS promedio_descargas FROM libreria_juegos_015;