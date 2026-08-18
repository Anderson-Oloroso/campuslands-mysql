-- Consultas para Ejercicio 055 - UNIQUE para laboratorio de formulas quimicas
-- Concepto principal: UNIQUE
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre_laboratorio AS nombre_laboratorio,
    s.nombre_quimico AS nombre_quimico,
    s.pureza_porcentaje AS metrica
FROM laboratorios_quimicos p
INNER JOIN reactivos_quimicos s ON p.id_laboratorio = s.id_laboratorio
ORDER BY s.pureza_porcentaje DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre_laboratorio AS entidad_principal,
    COUNT(s.id_reactivo) AS total_registros,
    AVG(s.pureza_porcentaje) AS promedio_metrica
FROM laboratorios_quimicos p
INNER JOIN reactivos_quimicos s ON p.id_laboratorio = s.id_laboratorio
GROUP BY p.nombre_laboratorio
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre_laboratorio AS entidad_principal,
    COUNT(s.id_reactivo) AS total_registros,
    AVG(s.pureza_porcentaje) AS promedio_metrica
FROM laboratorios_quimicos p
INNER JOIN reactivos_quimicos s ON p.id_laboratorio = s.id_laboratorio
GROUP BY p.nombre_laboratorio
HAVING COUNT(s.id_reactivo) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre_laboratorio AS entidad_principal,
    COALESCE(s.nombre_quimico, 'Sin registros') AS detalle_asociado
FROM laboratorios_quimicos p
LEFT JOIN reactivos_quimicos s ON p.id_laboratorio = s.id_laboratorio
ORDER BY p.nombre_laboratorio;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.nombre_quimico,
    s.pureza_porcentaje,
    (SELECT p.nombre_laboratorio FROM laboratorios_quimicos p WHERE p.id_laboratorio = s.id_laboratorio) AS entidad_origen
FROM reactivos_quimicos s
WHERE s.pureza_porcentaje > (SELECT AVG(pureza_porcentaje) FROM reactivos_quimicos)
ORDER BY s.pureza_porcentaje DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.nombre_quimico AS nombre_elemento,
    p.nombre_laboratorio AS categoria_principal,
    s.pureza_porcentaje AS valor_destacado
FROM reactivos_quimicos s
INNER JOIN laboratorios_quimicos p ON s.id_laboratorio = p.id_laboratorio
ORDER BY s.pureza_porcentaje DESC
LIMIT 5;
