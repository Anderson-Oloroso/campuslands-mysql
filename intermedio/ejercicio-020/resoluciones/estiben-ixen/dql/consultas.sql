-- Consultas para Ejercicio 020 - subconsultas para estudio de tatuajes
-- Concepto principal: subconsultas
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.cliente AS cliente,
    s.horas_sesion AS metrica
FROM artistas_tatuadores p
INNER JOIN citas_tatuajes s ON p.id_artista = s.id_artista
ORDER BY s.horas_sesion DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_cita) AS total_registros,
    AVG(s.horas_sesion) AS promedio_metrica
FROM artistas_tatuadores p
INNER JOIN citas_tatuajes s ON p.id_artista = s.id_artista
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_cita) AS total_registros,
    AVG(s.horas_sesion) AS promedio_metrica
FROM artistas_tatuadores p
INNER JOIN citas_tatuajes s ON p.id_artista = s.id_artista
GROUP BY p.nombre
HAVING COUNT(s.id_cita) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.cliente, 'Sin registros') AS detalle_asociado
FROM artistas_tatuadores p
LEFT JOIN citas_tatuajes s ON p.id_artista = s.id_artista
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.cliente,
    s.horas_sesion,
    (SELECT p.nombre FROM artistas_tatuadores p WHERE p.id_artista = s.id_artista) AS entidad_origen
FROM citas_tatuajes s
WHERE s.horas_sesion > (SELECT AVG(horas_sesion) FROM citas_tatuajes)
ORDER BY s.horas_sesion DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.cliente AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.horas_sesion AS valor_destacado
FROM citas_tatuajes s
INNER JOIN artistas_tatuadores p ON s.id_artista = p.id_artista
ORDER BY s.horas_sesion DESC
LIMIT 5;
