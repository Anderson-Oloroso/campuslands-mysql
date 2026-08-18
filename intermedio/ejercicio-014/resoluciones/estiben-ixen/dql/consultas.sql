-- Consultas para Ejercicio 014 - vistas simples para saga de ciencia ficcion
-- Concepto principal: vistas simples
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_faccion AS nombre_faccion,
    s.nombre_nave AS nombre_nave,
    s.tripulacion_max AS metrica
FROM facciones_scifi p
INNER JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
ORDER BY s.tripulacion_max DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_faccion AS entidad_principal,
    COUNT(s.id_nave) AS total_registros,
    AVG(s.tripulacion_max) AS promedio_metrica
FROM facciones_scifi p
INNER JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
GROUP BY p.nombre_faccion
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_faccion AS entidad_principal,
    COUNT(s.id_nave) AS total_registros,
    AVG(s.tripulacion_max) AS promedio_metrica
FROM facciones_scifi p
INNER JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
GROUP BY p.nombre_faccion
HAVING COUNT(s.id_nave) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_faccion AS entidad_principal,
    COALESCE(s.nombre_nave, 'Sin registros') AS detalle_asociado
FROM facciones_scifi p
LEFT JOIN naves_espaciales s ON p.id_faccion = s.id_faccion
ORDER BY p.nombre_faccion;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_nave,
    s.tripulacion_max,
    (SELECT p.nombre_faccion FROM facciones_scifi p WHERE p.id_faccion = s.id_faccion) AS entidad_origen
FROM naves_espaciales s
WHERE s.tripulacion_max > (SELECT AVG(tripulacion_max) FROM naves_espaciales)
ORDER BY s.tripulacion_max DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_nave AS nombre_elemento,
    p.nombre_faccion AS categoria_principal,
    s.tripulacion_max AS valor_destacado
FROM naves_espaciales s
INNER JOIN facciones_scifi p ON s.id_faccion = p.id_faccion
ORDER BY s.tripulacion_max DESC
LIMIT 5;
