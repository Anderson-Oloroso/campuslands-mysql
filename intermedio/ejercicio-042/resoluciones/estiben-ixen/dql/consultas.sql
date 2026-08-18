-- Consultas para Ejercicio 042 - consultas de reportes para playlist musical
-- Concepto principal: consultas de reportes
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_artistico AS nombre_artistico,
    s.titulo AS titulo,
    s.duracion_segundos AS metrica
FROM artistas_musicales p
INNER JOIN canciones_playlist s ON p.id_artista = s.id_artista
ORDER BY s.duracion_segundos DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_artistico AS entidad_principal,
    COUNT(s.id_cancion) AS total_registros,
    AVG(s.duracion_segundos) AS promedio_metrica
FROM artistas_musicales p
INNER JOIN canciones_playlist s ON p.id_artista = s.id_artista
GROUP BY p.nombre_artistico
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_artistico AS entidad_principal,
    COUNT(s.id_cancion) AS total_registros,
    AVG(s.duracion_segundos) AS promedio_metrica
FROM artistas_musicales p
INNER JOIN canciones_playlist s ON p.id_artista = s.id_artista
GROUP BY p.nombre_artistico
HAVING COUNT(s.id_cancion) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_artistico AS entidad_principal,
    COALESCE(s.titulo, 'Sin registros') AS detalle_asociado
FROM artistas_musicales p
LEFT JOIN canciones_playlist s ON p.id_artista = s.id_artista
ORDER BY p.nombre_artistico;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.titulo,
    s.duracion_segundos,
    (SELECT p.nombre_artistico FROM artistas_musicales p WHERE p.id_artista = s.id_artista) AS entidad_origen
FROM canciones_playlist s
WHERE s.duracion_segundos > (SELECT AVG(duracion_segundos) FROM canciones_playlist)
ORDER BY s.duracion_segundos DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.titulo AS nombre_elemento,
    p.nombre_artistico AS categoria_principal,
    s.duracion_segundos AS valor_destacado
FROM canciones_playlist s
INNER JOIN artistas_musicales p ON s.id_artista = p.id_artista
ORDER BY s.duracion_segundos DESC
LIMIT 5;
