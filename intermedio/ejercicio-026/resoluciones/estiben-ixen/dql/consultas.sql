-- Consultas para Ejercicio 026 - CHECK para videojuego RPG
-- Concepto principal: CHECK
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_clase AS nombre_clase,
    s.nombre_heroe AS nombre_heroe,
    s.puntos_vida AS metrica
FROM clases_personaje_rpg p
INNER JOIN heroes_rpg s ON p.id_clase = s.id_clase
ORDER BY s.puntos_vida DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_clase AS entidad_principal,
    COUNT(s.id_heroe) AS total_registros,
    AVG(s.puntos_vida) AS promedio_metrica
FROM clases_personaje_rpg p
INNER JOIN heroes_rpg s ON p.id_clase = s.id_clase
GROUP BY p.nombre_clase
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_clase AS entidad_principal,
    COUNT(s.id_heroe) AS total_registros,
    AVG(s.puntos_vida) AS promedio_metrica
FROM clases_personaje_rpg p
INNER JOIN heroes_rpg s ON p.id_clase = s.id_clase
GROUP BY p.nombre_clase
HAVING COUNT(s.id_heroe) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_clase AS entidad_principal,
    COALESCE(s.nombre_heroe, 'Sin registros') AS detalle_asociado
FROM clases_personaje_rpg p
LEFT JOIN heroes_rpg s ON p.id_clase = s.id_clase
ORDER BY p.nombre_clase;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_heroe,
    s.puntos_vida,
    (SELECT p.nombre_clase FROM clases_personaje_rpg p WHERE p.id_clase = s.id_clase) AS entidad_origen
FROM heroes_rpg s
WHERE s.puntos_vida > (SELECT AVG(puntos_vida) FROM heroes_rpg)
ORDER BY s.puntos_vida DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_heroe AS nombre_elemento,
    p.nombre_clase AS categoria_principal,
    s.puntos_vida AS valor_destacado
FROM heroes_rpg s
INNER JOIN clases_personaje_rpg p ON s.id_clase = p.id_clase
ORDER BY s.puntos_vida DESC
LIMIT 5;
