-- Consultas para Ejercicio 037 - normalizacion 2FN para liga de futbol
-- Concepto principal: normalizacion 2FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_club AS nombre_club,
    s.nombre AS nombre,
    s.id_club AS metrica
FROM clubes_futbol p
INNER JOIN futbolistas s ON p.id_club = s.posicion
ORDER BY s.id_club DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_club AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_club) AS promedio_metrica
FROM clubes_futbol p
INNER JOIN futbolistas s ON p.id_club = s.posicion
GROUP BY p.nombre_club
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_club AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.id_club) AS promedio_metrica
FROM clubes_futbol p
INNER JOIN futbolistas s ON p.id_club = s.posicion
GROUP BY p.nombre_club
HAVING COUNT(s.id_jugador) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_club AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM clubes_futbol p
LEFT JOIN futbolistas s ON p.id_club = s.posicion
ORDER BY p.nombre_club;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.id_club,
    (SELECT p.nombre_club FROM clubes_futbol p WHERE p.id_club = s.posicion) AS entidad_origen
FROM futbolistas s
WHERE s.id_club > (SELECT AVG(id_club) FROM futbolistas)
ORDER BY s.id_club DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre_club AS categoria_principal,
    s.id_club AS valor_destacado
FROM futbolistas s
INNER JOIN clubes_futbol p ON s.posicion = p.id_club
ORDER BY s.id_club DESC
LIMIT 5;
