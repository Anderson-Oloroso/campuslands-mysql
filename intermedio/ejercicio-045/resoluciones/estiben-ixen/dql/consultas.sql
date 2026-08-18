-- Consultas para Ejercicio 045 - carga de datos para biblioteca gamer
-- Concepto principal: carga de datos
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_estudio AS nombre_estudio,
    s.titulo AS titulo,
    s.metacritic_score AS metrica
FROM estudios_desarrollo p
INNER JOIN videojuegos_catalogo s ON p.id_estudio = s.id_estudio
ORDER BY s.metacritic_score DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_estudio AS entidad_principal,
    COUNT(s.id_videojuego) AS total_registros,
    AVG(s.metacritic_score) AS promedio_metrica
FROM estudios_desarrollo p
INNER JOIN videojuegos_catalogo s ON p.id_estudio = s.id_estudio
GROUP BY p.nombre_estudio
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_estudio AS entidad_principal,
    COUNT(s.id_videojuego) AS total_registros,
    AVG(s.metacritic_score) AS promedio_metrica
FROM estudios_desarrollo p
INNER JOIN videojuegos_catalogo s ON p.id_estudio = s.id_estudio
GROUP BY p.nombre_estudio
HAVING COUNT(s.id_videojuego) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_estudio AS entidad_principal,
    COALESCE(s.titulo, 'Sin registros') AS detalle_asociado
FROM estudios_desarrollo p
LEFT JOIN videojuegos_catalogo s ON p.id_estudio = s.id_estudio
ORDER BY p.nombre_estudio;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.titulo,
    s.metacritic_score,
    (SELECT p.nombre_estudio FROM estudios_desarrollo p WHERE p.id_estudio = s.id_estudio) AS entidad_origen
FROM videojuegos_catalogo s
WHERE s.metacritic_score > (SELECT AVG(metacritic_score) FROM videojuegos_catalogo)
ORDER BY s.metacritic_score DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.titulo AS nombre_elemento,
    p.nombre_estudio AS categoria_principal,
    s.metacritic_score AS valor_destacado
FROM videojuegos_catalogo s
INNER JOIN estudios_desarrollo p ON s.id_estudio = p.id_estudio
ORDER BY s.metacritic_score DESC
LIMIT 5;
