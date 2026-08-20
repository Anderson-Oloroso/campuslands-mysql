-- Consultas para Ejercicio 056 - validaciones simples para videojuego RPG
-- Concepto principal: validaciones simples
USE campuslands_mysql;

-- 1. Listado completo de registros
SELECT * FROM heroes_rpg;

-- 2. Conteo total de elementos
SELECT COUNT(*) AS total_registros FROM heroes_rpg;

-- 3. Consulta aplicando el concepto principal: validaciones simples
SELECT * FROM heroes_rpg
ORDER BY puntos_vida DESC
LIMIT 5;

-- 4. Filtro especifico por valor superior al promedio
SELECT nombre_heroe, nivel, puntos_vida
FROM heroes_rpg
WHERE puntos_vida > (SELECT AVG(puntos_vida) FROM heroes_rpg)
ORDER BY puntos_vida DESC;

-- 5. Resumen estadistico y agrupacion
SELECT 
    COUNT(*) AS total_elementos,
    AVG(puntos_vida) AS promedio_valor,
    MIN(puntos_vida) AS valor_minimo,
    MAX(puntos_vida) AS valor_maximo
FROM heroes_rpg;

-- 6. Consulta de agrupacion por categoria/tipo
SELECT 
    nivel,
    COUNT(*) AS cantidad,
    AVG(puntos_vida) AS promedio
FROM heroes_rpg
GROUP BY nivel
ORDER BY cantidad DESC;
