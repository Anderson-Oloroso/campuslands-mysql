-- Consultas para Ejercicio 047 - LEFT JOIN para tienda de ropa
-- Concepto principal: LEFT JOIN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_marca AS nombre_marca,
    s.nombre_articulo AS nombre_articulo,
    s.color AS metrica
FROM marcas_ropa p
INNER JOIN prendas_vestir s ON p.id_marca = s.id_marca
ORDER BY s.color DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_marca AS entidad_principal,
    COUNT(s.id_prenda) AS total_registros,
    AVG(s.color) AS promedio_metrica
FROM marcas_ropa p
INNER JOIN prendas_vestir s ON p.id_marca = s.id_marca
GROUP BY p.nombre_marca
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_marca AS entidad_principal,
    COUNT(s.id_prenda) AS total_registros,
    AVG(s.color) AS promedio_metrica
FROM marcas_ropa p
INNER JOIN prendas_vestir s ON p.id_marca = s.id_marca
GROUP BY p.nombre_marca
HAVING COUNT(s.id_prenda) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_marca AS entidad_principal,
    COALESCE(s.nombre_articulo, 'Sin registros') AS detalle_asociado
FROM marcas_ropa p
LEFT JOIN prendas_vestir s ON p.id_marca = s.id_marca
ORDER BY p.nombre_marca;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_articulo,
    s.color,
    (SELECT p.nombre_marca FROM marcas_ropa p WHERE p.id_marca = s.id_marca) AS entidad_origen
FROM prendas_vestir s
WHERE s.color > (SELECT AVG(color) FROM prendas_vestir)
ORDER BY s.color DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_articulo AS nombre_elemento,
    p.nombre_marca AS categoria_principal,
    s.color AS valor_destacado
FROM prendas_vestir s
INNER JOIN marcas_ropa p ON s.id_marca = p.id_marca
ORDER BY s.color DESC
LIMIT 5;
