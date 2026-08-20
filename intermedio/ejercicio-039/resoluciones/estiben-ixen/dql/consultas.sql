-- Consultas para Ejercicio 039 - FOREIGN KEY para kickboxing
-- Concepto principal: FOREIGN KEY
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.nombre AS nombre,
    s.id_gimnasio AS metrica
FROM gimnasios_kb p
INNER JOIN peleadores_kb s ON p.id_gimnasio = s.apodo
ORDER BY s.id_gimnasio DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_peleador) AS total_registros,
    AVG(s.id_gimnasio) AS promedio_metrica
FROM gimnasios_kb p
INNER JOIN peleadores_kb s ON p.id_gimnasio = s.apodo
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_peleador) AS total_registros,
    AVG(s.id_gimnasio) AS promedio_metrica
FROM gimnasios_kb p
INNER JOIN peleadores_kb s ON p.id_gimnasio = s.apodo
GROUP BY p.nombre
HAVING COUNT(s.id_peleador) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM gimnasios_kb p
LEFT JOIN peleadores_kb s ON p.id_gimnasio = s.apodo
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.id_gimnasio,
    (SELECT p.nombre FROM gimnasios_kb p WHERE p.id_gimnasio = s.apodo) AS entidad_origen
FROM peleadores_kb s
WHERE s.id_gimnasio > (SELECT AVG(id_gimnasio) FROM peleadores_kb)
ORDER BY s.id_gimnasio DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.id_gimnasio AS valor_destacado
FROM peleadores_kb s
INNER JOIN gimnasios_kb p ON s.apodo = p.id_gimnasio
ORDER BY s.id_gimnasio DESC
LIMIT 5;
