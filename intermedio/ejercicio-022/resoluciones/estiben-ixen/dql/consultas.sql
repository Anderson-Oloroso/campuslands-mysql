-- Consultas para Ejercicio 022 - normalizacion 2FN para animacion 3D
-- Concepto principal: normalizacion 2FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_estudio AS nombre_estudio,
    s.nombre_modelo AS nombre_modelo,
    s.poligonos_count AS metrica
FROM estudios_animacion p
INNER JOIN personajes_3d s ON p.id_estudio = s.id_estudio
ORDER BY s.poligonos_count DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_estudio AS entidad_principal,
    COUNT(s.id_personaje) AS total_registros,
    AVG(s.poligonos_count) AS promedio_metrica
FROM estudios_animacion p
INNER JOIN personajes_3d s ON p.id_estudio = s.id_estudio
GROUP BY p.nombre_estudio
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_estudio AS entidad_principal,
    COUNT(s.id_personaje) AS total_registros,
    AVG(s.poligonos_count) AS promedio_metrica
FROM estudios_animacion p
INNER JOIN personajes_3d s ON p.id_estudio = s.id_estudio
GROUP BY p.nombre_estudio
HAVING COUNT(s.id_personaje) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_estudio AS entidad_principal,
    COALESCE(s.nombre_modelo, 'Sin registros') AS detalle_asociado
FROM estudios_animacion p
LEFT JOIN personajes_3d s ON p.id_estudio = s.id_estudio
ORDER BY p.nombre_estudio;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_modelo,
    s.poligonos_count,
    (SELECT p.nombre_estudio FROM estudios_animacion p WHERE p.id_estudio = s.id_estudio) AS entidad_origen
FROM personajes_3d s
WHERE s.poligonos_count > (SELECT AVG(poligonos_count) FROM personajes_3d)
ORDER BY s.poligonos_count DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_modelo AS nombre_elemento,
    p.nombre_estudio AS categoria_principal,
    s.poligonos_count AS valor_destacado
FROM personajes_3d s
INNER JOIN estudios_animacion p ON s.id_estudio = p.id_estudio
ORDER BY s.poligonos_count DESC
LIMIT 5;
