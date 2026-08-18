-- Consultas para Ejercicio 024 - FOREIGN KEY para soldadura
-- Concepto principal: FOREIGN KEY
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_taller AS nombre_taller,
    s.nombre_estructura AS nombre_estructura,
    s.tipo_material AS metrica
FROM talleres_metalmecanicos p
INNER JOIN proyectos_soldadura s ON p.id_taller = s.id_taller
ORDER BY s.tipo_material DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_taller AS entidad_principal,
    COUNT(s.id_proyecto) AS total_registros,
    AVG(s.tipo_material) AS promedio_metrica
FROM talleres_metalmecanicos p
INNER JOIN proyectos_soldadura s ON p.id_taller = s.id_taller
GROUP BY p.nombre_taller
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_taller AS entidad_principal,
    COUNT(s.id_proyecto) AS total_registros,
    AVG(s.tipo_material) AS promedio_metrica
FROM talleres_metalmecanicos p
INNER JOIN proyectos_soldadura s ON p.id_taller = s.id_taller
GROUP BY p.nombre_taller
HAVING COUNT(s.id_proyecto) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_taller AS entidad_principal,
    COALESCE(s.nombre_estructura, 'Sin registros') AS detalle_asociado
FROM talleres_metalmecanicos p
LEFT JOIN proyectos_soldadura s ON p.id_taller = s.id_taller
ORDER BY p.nombre_taller;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_estructura,
    s.tipo_material,
    (SELECT p.nombre_taller FROM talleres_metalmecanicos p WHERE p.id_taller = s.id_taller) AS entidad_origen
FROM proyectos_soldadura s
WHERE s.tipo_material > (SELECT AVG(tipo_material) FROM proyectos_soldadura)
ORDER BY s.tipo_material DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_estructura AS nombre_elemento,
    p.nombre_taller AS categoria_principal,
    s.tipo_material AS valor_destacado
FROM proyectos_soldadura s
INNER JOIN talleres_metalmecanicos p ON s.id_taller = p.id_taller
ORDER BY s.tipo_material DESC
LIMIT 5;
