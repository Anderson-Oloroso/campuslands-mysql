-- Consultas para Ejercicio 032 - LEFT JOIN para ranking battle royale
-- Concepto principal: LEFT JOIN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nickname AS nickname,
    s.id_jugador AS id_jugador,
    s.eliminaciones AS metrica
FROM jugadores_br p
INNER JOIN partidas_br s ON p.id_jugador = s.mapa
ORDER BY s.eliminaciones DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nickname AS entidad_principal,
    COUNT(s.id_partida) AS total_registros,
    AVG(s.eliminaciones) AS promedio_metrica
FROM jugadores_br p
INNER JOIN partidas_br s ON p.id_jugador = s.mapa
GROUP BY p.nickname
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nickname AS entidad_principal,
    COUNT(s.id_partida) AS total_registros,
    AVG(s.eliminaciones) AS promedio_metrica
FROM jugadores_br p
INNER JOIN partidas_br s ON p.id_jugador = s.mapa
GROUP BY p.nickname
HAVING COUNT(s.id_partida) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nickname AS entidad_principal,
    COALESCE(s.id_jugador, 'Sin registros') AS detalle_asociado
FROM jugadores_br p
LEFT JOIN partidas_br s ON p.id_jugador = s.mapa
ORDER BY p.nickname;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.id_jugador,
    s.eliminaciones,
    (SELECT p.nickname FROM jugadores_br p WHERE p.id_jugador = s.mapa) AS entidad_origen
FROM partidas_br s
WHERE s.eliminaciones > (SELECT AVG(eliminaciones) FROM partidas_br)
ORDER BY s.eliminaciones DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.id_jugador AS nombre_elemento,
    p.nickname AS categoria_principal,
    s.eliminaciones AS valor_destacado
FROM partidas_br s
INNER JOIN jugadores_br p ON s.mapa = p.id_jugador
ORDER BY s.eliminaciones DESC
LIMIT 5;
