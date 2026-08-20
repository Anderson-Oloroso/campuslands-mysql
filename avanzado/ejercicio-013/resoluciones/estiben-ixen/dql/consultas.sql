-- Consultas Avanzadas para Ejercicio 013 - JSON en MySQL para catalogo de peliculas de miedo
-- Concepto principal: JSON en MySQL
USE campuslands_mysql;

-- 1. Generacion y consulta de estructuras JSON
SELECT 
    JSON_OBJECT(
        'id', s.id_pelicula,
        'nombre', s.titulo,
        'metrica', s.duracion_min,
        'categoria', p.nombre
    ) AS elemento_json
FROM peliculas_terror s
INNER JOIN directores_terror p ON s.id_director = p.id_director
ORDER BY s.duracion_min DESC;

-- 2. Agregacion de array JSON por grupo
SELECT 
    p.nombre AS grupo,
    JSON_ARRAYAGG(s.titulo) AS elementos_en_grupo
FROM directores_terror p
INNER JOIN peliculas_terror s ON p.id_director = s.id_director
GROUP BY p.nombre;

-- 2. Metricas agregadas con desviacion respecto al promedio general
SELECT 
    p.nombre AS categoria_principal,
    COUNT(s.id_pelicula) AS cantidad_registros,
    AVG(s.duracion_min) AS promedio_categoria,
    (AVG(s.duracion_min) - (SELECT AVG(duracion_min) FROM peliculas_terror)) AS diferencia_vs_global
FROM directores_terror p
INNER JOIN peliculas_terror s ON p.id_director = s.id_director
GROUP BY p.id_director, p.nombre
ORDER BY promedio_categoria DESC;

-- 3. Top 3 elementos con mayor desempeno
SELECT 
    s.titulo AS nombre_destacado,
    p.nombre AS origen,
    s.duracion_min AS metrica_maxima
FROM peliculas_terror s
INNER JOIN directores_terror p ON s.id_director = p.id_director
ORDER BY s.duracion_min DESC
LIMIT 3;
