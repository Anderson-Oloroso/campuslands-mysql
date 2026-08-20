USE campuslands_mysql;

-- 1. INNER JOIN básico: Listar los videojuegos junto con el nombre de su género correspondiente
VB_QUERY_1:
SELECT 
    v.codigo_juego,
    v.titulo,
    g.nombre_genero,
    v.precio,
    v.calificacion,
    v.estado_biblioteca
FROM videojuegos_biblioteca v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
ORDER BY v.calificacion DESC;

-- 2. Filtrar y ordenar: Mostrar videojuegos instalados o completados que tengan una calificación superior a 8.5
SELECT 
    v.titulo,
    g.nombre_genero,
    v.calificacion,
    v.estado_biblioteca
FROM videojuegos_biblioteca v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
WHERE v.estado_biblioteca IN ('instalado', 'completado') AND v.calificacion > 8.5
ORDER BY v.calificacion DESC;

-- 3. Agrupación por género: Calcular la cantidad de juegos, el precio promedio y la calificación media por cada género
SELECT 
    g.nombre_genero,
    COUNT(v.id) AS total_videojuegos,
    ROUND(AVG(v.precio), 2) AS precio_promedio,
    ROUND(AVG(v.calificacion), 2) AS calificacion_promedio
FROM generos_biblioteca g
LEFT JOIN videojuegos_biblioteca v ON g.id = v.genero_id
GROUP BY g.id, g.nombre_genero
ORDER BY total_videojuegos DESC;

-- 4. Top 3 de videojuegos mejor calificados en la biblioteca gamer
SELECT 
    v.titulo,
    g.nombre_genero,
    v.precio,
    v.calificacion
FROM videojuegos_biblioteca v
INNER JOIN generos_biblioteca g ON v.genero_id = g.id
ORDER BY v.calificacion DESC
LIMIT 3;

-- 5. Reporte financiero agrupado por el estado actual de los juegos en la biblioteca
SELECT 
    v.estado_biblioteca,
    COUNT(*) AS cantidad_juegos,
    SUM(v.precio) AS valor_total_estado
FROM videojuegos_biblioteca v
GROUP BY v.estado_biblioteca
ORDER BY valor_total_estado DESC;