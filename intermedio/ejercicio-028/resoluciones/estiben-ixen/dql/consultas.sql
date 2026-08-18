-- Consultas para Ejercicio 028 - tablas puente para academia tech
-- Concepto principal: tablas puente
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_ruta AS nombre_ruta,
    s.nombre AS nombre,
    s.promedio_acumulado AS metrica
FROM rutas_aprendizaje p
INNER JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
ORDER BY s.promedio_acumulado DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_ruta AS entidad_principal,
    COUNT(s.id_camper) AS total_registros,
    AVG(s.promedio_acumulado) AS promedio_metrica
FROM rutas_aprendizaje p
INNER JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
GROUP BY p.nombre_ruta
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_ruta AS entidad_principal,
    COUNT(s.id_camper) AS total_registros,
    AVG(s.promedio_acumulado) AS promedio_metrica
FROM rutas_aprendizaje p
INNER JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
GROUP BY p.nombre_ruta
HAVING COUNT(s.id_camper) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_ruta AS entidad_principal,
    COALESCE(s.nombre, 'Sin registros') AS detalle_asociado
FROM rutas_aprendizaje p
LEFT JOIN campers_estudiantes s ON p.id_ruta = s.id_ruta
ORDER BY p.nombre_ruta;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre,
    s.promedio_acumulado,
    (SELECT p.nombre_ruta FROM rutas_aprendizaje p WHERE p.id_ruta = s.id_ruta) AS entidad_origen
FROM campers_estudiantes s
WHERE s.promedio_acumulado > (SELECT AVG(promedio_acumulado) FROM campers_estudiantes)
ORDER BY s.promedio_acumulado DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre AS nombre_elemento,
    p.nombre_ruta AS categoria_principal,
    s.promedio_acumulado AS valor_destacado
FROM campers_estudiantes s
INNER JOIN rutas_aprendizaje p ON s.id_ruta = p.id_ruta
ORDER BY s.promedio_acumulado DESC
LIMIT 5;
