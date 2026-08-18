USE avanzado_biblioteca_gamer;

-- Consulta 1: Medir el rendimiento del plan de ejecución (EXPLAIN) en un JOIN completo
EXPLAIN SELECT * FROM vw_resumen_biblioteca 
WHERE cantidad_descargas > 100000;

-- Consulta 2: Top 3 juegos más descargados utilizando el índice idx_descargas
SELECT juego, creador, cantidad_descargas 
FROM vw_resumen_biblioteca 
ORDER BY cantidad_descargas DESC 
LIMIT 3;

-- Consulta 3: Agregación optimizada por categoría con GROUP BY
SELECT 
    c.nombre AS categoria,
    COUNT(j.id) AS total_juegos,
    AVG(l.cantidad_descargas) AS promedio_descargas
FROM categoria_juegos_015 c
JOIN juegos_015 j ON c.id = j.categoria_juego_015
JOIN libreria_juegos_015 l ON j.id = l.id_juego
GROUP BY c.id, c.nombre;

-- Consulta 4: Búsqueda rápida indexada por cobertura de claves foráneas
SELECT j.nombre AS juego, l.cantidad_descargas
FROM juegos_015 j
INNER JOIN libreria_juegos_015 l ON j.id = l.id_juego
WHERE j.categoria_juego_015 = 1;