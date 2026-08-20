-- Consultas para Ejercicio 031 - INNER JOIN para torneo esports MOBA
-- Concepto principal: INNER JOIN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.nombre AS nombre,
    s.id_escuadra AS metrica
FROM escuadras p
INNER JOIN jugadores_moba s ON p.id_escuadra = s.nickname
ORDER BY s.id_escuadra DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_escuadra) AS promedio_metrica
FROM escuadras p
INNER JOIN jugadores_moba s ON p.id_escuadra = s.nickname
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_escuadra) AS promedio_metrica
FROM escuadras p
INNER JOIN jugadores_moba s ON p.id_escuadra = s.nickname
GROUP BY p.nombre
HAVING COUNT(s.id_jugador) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM escuadras p
LEFT JOIN jugadores_moba s ON p.id_escuadra = s.nickname
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.id_escuadra,
    (SELECT p.nombre FROM escuadras p WHERE p.id_escuadra = s.nickname) AS entidad_origen
FROM jugadores_moba s
WHERE s.id_escuadra > (SELECT AVG(id_escuadra) FROM jugadores_moba)
ORDER BY s.id_escuadra DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.id_escuadra AS valor_destacado
FROM jugadores_moba s
INNER JOIN escuadras p ON s.nickname = p.id_escuadra
ORDER BY s.id_escuadra DESC
LIMIT 5;
