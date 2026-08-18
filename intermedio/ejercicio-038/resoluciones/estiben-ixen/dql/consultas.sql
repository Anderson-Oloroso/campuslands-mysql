-- Consultas para Ejercicio 038 - normalizacion 3FN para futbol sala
-- Concepto principal: normalizacion 3FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.nombre AS nombre,
    s.goles AS metrica
FROM equipos_futsal p
INNER JOIN jugadores_futsal s ON p.id_equipo = s.id_equipo
ORDER BY s.goles DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.goles) AS promedio_metrica
FROM equipos_futsal p
INNER JOIN jugadores_futsal s ON p.id_equipo = s.id_equipo
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_jugador) AS total_registros,
    AVG(s.goles) AS promedio_metrica
FROM equipos_futsal p
INNER JOIN jugadores_futsal s ON p.id_equipo = s.id_equipo
GROUP BY p.nombre
HAVING COUNT(s.id_jugador) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM equipos_futsal p
LEFT JOIN jugadores_futsal s ON p.id_equipo = s.id_equipo
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.goles,
    (SELECT p.nombre FROM equipos_futsal p WHERE p.id_equipo = s.id_equipo) AS entidad_origen
FROM jugadores_futsal s
WHERE s.goles > (SELECT AVG(goles) FROM jugadores_futsal)
ORDER BY s.goles DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.goles AS valor_destacado
FROM jugadores_futsal s
INNER JOIN equipos_futsal p ON s.id_equipo = p.id_equipo
ORDER BY s.goles DESC
LIMIT 5;
