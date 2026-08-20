-- Consultas para Ejercicio 043 - tablas puente para catalogo de peliculas de miedo
-- Concepto principal: tablas puente
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.titulo AS titulo,
    s.duracion_min AS metrica
FROM directores_terror p
INNER JOIN peliculas_terror s ON p.id_director = s.id_director
ORDER BY s.duracion_min DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_pelicula) AS total_registros,
    AVG(s.duracion_min) AS promedio_metrica
FROM directores_terror p
INNER JOIN peliculas_terror s ON p.id_director = s.id_director
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_pelicula) AS total_registros,
    AVG(s.duracion_min) AS promedio_metrica
FROM directores_terror p
INNER JOIN peliculas_terror s ON p.id_director = s.id_director
GROUP BY p.nombre
HAVING COUNT(s.id_pelicula) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.titulo, 'Sin registros') AS detalle_asociado
FROM directores_terror p
LEFT JOIN peliculas_terror s ON p.id_director = s.id_director
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.titulo,
    s.duracion_min,
    (SELECT p.nombre FROM directores_terror p WHERE p.id_director = s.id_director) AS entidad_origen
FROM peliculas_terror s
WHERE s.duracion_min > (SELECT AVG(duracion_min) FROM peliculas_terror)
ORDER BY s.duracion_min DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.titulo AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.duracion_min AS valor_destacado
FROM peliculas_terror s
INNER JOIN directores_terror p ON s.id_director = p.id_director
ORDER BY s.duracion_min DESC
LIMIT 5;
