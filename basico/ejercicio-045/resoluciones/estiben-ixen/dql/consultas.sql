-- Consultas para Ejercicio 045 - relaciones simples para biblioteca gamer
-- Concepto principal: relaciones simples
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM videojuegos_catalogo;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM videojuegos_catalogo;

-- 3. Consulta aplicando el concepto principal: relaciones simples
SELECT * FROM videojuegos_catalogo
ORDER BY metacritic_score DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT titulo, genero, metacritic_score
FROM videojuegos_catalogo
WHERE metacritic_score > (SELECT AVG(metacritic_score) FROM videojuegos_catalogo)
ORDER BY metacritic_score DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(metacritic_score) AS promedio_valor,
    MIN(metacritic_score) AS valor_minimo,
    MAX(metacritic_score) AS valor_maximo
FROM videojuegos_catalogo;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    genero,
    COUNT(*) AS cantidad,
    AVG(metacritic_score) AS promedio
FROM videojuegos_catalogo
GROUP BY genero
ORDER BY cantidad DESC;
