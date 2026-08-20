-- Consultas para Ejercicio 035 - subconsultas para taller mecanico de motos
-- Concepto principal: subconsultas
USE campuslands_mysql;

-- 1. Consulta con INNER JOIN entre entidades relacionadas
SELECT 
    p.nombre AS nombre,
    s.moto AS moto,
    s.descripcion AS metrica
FROM mecanicos p
INNER JOIN servicios_taller s ON p.id_mecanico = s.id_mecanico
ORDER BY s.descripcion DESC;

-- 2. Conteo y promedio agrupado (GROUP BY)
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_servicio) AS total_registros,
    AVG(s.descripcion) AS promedio_metrica
FROM mecanicos p
INNER JOIN servicios_taller s ON p.id_mecanico = s.id_mecanico
GROUP BY p.nombre
ORDER BY promedio_metrica DESC;

-- 3. Filtro de agregacion con HAVING
SELECT 
    p.nombre AS entidad_principal,
    COUNT(s.id_servicio) AS total_registros,
    AVG(s.descripcion) AS promedio_metrica
FROM mecanicos p
INNER JOIN servicios_taller s ON p.id_mecanico = s.id_mecanico
GROUP BY p.nombre
HAVING COUNT(s.id_servicio) >= 2
ORDER BY total_registros DESC;

-- 4. Consulta con LEFT JOIN para detectar entidades sin registros asociados
SELECT 
    p.nombre AS entidad_principal,
    COALESCE(s.moto, 'Sin registros') AS detalle_asociado
FROM mecanicos p
LEFT JOIN servicios_taller s ON p.id_mecanico = s.id_mecanico
ORDER BY p.nombre;

-- 5. Subconsulta para obtener registros con metrica superior al promedio general
SELECT 
    s.moto,
    s.descripcion,
    (SELECT p.nombre FROM mecanicos p WHERE p.id_mecanico = s.id_mecanico) AS entidad_origen
FROM servicios_taller s
WHERE s.descripcion > (SELECT AVG(descripcion) FROM servicios_taller)
ORDER BY s.descripcion DESC;

-- 6. Consulta de ranking o top desempeno
SELECT 
    s.moto AS nombre_elemento,
    p.nombre AS categoria_principal,
    s.descripcion AS valor_destacado
FROM servicios_taller s
INNER JOIN mecanicos p ON s.id_mecanico = p.id_mecanico
ORDER BY s.descripcion DESC
LIMIT 5;
