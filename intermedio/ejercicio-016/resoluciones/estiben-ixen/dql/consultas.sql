-- Consultas para Ejercicio 016 - INNER JOIN para restaurante de comida urbana
-- Concepto principal: INNER JOIN
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_categoria AS nombre_categoria,
    s.nombre_platillo AS nombre_platillo,
    s.tiempo_preparacion_min AS metrica
FROM categorias_menu p
INNER JOIN platillos_urbanos s ON p.id_categoria = s.id_categoria
ORDER BY s.tiempo_preparacion_min DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_categoria AS entidad_principal,
    COUNT(s.id_platillo) AS total_registros,
    AVG(s.tiempo_preparacion_min) AS promedio_metrica
FROM categorias_menu p
INNER JOIN platillos_urbanos s ON p.id_categoria = s.id_categoria
GROUP BY p.nombre_categoria
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_categoria AS entidad_principal,
    COUNT(s.id_platillo) AS total_registros,
    AVG(s.tiempo_preparacion_min) AS promedio_metrica
FROM categorias_menu p
INNER JOIN platillos_urbanos s ON p.id_categoria = s.id_categoria
GROUP BY p.nombre_categoria
HAVING COUNT(s.id_platillo) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_categoria AS entidad_principal,
    COALESCE(s.nombre_platillo, 'Sin registros') AS detalle_asociado
FROM categorias_menu p
LEFT JOIN platillos_urbanos s ON p.id_categoria = s.id_categoria
ORDER BY p.nombre_categoria;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_platillo,
    s.tiempo_preparacion_min,
    (SELECT p.nombre_categoria FROM categorias_menu p WHERE p.id_categoria = s.id_categoria) AS entidad_origen
FROM platillos_urbanos s
WHERE s.tiempo_preparacion_min > (SELECT AVG(tiempo_preparacion_min) FROM platillos_urbanos)
ORDER BY s.tiempo_preparacion_min DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_platillo AS nombre_elemento,
    p.nombre_categoria AS categoria_principal,
    s.tiempo_preparacion_min AS valor_destacado
FROM platillos_urbanos s
INNER JOIN categorias_menu p ON s.id_categoria = p.id_categoria
ORDER BY s.tiempo_preparacion_min DESC
LIMIT 5;
