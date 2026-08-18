-- Consultas para Ejercicio 033 - GROUP BY para inventario de skins shooter
-- Concepto principal: GROUP BY
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.nombre_skin AS nombre_skin,
    s.precio AS metrica
FROM armas_shooter p
INNER JOIN skins_inventario s ON p.id_arma = s.id_arma
ORDER BY s.precio DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_skin) AS total_registros,
    AVG(s.precio) AS promedio_metrica
FROM armas_shooter p
INNER JOIN skins_inventario s ON p.id_arma = s.id_arma
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_skin) AS total_registros,
    AVG(s.precio) AS promedio_metrica
FROM armas_shooter p
INNER JOIN skins_inventario s ON p.id_arma = s.id_arma
GROUP BY p.nombre
HAVING COUNT(s.id_skin) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.nombre_skin, 'Sin registros') AS detalle_asociado
FROM armas_shooter p
LEFT JOIN skins_inventario s ON p.id_arma = s.id_arma
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_skin,
    s.precio,
    (SELECT p.nombre FROM armas_shooter p WHERE p.id_arma = s.id_arma) AS entidad_origen
FROM skins_inventario s
WHERE s.precio > (SELECT AVG(precio) FROM skins_inventario)
ORDER BY s.precio DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_skin AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.precio AS valor_destacado
FROM skins_inventario s
INNER JOIN armas_shooter p ON s.id_arma = p.id_arma
ORDER BY s.precio DESC
LIMIT 5;
