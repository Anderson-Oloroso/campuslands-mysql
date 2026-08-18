-- Consultas para Ejercicio 041 - CHECK para pingpong
-- Concepto principal: CHECK
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.nombre AS nombre,
    s.id_club AS metrica
FROM clubes_pingpong p
INNER JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
ORDER BY s.id_club DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_club) AS promedio_metrica
FROM clubes_pingpong p
INNER JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_club) AS promedio_metrica
FROM clubes_pingpong p
INNER JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
GROUP BY p.nombre
HAVING COUNT(s.id_jugador) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM clubes_pingpong p
LEFT JOIN jugadores_pingpong s ON p.id_club = s.mano_habil
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.id_club,
    (SELECT p.nombre FROM clubes_pingpong p WHERE p.id_club = s.mano_habil) AS entidad_origen
FROM jugadores_pingpong s
WHERE s.id_club > (SELECT AVG(id_club) FROM jugadores_pingpong)
ORDER BY s.id_club DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.id_club AS valor_destacado
FROM jugadores_pingpong s
INNER JOIN clubes_pingpong p ON s.mano_habil = p.id_club
ORDER BY s.id_club DESC
LIMIT 5;
