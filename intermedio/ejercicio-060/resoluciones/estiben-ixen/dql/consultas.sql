-- Consultas para Ejercicio 060 - carga de datos para equipo de streaming
-- Concepto principal: carga de datos
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nickname AS nickname,
    s.nombre_hardware AS nombre_hardware,
    s.marca AS metrica
FROM canales_streamers p
INNER JOIN dispositivos_setup s ON p.id_streamer = s.id_streamer
ORDER BY s.marca DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nickname AS entidad_principal,
    COUNT(s.id_dispositivo) AS total_registros,
    AVG(s.marca) AS promedio_metrica
FROM canales_streamers p
INNER JOIN dispositivos_setup s ON p.id_streamer = s.id_streamer
GROUP BY p.nickname
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nickname AS entidad_principal,
    COUNT(s.id_dispositivo) AS total_registros,
    AVG(s.marca) AS promedio_metrica
FROM canales_streamers p
INNER JOIN dispositivos_setup s ON p.id_streamer = s.id_streamer
GROUP BY p.nickname
HAVING COUNT(s.id_dispositivo) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nickname AS entidad_principal,
    COALESCE(s.nombre_hardware, 'Sin registros') AS detalle_asociado
FROM canales_streamers p
LEFT JOIN dispositivos_setup s ON p.id_streamer = s.id_streamer
ORDER BY p.nickname;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_hardware,
    s.marca,
    (SELECT p.nickname FROM canales_streamers p WHERE p.id_streamer = s.id_streamer) AS entidad_origen
FROM dispositivos_setup s
WHERE s.marca > (SELECT AVG(marca) FROM dispositivos_setup)
ORDER BY s.marca DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_hardware AS nombre_elemento,
    p.nickname AS categoria_principal,
    s.marca AS valor_destacado
FROM dispositivos_setup s
INNER JOIN canales_streamers p ON s.id_streamer = p.id_streamer
ORDER BY s.marca DESC
LIMIT 5;
