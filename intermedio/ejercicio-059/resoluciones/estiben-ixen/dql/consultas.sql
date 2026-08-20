-- Consultas para Ejercicio 059 - vistas simples para marketplace de accesorios
-- Concepto principal: vistas simples
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_tienda AS nombre_tienda,
    s.nombre_producto AS nombre_producto,
    s.precio AS metrica
FROM vendedores_marketplace p
INNER JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
ORDER BY s.precio DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_tienda AS entidad_principal,
    COUNT(s.id_producto) AS total_registros,
    AVG(s.precio) AS promedio_metrica
FROM vendedores_marketplace p
INNER JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
GROUP BY p.nombre_tienda
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_tienda AS entidad_principal,
    COUNT(s.id_producto) AS total_registros,
    AVG(s.precio) AS promedio_metrica
FROM vendedores_marketplace p
INNER JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
GROUP BY p.nombre_tienda
HAVING COUNT(s.id_producto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_tienda AS entidad_principal,
    COALESCE(s.nombre_producto, 'Sin registros') AS detalle_asociado
FROM vendedores_marketplace p
LEFT JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
ORDER BY p.nombre_tienda;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_producto,
    s.precio,
    (SELECT p.nombre_tienda FROM vendedores_marketplace p WHERE p.id_vendedor = s.id_vendedor) AS entidad_origen
FROM productos_accesorios s
WHERE s.precio > (SELECT AVG(precio) FROM productos_accesorios)
ORDER BY s.precio DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_producto AS nombre_elemento,
    p.nombre_tienda AS categoria_principal,
    s.precio AS valor_destacado
FROM productos_accesorios s
INNER JOIN vendedores_marketplace p ON s.id_vendedor = p.id_vendedor
ORDER BY s.precio DESC
LIMIT 5;
