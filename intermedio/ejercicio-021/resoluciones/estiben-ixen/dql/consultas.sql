-- Consultas para Ejercicio 021 - normalizacion 1FN para dibujo digital
-- Concepto principal: normalizacion 1FN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_artistico AS nombre_artistico,
    s.titulo AS titulo,
    s.cantidad_capas AS metrica
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
ORDER BY s.cantidad_capas DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_artistico AS entidad_principal,
    COUNT(s.id_obra) AS total_registros,
    AVG(s.cantidad_capas) AS promedio_metrica
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
GROUP BY p.nombre_artistico
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_artistico AS entidad_principal,
    COUNT(s.id_obra) AS total_registros,
    AVG(s.cantidad_capas) AS promedio_metrica
FROM ilustradores_digitales p
INNER JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
GROUP BY p.nombre_artistico
HAVING COUNT(s.id_obra) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_artistico AS entidad_principal,
    COALESCE(s.titulo, 'Sin registros') AS detalle_asociado
FROM ilustradores_digitales p
LEFT JOIN obras_digitales s ON p.id_ilustrador = s.id_ilustrador
ORDER BY p.nombre_artistico;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.titulo,
    s.cantidad_capas,
    (SELECT p.nombre_artistico FROM ilustradores_digitales p WHERE p.id_ilustrador = s.id_ilustrador) AS entidad_origen
FROM obras_digitales s
WHERE s.cantidad_capas > (SELECT AVG(cantidad_capas) FROM obras_digitales)
ORDER BY s.cantidad_capas DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.titulo AS nombre_elemento,
    p.nombre_artistico AS categoria_principal,
    s.cantidad_capas AS valor_destacado
FROM obras_digitales s
INNER JOIN ilustradores_digitales p ON s.id_ilustrador = p.id_ilustrador
ORDER BY s.cantidad_capas DESC
LIMIT 5;
