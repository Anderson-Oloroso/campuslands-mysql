-- Consultas para Ejercicio 027 - consultas de reportes para videojuego de accion y aventura
-- Concepto principal: consultas de reportes
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_reino AS nombre_reino,
    s.nombre_artefacto AS nombre_artefacto,
    s.poder_ataque AS metrica
FROM reinos_aventura p
INNER JOIN artefactos_magicos s ON p.id_reino = s.id_reino
ORDER BY s.poder_ataque DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_reino AS entidad_principal,
    COUNT(s.id_artefacto) AS total_registros,
    AVG(s.poder_ataque) AS promedio_metrica
FROM reinos_aventura p
INNER JOIN artefactos_magicos s ON p.id_reino = s.id_reino
GROUP BY p.nombre_reino
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_reino AS entidad_principal,
    COUNT(s.id_artefacto) AS total_registros,
    AVG(s.poder_ataque) AS promedio_metrica
FROM reinos_aventura p
INNER JOIN artefactos_magicos s ON p.id_reino = s.id_reino
GROUP BY p.nombre_reino
HAVING COUNT(s.id_artefacto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_reino AS entidad_principal,
    COALESCE(s.nombre_artefacto, 'Sin registros') AS detalle_asociado
FROM reinos_aventura p
LEFT JOIN artefactos_magicos s ON p.id_reino = s.id_reino
ORDER BY p.nombre_reino;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_artefacto,
    s.poder_ataque,
    (SELECT p.nombre_reino FROM reinos_aventura p WHERE p.id_reino = s.id_reino) AS entidad_origen
FROM artefactos_magicos s
WHERE s.poder_ataque > (SELECT AVG(poder_ataque) FROM artefactos_magicos)
ORDER BY s.poder_ataque DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_artefacto AS nombre_elemento,
    p.nombre_reino AS categoria_principal,
    s.poder_ataque AS valor_destacado
FROM artefactos_magicos s
INNER JOIN reinos_aventura p ON s.id_reino = p.id_reino
ORDER BY s.poder_ataque DESC
LIMIT 5;
